# Complain-Sentiment-analysis

## Introduction
We will analyze the consumer complain text data for relations between.......... <br>

## Dictionary 📖
The columns that were used are: 
1. Product
2. Complain
3. Company
4. Timely.response.
5. Consumer.disputed.
   
---
## Data Cleaning 🧹
1. Filter out blank and responseless complaints
   This was nessesary so my table was more readable and easy for analysis.
   df_complaints <- df_complaints %>%
  filter(Consumer.complaint.narrative != "" & Company.public.response != "")

2. Rename the complaint column
   I rnamed the customer complaint narrative column to just Complain so its simplified to write.
   df_complaints <- df_complaints %>%
  rename(Complain = Consumer.complaint.narrative)

3.Clean and tokenize the complaints into individual words
    Clean the text: remove punctuation, numbers, and extra spaces
     mutate(Complain = str_replace_all(Complain, "[[:punct:]]", "") %>%
           str_remove_all("\\d+") %>%
           str_squish()) %>%
   Tokenize the complaints into individual words after cleaning
    unnest_tokens(word, Complain) %>%
   Remove stop words, unnecessary characters, single characters, and numbers
     anti_join(stop_words, by = "word") %>%
     filter(!grepl("[^[:alnum:][:space:]]", word)) %>%
     filter(nchar(word) > 1) %>%
     filter(!grepl("\\d+", word))

##Data Analysis
1. Found frequently used words
2. Joining the complaints data with the sentiment lexicon
   ..........table ........
3. Found the sentiment score for each company
   
4. Plot top companies with positive sentiments
   the plot highlights the top 20 compaies that have the highest positive sentiment count.
<div align = "center">
<img src = "Images/Positive sentiment companies.png" width = "700")>
</div>

5. Plot top companies with negative sentiments
   the plot highlights the top 20 compaies that have the highest negative sentiment count.
<div align = "center">
<img src = "Images/negative complaint companies.png" width = "700")>
</div>

6. Print the percentage of resolved complaints, because i was curious of the cases being timely resolved.
   
8. Get the frequency of the positive and negative sentiments.
   positive_words <- word_sentiment %>%
     filter(sentiment == "positive") %>%
     count(word) %>%
     top_n(20, n)
   negative_words <- word_sentiment %>%
     filter(sentiment == "negative") %>%
     count(word) %>%
     top_n(20, n)

9. Plot positive and negative sentiments separately

<div align = "center">
<img src = "Images/Images/Rplot.png" width = "700")>
</div>


<div align = "center">
<img src = "Images/Images/Negative words.png" width = "700")>
</div>


4. Creating word cloud with word sizes based on frequency
   Used the frequency if the words to determine the size.
   
<div align = "center">
<img src = "Images/Wordcloud.png" width = "700")>
</div>

- The red is the negative words from the complaints.
- The blue is the positive words from the complaints.


## Data Summary



## Data Analysis



##Conclusion
