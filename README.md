# R_Python_Reticulate

![image](https://user-images.githubusercontent.com/46545400/215617339-e7395331-7483-4d4e-9c38-10d487641c76.png)

## Overview

### Authors:
[Riesling Walker](https://www.linkedin.com/in/riesling/) and [Deepsha Menghani](https://www.linkedin.com/in/deepshamenghani/)

### Context:
Ravelry is a social networking and organizational website for yarn-related crafts. By using data from their free API, I can analyze my friend's knitting behaviors to understand her preferences when it comes to garment types, yarn weight, and fiber craft.

This specific project was a one time analysis. However, it could be expanded to build a yarn recommendation engine to recommend yarn quanities and weight for any given Ravelry username.

### Skills demonstrated:
* Learn to pull data with API calls in Python using Flask.
* Access the output of Python API calls from R easily using Reticulate.
* Analyze our project data using GGPlot in R and create a portfolio project.

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

### Step 3: Data exploration and recommendation (Upcoming article)

Now that we have learned how to call the Ravelry API in Python and use R to call the Python API function calls, we will move to the data analysis stage. In the next article of this series, we will dive into analyzing Ravelry queues and favorites using GGPlot to answer some very interesting questions like:
* What year did Riesling and I start adding projects to our Ravelry queues and what has the yearly trend been since. Hint: Surprisingly, it was a very similar yearly trend.
* What days of the week are Riesling and I most active on adding projects in our Ravelry.
* What type of projects do Riesling and I gravitate toward, and has it changed over the years.
* Who are our favorite pattern designers.
* And my favorite question: What yarn weight type should I give Riesling as a gift? (Any guesses?)

Follow [Deepsha](https://medium.com/@menghani.deepsha), [Riesling](https://medium.com/@rieslingfyi), or [Data Science \@ Microsoft](https://medium.com/data-science-at-microsoft) (all on Medium.com) to see the previous article in this series and stay tuned for the next one.
