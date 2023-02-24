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

Additionally, for a more detailed explanation and full learnsing from this step, please see our [article](https://medium.com/p/25246b367957).

### Step 3: Data exploration and recommendation

Now that we have learned how to call the Ravelry API in Python and use R to call the Python API function calls, we can move to the data analysis stage. In the [upcoming article]() of this series, we dive into analyzing Ravelry queues and favorites using GGPlot to answer some very interesting questions like:
* What year did Riesling and I start adding projects to our Ravelry queues and what has the yearly trend been since. Hint: Surprisingly, it was a very similar yearly trend.
* What type of projects do Riesling and I gravitate toward, and has it changed over the years.
* Who are our favorite pattern designers.
* And my favorite question: What yarn weight type should I give Riesling as a gift? 

To answer the above questions, we cleaned the data to ensure the columns were in the right formats, and the data was cleaned to make our visuals.  Some examples of this included simplifying yarn weight categories, clarifying labels and descriptions, parsing relevant information like pattern author, and more. The cleaning script can be found at `clean_data_for_ggplot.R`.

Using the cleaned data, we could draw conclusions about what kind of yarn to buy.  You can see the code for this step in `Visualize_data.qmd`.

### Business case

For the sake of this "business case" of buying yarn for a friend, Deepsha is looking to buy Riesling some yarn and is comparing their queuing patterns to gain insight.

First, Deepsha wants to confirm if Riesling is still actively so she plots the number of queued projects over time
![Queued projects over time for Deepsha and Riesling](/images/patterns_added_by_date_plot.png?raw=true)

It looks like Riesling is less active than she was in late 2020, but still actively queuing projects, so she would love some yarn!

Next, Deepsha wants to understand what weight (or thickness) of yarn Riesling has been queuing lately to see if her yarn preferences have changed
![Yarn weight over time for Deepsha and Riesling](/images/yarn_weights_plot.png?raw=true)

Unlike Deepsha who has been queuing a lot more fingering weight yarn over time, Riesling has been queuing more lace and DK weight. So, if Deepsha wants to get a gift for Riesling, rather than her new favorite yarn weight (fingering), she should opt for DK or lace.

Next, Deepsha wants to understand what sort of quantity of yarn to buy. Knitters would rather *not* get yarn, than get too little yarn to accomplish their favorite project. So, Deepsha will look at the types of garments Riesling likes to knit to figure out what quantity of yarn to buy her.
![Garment type in queue for Deepsha and Riesling](/images/top_patterns_plot.png?raw=true)

Even though Riesling has the most shawl/wraps in queue, she also has a lot of pullovers.  Since Deepsha also has a lot of pullovers, she's probably familiar with how much yarn goes into one of those, so she will likely opt to buy the right quantity for that item.

Finally, Deepsha has decided to be extra generous and buy Riesling a gift card for a pattern to use with the new yarn.  So, she must figure out which designer to buy a giftcard from.  
![Author queue for Deepsha and Riesling](/images/top_n_authors_plot.png?raw=true)

Deepsha has a few authors to choose from, but she also might take this opportunity to introduce Riesling to her own favorite designer, PetiteKnit!

Overall, through this data exploration project, Deepsha now has a lot of information to go to her local yarn store to buy Riesling a wonderful gift! She will likely buy 1,400 yards of DK weight yarn for an Andrea Mowry sweater.  A very, very generous gift!


Follow [Deepsha](https://medium.com/@menghani.deepsha), [Riesling](https://medium.com/@rieslingfyi), or [Data Science \@ Microsoft](https://medium.com/data-science-at-microsoft) (all on Medium.com) to the articles in this series.
