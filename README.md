Unit 8: Group Milestone - Foodbank App
===

# FoodBank App

## Table of Contents
1. [Overview](#Overview)
1. [Product Spec](#Product-Spec)
1. [Wireframes](#Wireframes)

## Overview
### Description
Tracks the flow of people getting meals from foodbanks. Has a "to stay" and "to go" meal option. Allows food banks to register and have guest logins or member logins for the easy counting of guests. 

### App Evaluation
- **Category:** People-tracking / Data 
- **Mobile:** This app would be primarily developed for mobile, but can be adapted to web. 
- **Story:** Analyzes the flow of people in the food bank. Cuts down on time required to manually input tracking numbers into excell.
- **Market:** Any food bank or soup kitchen could use the app. Any individual in the food bank could additionally download it on their phone.
- **Habit:** This app would be used every day in the food bank. The goal is to become essential to running the organization through the efficient collection of data. 
- **Scope:** First we want to have a bare-bones working tracking system with numbers. Then we want to work on exportation of the data/ analysis.

## Product Spec
### 1. User Stories (Required and Optional)

**Required Must-have Stories**

* User can log in
* User can log out
* User can sign up
* User stays logged in across restarts
* Guest login
* Member login
* Member creation
* Admin Portal settings
* Admin Portal View

**Optional Nice-to-have Stories**

* exportation of data to API or EXCEL
* analysis of data

### 2. Screen Archetypes

* Login / Registration (Instagram)
* Menu Controller 
   * Guest login button
   * Member login id field and button
   * Member creation button
   * BarItem logout
   * BarItem admin
* Guest Login Screen
   * To stay Buttons - , 0 , +
   * To go Buttons - , 0 , +
   * Submit
* Member Login Screen
   * To stay Buttons - , 0 , +
   * To go Buttons - , 0 , +
   * Notes (allergies, family size, phone #, etc...)
   * Submit
* Admin Screen
   * set daily max meals to stay, max meals to go
   * display total served (#)
   * View meals button
* Admin Table View
   * display user, # of meals tkaen to stay, to go, and any notes

### 3. Navigation

**Tab Navigation** (Tab to Screen)

* not using tab navigation

**Flow Navigation** (Screen to Screen)
* Forced login / account creation
  * user stays logged in
* To menu controller / main screen
  * Logout --> back to login screen
  * Guest login button --> Guest login Screen (w/ back tab bar)
  * Member login button w/ ID Text field --> Member login Screen (w/ back tab bar)
  * Member creation button --> Member creation screen (ID + notes)
  * Admin button --> Admin set max meals buttons + display meals button
* Admin Table View screen
  * --> from display meals button --> tableView display meals w/ back button

## Wireframes
<img src="https://imgur.com/HXNdExD.jpg" width=800><br>
<img src="https://imgur.com/7CFF9Lr.jpg" width=800><br>
