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

### Files included:
* README.md - a file that walks through project context, skills demonstrated, and the 
* Ravelry_Reticulate.qmd - an R mark down that demonstrates calling python functions in R using reticulate, along with combatting some issues we faced along the way with data cleanliness.
* Ravelry_visualize.qmd - The file in which we visualize our data to draw conclusions about our Ravelry behaviorsoutput
* functions_r.R - a files used to practice the "safer" function to avoid the code from erroring out
* python_api_functions.py - The file in which we use define funcitons using flask in python to get data using the ravelry API
* ravelry_app_creation.jpg - how to create your own API credentials

### Notes
If you would like to execute this project on your own, you will need to generate your own API credientials. 

## Project

### Step 1: Using the Ravelry API
For more information about what APIs are, how to get started with APIs, and the steps we took to build this file (along with great knitting photos), you can see our [article](https://medium.com/data-science-at-microsoft/how-to-access-an-api-for-first-time-api-users-879002f5f58d) which also serves as a how-to guide for first time API users.
