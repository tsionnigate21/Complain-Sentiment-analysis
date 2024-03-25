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
---

## Data Summary

6. **Tokenizing Complaints**: The complaints were tokenized into individual words after cleaning.

---

## Data Summary
4. Create new table
   -Table summarisin 3 colums Product, Complain, and Company columns

## Data Analysis

1. **Identifying Joy-Related Words**:
   Joy-related sentiment words from the NRC lexicon were filtered and counted in complaints related to different products.

2. **Sentiment Analysis**:
   Negative and positive sentiment counts were computed separately for each product category.
   <div align = "center">
   <img src = "Images/Positive  and negative sentiment.png" width = "700")>
   </div>

3. **Comparing Sentiment Dictionaries**:
    The sentiment scores obtained from different sentiment dictionaries (AFINN, Bing et al., NRC) were compared.

4. **Visualizing Net Sentiment**:
   The net sentiment (positive - negative) estimate was visualized to understand overall sentiment trends.
   <div align = "center">
   <img src = "Images/Estimate of net sentiments.png" width = "700")>
   </div>

5. **Company Sentiment Score**:
    Sentiment scores were calculated for each company based on the sentiments expressed in complaints.

6. **
   Identifying Top Companies with Positive and Negative Sentiments**: The top 20 companies with the highest positive and negative sentiment counts were plotted.
   <div align = "center">
   <img src = "Images/negative complaint companies.png" width = "700")>
   </div>

   <div align = "center">
   <img src = "Images/Positive sentiment companies.png" width = "700")>
   </div>
   
7. **Frequency of Positive and Negative Words**:
   The frequency of positive and negative words in the sentiment lexicons was analyzed.

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

This analysis provides valuable insights into the sentiments expressed in consumer complaints, helping companies understand areas of improvement and address customer concerns effectively.
