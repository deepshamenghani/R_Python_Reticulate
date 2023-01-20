# Analyzing Ravelry behavior to determine which yarn to buy as a present for a friend

## Overview

### Authors:
[Riesling Walker](https://www.linkedin.com/in/riesling/) and [Deepsha Menghani](https://www.linkedin.com/in/deepshamenghani/)

### Context:
Ravelry is a social networking and organizational website for yarn-related crafts. By using data from their free API, I can analyze my friend's knitting behaviors to understand her preferences when it comes to garment types, yarn weight, and fiber craft.

This specific project was a one time analysis. However, it could be expanded to build a yarn recommendation engine to recommend yarn quanities and weight for any given Ravelry username.

### Skills demonstrated:
* Pulling data with APIs in Python using Flask
* Collaborating between Python and R using Reticulate
* Data cleaning, and exploratory data analysis
* Data Visualization using GGPlot in R
* Techincal writing

### Notes
If you would like to execute this project on your own, you will need to generate your own [Ravelry API credientials](https://www.ravelry.com/groups/ravelry-api). You can see ravelry_app_creation.jpg for a screenshot of what this should look like.

## Project

### Step 1: Sourcing data the Ravelry API in Python
Using the Ravelry API through flask in python, we defined functions which output relevant information. You can find all of the code for this step in `python_api_functions.py`

For more information about what APIs are, how to get started with APIs, and the steps we took to build this file (along with great knitting photos), you can see our [article](https://medium.com/data-science-at-microsoft/how-to-access-an-api-for-first-time-api-users-879002f5f58d) which also serves as a how-to guide for first time API users.

### Step 2: Calling Python functions in R to enable exploratory data analysis
**Why did we use two languages in this project?** Both R and Python are powerful Data Science languages and can be used to accomplish end to end analytics projects. Although there is a lot of overlap in capabilities between the languages, each language has its strength. For example, you may use R for its powerful data visualization libraries, while Python for its ML libraries. So, there may be some things you would want to do in Python and some things in R within a single project. Additionally, each person has their own preference, so there might also be a scenario where you might want to use R and collaborate with another team mate on a project where they may prefer Python. Reticulate makes it extremely easy to collaborate and talk between the two languages.

In this step, we used Reticulate to call Python functions in R to get the relevant data into dataframes in which we could use to visualize using ggplot.  Additionally, we combined datasets over multiple pages, bypassed errors using possibly, and mitigated other bugs/quirks that we encountered from using APIs and combining R and python. You can find all of the code for this step in `Ravelry_Reticulate.qmd`.  

Additionally, for a more detailed explanation and full learnsing from this step, please see our article at **Add link when published**.

### Step 3: Data Exploration
Now that we had our data in R, it was easy to explore the data using summary statistics and data visualizations.  Using this information, we could draw conclusions about what kind of yarn to buy.  You can see the code for this step in `Ravelry_visualize.qmd`

First, we cleaned the data to ensure the columns were in the right formats, and the data was cleaned to make our visuals.  Some examples of this included simplifiying yarn weight categories, clarrifying lables and discriptions, parsing relevant information like pattern author, and more.

For our visualizations, we plotted both rieslingm and yarnsandcoffee's Ravelry behaviors to be able to compare and contrast, although this analysis could have been done with only one username.


