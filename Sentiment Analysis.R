library(dplyr)
library(tidytext)
library(reshape2)
library(stringr)
library(tidyr)
library(ggplot2)

#Sentiments
get_sentiments("afinn")
get_sentiments("nrc")
get_sentiments("bing")

# Read the CSV file
df_complaints <- read.csv("~/Documents/DATA/Data 332/files given/Sentiment Analysis/Consumer_Complaints.csv")

# Filter out blank and response less complaints
df_complaints <- df_complaints %>%
  filter(Consumer.complaint.narrative != "" & Company.public.response != "")
# Rename the complaint column
df_complaints <- df_complaints %>%
  rename(Complain = Consumer.complaint.narrative)
# Create new table containing Product, Complain, and Company columns
new_table <- df_complaints %>%
  select(Product, Complain, Company)

# Clean the text: remove punctuation, numbers, and extra spaces
mutate(Complain = str_replace_all(Complain, "[[:punct:]]", "") %>%
         str_remove_all("\\d+") %>%
         str_squish()) %>%
  # Tokenize the complaints into individual words after cleaning
tidy_complaints <- new_table %>%
  unnest_tokens(word, Complain) %>%
  # Remove stop words, unnecessary characters, single characters, and numbers
  anti_join(stop_words, by = "word") %>%
  filter(!grepl("[^[:alnum:][:space:]]", word)) %>%
  filter(nchar(word) > 1) %>%
  filter(!grepl("\\d+", word))


# Load stop words to remove common words
data("stop_words")

# Tokenize the complaints into individual words
tidy_complaints <- new_table %>%
  group_by(Product) %>%
  mutate(linenumber = row_number()) %>%
  ungroup() %>%
  unnest_tokens(word, Complain)

# common joy words in products
nrc_joy <- get_sentiments("nrc") %>%
  filter(sentiment == "joy")

tidy_complaints %>%
  filter(Product == "Credit card") %>%
  inner_join(nrc_joy) %>%
  count(word, sort = TRUE)

#negative and positive sentiment in separate columns
product_sentiment <- tidy_complaints %>%
  inner_join(get_sentiments("bing"), by = "word", relationship = "many-to-many") %>%
  count(Product, index = linenumber %/% 0.25, sentiment) %>%
  pivot_wider(names_from = sentiment, values_from = n, values_fill = 0) %>%
  mutate(sentiment = positive - negative)

ggplot(product_sentiment, aes(index, sentiment, fill = Product)) +
  geom_col(show.legend = FALSE) +
  facet_wrap(~Product, ncol = 2, scales = "free_x")

# Comparing the three sentiment dictionaries
afinn <- tidy_complaints %>% 
  inner_join(get_sentiments("afinn"), by = c("word" = "word"), suffix = c("_complaint", "_lexicon"), relationship = "many-to-many") %>% 
  group_by(index = linenumber %/% 80) %>% 
  summarise(sentiment = sum(value)) %>% 
  mutate(method = "AFINN")

bing_and_nrc <- bind_rows(
  tidy_complaints %>% 
    inner_join(get_sentiments("bing"), by = c("word" = "word"), suffix = c("_complaint", "_lexicon"), relationship = "many-to-many") %>%
    mutate(method = "Bing et al."),
  tidy_complaints %>% 
    inner_join(get_sentiments("nrc") %>% 
                 filter(sentiment %in% c("positive", "negative")), by = c("word" = "word"), suffix = c("_complaint", "_lexicon"), relationship = "many-to-many") %>%
    mutate(method = "NRC")) %>%
  count(method, index = linenumber %/% 80, sentiment) %>%
  pivot_wider(names_from = sentiment,
              values_from = n,
              values_fill = 0) %>% 
  mutate(sentiment = positive - negative)
#visualizing the estimate of the net sentiment (positive - negative)
bind_rows(afinn, 
          bing_and_nrc) %>%
  ggplot(aes(index, sentiment, fill = method)) +
  geom_col(show.legend = FALSE) +
  facet_wrap(~method, ncol = 1, scales = "free_y")

#  how many positive and negative words are in these lexicons.
#nrc
get_sentiments("nrc") %>% 
  filter(sentiment %in% c("positive", "negative")) %>% 
  count(sentiment)
#bing
get_sentiments("bing") %>% 
count(sentiment)

#To answer the most negative wod reciveing Products in the company.
bingnegative <- get_sentiments("bing") %>% 
  filter(sentiment == "negative")

wordcounts <- tidy_complaints %>%
  group_by(Company, Product) %>%
  summarize(words = n())

tidy_complaints %>%
  semi_join(bingnegative) %>%
  group_by(Company, Product) %>%
  summarize(negativewords = n()) %>%
  left_join(wordcounts, by = c("Company", "Product")) %>%
  mutate(ratio = negativewords/words) %>%
  filter(Product != 0) %>%
  slice_max(ratio, n = 1) %>% 
  ungroup()

#Word cloud
tidy_complaints %>%
  inner_join(get_sentiments("bing")) %>%
  count(word, sentiment, sort = TRUE) %>%
  acast(word ~ sentiment, value.var = "n", fill = 0) %>%
  comparison.cloud(colors = c("Red", "Blue"),
                   max.words = 100)

