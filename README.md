# Complain-Sentiment-analysis

## Introduction
We will analyze the consumer complain text data for relations between.......... <br>

## Dictionary 📖
The columns that were used are: 
1. Date.received
2. Product
3. Issue
4. Complain
5. Company.public.response
6. Company
7. State
8. Submitted.via
9. Date.sent.to.company
10. Company.response.to.consumer
11. Timely.response.
12. Consumer.disputed.
13. Complaint.ID              

---
## Data Cleaning 🧹
1. Renamed Consumer.complaint.narrativecolumn to complaint.
   
3. Filtered out blank and responseless colums like (Consumer.complaint.narrative & Company.public.response.
   
4. Calculated the percentage of resolved complaints
   resolved_complaints <- consumer_complaints %>%
  filter(Timely.response. == "Yes" & Consumer.disputed. == "No")
5. Join consumer_complaints with emotions lexicon



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
