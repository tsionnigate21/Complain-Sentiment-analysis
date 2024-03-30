# Complain-Sentiment-Analysis

## Introduction
This project aims to analyze consumer complaint text data to identify relationships between different products, sentiments expressed, and the companies involved.
---
## Data Dictionary 📖
The dataset consists of the following columns:
1. Product: The product associated with the complaint.
2. Complain: The text containing the consumer complaint.
3. Company: The company to which the complaint is addressed.
4. 
---
## Data Cleaning 🧹
1. **Filtering out Blank and Responseless Complaints**: Blank and responseless complaints were removed to enhance readability and facilitate analysis.

2. **Renaming Columns**: The column containing customer complaint narratives was renamed to "Complain" for simplification.

3. **Creating a New Table**: A new table was created containing the Product, Complain, and Company columns.

4. **Removing Stop Words**: Common stop words were removed from the complaint text to focus on meaningful content.

5. **Text Cleaning**: The complaint text was cleaned by removing punctuation, digits, and unnecessary characters.

6. **Tokenizing Complaints**: The complaints were tokenized into individual words after cleaning.

---

## Data Summary
4. **Create new table**:
   A new table was created to summarize the data, including columns for Product, Complaint, and Company.

## Data Analysis

1. **Identifying Joy-Related Words**:
   Joy-related sentiment words were extracted from the NRC lexicon and counted within complaints associated with different product categories.
   
3. **Sentiment Analysis**:
   Negative and positive sentiment counts were computed separately for each product category.
   <div align = "center">
   <img src = "Images/Positive  and negative sentiment.png" width = "700")>
   </div>

4. **Comparing Sentiment Dictionaries**:
   Sentiment scores obtained from the three dictionaries (AFINN, Bing et al., NRC) were compared.
   This comparison allowed for an assessment of the consistency and    effectiveness of different sentiment analysis approaches.

5. **Visualizing Net Sentiment**:
   The net sentiment, calculated as the difference between positive and negative sentiment scores, was visualized to identify overall sentiment trends across different product categories.
   
   <div align = "center">
   <img src = "Images/Estimate of net sentiments.png" width = "700")>
   </div>

7. **Company Sentiment Score**:
   The table shows the sentiment scores calculated for each company based on the sentiments expressed in consumer complaints. For instance:

   "1st Alliance Lending" received 9 negative words out of 372 total words in mortgage-related complaints, resulting in a ratio of 0.0242.
   "24 Asset Management Corp" had 5 negative words out of 53 total words in debt collection complaints, resulting in a ratio of 0.0943.
   "A.R.M. Solutions, Inc." received 48 negative words out of 1550 total words in debt collection complaints, resulting in a ratio of 0.0310.
   
9. **Frequency of Positive and Negative Words**:
   The frequency of positive and negative words within the sentiment lexicons was analyzed to understand the distribution and prevalence of sentiment-related vocabulary.
   
11. **Positive and Negative sentiments separately**
   Sentiment analysis was conducted on textual consumer complaints to identify the top 20 words associated with positive and negative sentiments.
   The following visualizations depict the top words for each sentiment category:

   Negative Sentiment Words
   <div align = "center">
   <img src = "Images/negative complaint companies.png" width = "700")>
   </div>
   
   Positive Sentiment Words
   <div align = "center">
   <img src = "Images/Positive sentiment companies.png" width = "700")>
   </div>

---
## Word Cloud

1. **Creating Word Cloud**: A word cloud was generated to visualize word frequencies in the complaint text, with word sizes based on frequency.
 -Creating word cloud with word sizes based on frequency
   -Used the frequency if the words to determine the size.
   <div align = "center">
   <img src = "Images/Word cloud.png" width = "700")>
   </div>

---


## Conclusion

The sentiment analysis conducted on consumer complaints offers valuable insights for companies to understand customer sentiments and improve their products or services accordingly. By addressing issues highlighted in complaints and leveraging positive feedback, companies can enhance customer satisfaction and loyalty. Further analysis and visualization, such as word clouds, provide additional context and visualization of the most common words used in complaints, aiding in comprehensive understanding and actionable insights.
