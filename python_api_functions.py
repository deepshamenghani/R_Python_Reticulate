import http.client
import json
import csv
import base64
from flask import Flask, request
import requests
import pandas as pd

#next, define any functions you will need.  This way, we define it once but can use it as many times as we would like

# this returns all valid color families
def get_color_families(authUsername:str, authPassword:str) -> pd.core.frame.DataFrame:
    #define URL
    url = 'https://api.ravelry.com/color_families.json'      
    #make the request
    r1 = requests.get(url, auth=requests.auth.HTTPBasicAuth(authUsername, authPassword))
    #close the connection
    r1.close()
    
    return pd.DataFrame.from_records(json.loads(r1.text)['color_families'])

# this returns all valid yarn weights
def get_yarnweights(authUsername:str, authPassword:str) -> pd.core.frame.DataFrame:
    #define URL
    url = 'https://api.ravelry.com/yarn_weights.json'      
    #make the request
    r1 = requests.get(url, auth=requests.auth.HTTPBasicAuth(authUsername, authPassword))
    #close the connection
    r1.close()
    
    return pd.DataFrame.from_records(json.loads(r1.text)['yarn_weights'])

    
# This returns the pattens from search.  Parameters include query (like "hats"), page number, and page size.  Note, there are no other filters available from the API for search unline in the web browser
def get_patterns(authUsername:str, authPassword:str, query = '', page = 1, page_size = 100) -> pd.core.frame.DataFrame:
    #define URL
    url = 'https://api.ravelry.com/patterns/search.json?query={}&page={}&page_size={}'.format(query, page, page_size)  
    #make the request
    r1 = requests.get(url, auth=requests.auth.HTTPBasicAuth(authUsername, authPassword))
    #close the connection
    r1.close()
    
    return pd.DataFrame.from_records(json.loads(r1.text)['patterns'])

# This returns all the patterns from a given person's rav_username
def get_queue(authUsername:str, authPassword:str, rav_username = 'rieslingm', query = '', page = 1, page_size = 100) -> pd.core.frame.DataFrame:
    #define URL
    url = 'https://api.ravelry.com/people/{}/queue/list.json?query={}&page={}&page_size={}'.format(rav_username, query, page, page_size) 
    #make the request
    r1 = requests.get(url, auth=requests.auth.HTTPBasicAuth(authUsername, authPassword))
    #close the connection
    r1.close()
    
    return pd.DataFrame.from_records(json.loads(r1.text)['queued_projects'])

    
# for a given pattern id, this returns all the pattern details
def get_pattern_details(authUsername:str, authPassword:str, pattern_id:int) -> pd.core.frame.DataFrame:
    #define URL
    url = 'https://api.ravelry.com/patterns/{}.json'.format(pattern_id) 
    #make the request
    r1 = requests.get(url, auth=requests.auth.HTTPBasicAuth(authUsername, authPassword))        
    #close the connection
    r1.close()

    return pd.json_normalize(json.loads(r1.text)['pattern'], max_level = 1)
    

# for searches for yarns
def search_yarns(authUsername:str, authPassword:str, query='', page = 1, page_size = 50, sort = 'best') -> pd.core.frame.DataFrame:
    #Sort order. Options are: best, rating, projects
    
    #define URL
    url = 'https://api.ravelry.com/yarns/search.json?query={}&page={}&page_size={}&sort={}'.format(query, page, page_size, sort) 
    #url = 'https://api.ravelry.com/yarns/search.json'
    #make the request
    r1 = requests.get(url, auth=requests.auth.HTTPBasicAuth(authUsername, authPassword))        
    #close the connection
    r1.close()
    
    return pd.json_normalize(json.loads(r1.text)['yarns'], max_level = 1)
    

# for a given yarn id, this returns all the yar details
def get_yarn_details(authUsername:str, authPassword:str, yarn_id:int) -> pd.core.frame.DataFrame:
    #define URL
    url = 'https://api.ravelry.com/yarns/{}.json'.format(yarn_id) 
    #make the request
    r1 = requests.get(url, auth=requests.auth.HTTPBasicAuth(authUsername, authPassword))        
    #close the connection
    r1.close()

    return pd.json_normalize(json.loads(r1.text)['yarn'], max_level = 1)

def greeting_fellow_humans(name):

    """
    This function greets to
    the person passed in as
    a parameter
    """
    string_in_string = "Hello, {}. Good morning!".format(name)
    return(string_in_string)

# This returns all the favorites from a given person's rav_username
def get_favorites(authUsername, authPassword, rav_username = 'rieslingm', types = 'patterns', query = '', deep_search = '', page = 1, page_size = 100)  -> pd.core.frame.DataFrame:
    #define URL
    url = 'https://api.ravelry.com/people/{}/favorites/list.json?type={}&query={}&deep_search={}&page={}&page_size={}'.format(rav_username, types, query, deep_search, page, page_size) 
    #make the request
    r1 = requests.get(url, auth=requests.auth.HTTPBasicAuth(authUsername, authPassword))
    #close the connection
    r1.close()

    return pd.json_normalize(json.loads(r1.text)['favorites'], max_level = 1)
  
