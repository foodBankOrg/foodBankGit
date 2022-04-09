Unit 8: Group Milestone - Foodbank App
===

# FoodBank App

## Table of Contents
1. [Overview](#Overview)
1. [Product Spec](#Product-Spec)
1. [Wireframes](#Wireframes)
1. [Schema](#Schema)

## Overview
### Description
Tracks the flow of people getting meals from food banks. 
Has a "to stay" and "to go" meal option. Allows food banks to register and have guest logins or member logins for the easy counting of guests. Allows food banks to track total number of meals distributed within different time intervals. 

### App Evaluation
- **Category:** People-tracking / Data 
- **Mobile:** This app would be primarily developed for mobile but would perhaps be just as viable on a computer, such as tinder or other similar apps. While computer functionality will be viable, mobile versions of the platform would potentially have more features.
- **Story:** Analyzes the flow of people into a food bank. Cuts down on time required to manually input tracking numbers into excell, providing an accurate an efficient way to see total meal distrubition. 
- **Market:** Any food bank or soup kitchen could use the app. Any individual in the food bank could additionally download it on their phone  for use during food bank visit
- **Habit:** This app would be used every day in the food bank by administrators and visitors. The goal is to become essential to running the organization through the efficient collection of data. 
- **Scope:** First we want to have a bare-bones working tracking system with numbers. Then we want to work on exportation of the data/ analysis.

## Product Spec
### 1. User Stories (Required and Optional)

**Required Must-have Stories**

* User can log in to access food bank meal settings
* User can log out 
* User can sign up (For Food Bank Data Creation) 
* User stays logged in across restarts

* Guest login

* Member login
* Member creation (For repeat visitors of the food bank)
* Member Preference Settings
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

## Schema 
[This section will be completed in Unit 9]

Unit 8: Group Milestone - Foodbank App
===

# FoodBank App

## Table of Contents
1. [Overview](#Overview)
1. [Product Spec](#Product-Spec)
1. [Wireframes](#Wireframes)
1. [Schema](#Schema)

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

## Schema 


### Models
#### Post

   | Property      | Type     | Description |
   | ------------- | -------- | ------------|
   | user          | Pointer to User | unique object for each foodbank |
   | entryObject   | Object    | entry object |
   | totalMeals    | Object   | total meals served per day
   
   '''swift
   let totalMeals = PFObject(className:"totalMeals")
   totalMeals["total"] = 0
   
   totalMeals.saveInBackground { (succeeded, error)  in
    if (succeeded) {
        // The object has been saved.
    } else {
        // There was a problem, check error.description
    }
   
   let entryObject = PFObject(className:"entryObject")
   entryObject["user"] = //pointer to User
   entryObject["entryID"] = // last entry + 1 ?? 0
   entryObject["numMealsToGo"] = //button result
   entryObject["numMealsToStay"] = //button result
   entryObject["entryNumMeals"] = //textfield
   entryObject["createdAt"] = //DateTime
   
   entryObject.saveInBackground { (succeeded, error)  in
      if (succeeded) {
          // The object has been saved.
      } else {
          // There was a problem, check error.description
      }
    }
  
  let query = PFQuery(className:"totalMeals")
  query.getObjectInBackground(withId: "total") { (totMeals: PFObject?, error: Error?) in
    if let error = error {
        print(error.localizedDescription)
    } else {
        let totMeals["total"] = totalMeals["total"] + entryObject["entryNumMeal"] {
        totalMeals.saveInBackground()
    }
}

//a few examples of networking requests. Haven't tested this/ want to ask some questions in class about overall architecture before I go too deep on the networking requests.
   
    '''
}
   *** properties of An entry object***
 | entryID       | Number   | unique id for each submit entry |
 | numMealsToGo  | Number   | # of meals to go for an entry|
 | numMealsToStay| Number   | # of meals to stay for an entry|
 | entryNumMeals | Number   | total meals served per entry
 | createdAt     | DateTime | date when post is created (default field) |
   ***
   
   IF member login **Entry login** (Create/PUT)
   | memberID      | String   | string unique id for member login
   | memberNotes   | String   | string of notes for member ID
 
  
   | maxMealStay   | Number   | # of meals max to stay per entry
   | maxMealsGo    | Number   | # of meals max to go per entry
   
### Networking

CRUD

* Login / Registration (Instagram)
--> (Create/ POST) Create user
--> (Read/GET) Query logged in user object
* Menu Controller 
   * Guest login button
        --> (Read/GET) Query logged in user object
   * Member login id field and button
        --> (Read/GET) Query memberID string
        --> (Read/GET) Query memberID notes
   * Member creation button
   * BarItem logout
        --> (Update/PUT) Query logged in user object / logout (Read?) 
   * BarItem admin
* Guest Login Screen
   * To stay Buttons - , 0 , +
   * To go Buttons - , 0 , +
   * Submit
        --> (Create/ POST) entryID, numMealsToGo, numMealsToStay, entryNumMeals, createdAt
        --> (Update/ PUT) totalMeals
   
* Member Login Screen
   * To stay Buttons - , 0 , +
   * To go Buttons - , 0 , +
   * Notes (allergies, family size, phone #, etc...)
   * Submit
        --> (Create/ POST) entryID, numMealsToGo, numMealsToStay, entryNumMeals, createdAt, memberID, memberNotes
        -->  Update/ PUT) totalMeals
* Admin Screen
   * set daily max meals to stay, max meals to go
        --> (Update/ PUT) maxMealsStay, maxMealsGo
   * display total served (#)
        --> (Read/GET) totalMeals
   * View meals button
* Admin Table View
   * display user, # of meals tkaen to stay, to go, and any notes
        --> (Read/GET) entryID, numMealsToGo, numMealsToStay, entryNumMeals, createdAt, memberID, memberNotes, totalMeals

- [Add list of network requests by screen ]
- [Create basic snippets for each Parse network request]
- [OPTIONAL: List endpoints if using existing API such as Yelp]


Group 
