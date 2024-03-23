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
1. # Filter out blank and responseless complaints
   This was nessesary so my table was more readable and easy for analysis.
   df_complaints <- df_complaints %>%
  filter(Consumer.complaint.narrative != "" & Company.public.response != "")

2. Rename the complaint column
   I rnamed the customer complaint narrative column to just Complain so its simplified to write.
   df_complaints <- df_complaints %>%
  rename(Complain = Consumer.complaint.narrative)

3. Cleaned the data frame by removing punctuations, numbers and spaces.
   df_complaints$Complain <- str_replace_all(df_complaints$Complain, "[[:punct:]]", "")
   df_complaints$Complain <- str_remove_all(df_complaints$Complain, "\\d+")
   df_complaints$Complain <- str_squish(df_complaints$Complain)

4. Creating new table
   Created a nnew table with just the colums i will be using for my analysis.
   consumer_complaints <- df_complaints%>%
     dplyr::select(Company, Product, Complain, Consumer.disputed., Timely.response. )

##Data Analysis
1. Plot top companies with positive sentiments
   the plot highlights the top 20 compaies that have the highest positive sentiment count.
<div align = "center">
<img src = "Images/Positive sentiment companies.png" width = "700")>
</div>

2. Plot top companies with negative sentiments
   the plot highlights the top 20 compaies that have the highest negative sentiment count.
<div align = "center">
<img src = "Images/negative complaint companies.png" width = "700")>
</div>

3. 


4. Creating word cloud with word sizes based on frequency
   Used the frequency if the words to determine the size. 
<div align = "center">
<img src = "Images/Wordcloud.pngg" width = "700")>
</div>

- The red is the negative words from the complaints.
- The blue is the positive words from the complaints.


## Data Summary



## Data Analysis



##Conclusion
