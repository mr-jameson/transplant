#TransPlant
---
*A two-sided marketplace Ruby on Rails app build for Coder Academy Fastrack Bootcamp Assessment.*

*View live at:*

*GitHub Repo:*

---

### Contents

  * [Purpose](#purpose)
    + [Mission Statement](#mission-statement)
    + [Problem](#problem)
      - [Carbon Emissions](#carbon-emissions)
      - [Demand for Indoor Plants](#demand-for-indoor-plants)
      - [Existing Marketplaces](#existing-marketplaces)
 * [User Stories](#user-stories)
    + [Target Audience](#target-audience)
    + [Detailed User Stories](#detailed-user-stories)
  * [Sitemap](#sitemap)
  * [Functionality](#functionality)
    + [Tech-Stack](#functionality)
    + [Features](#features)
  * [Third Party Services](#third-party-services)
  * [Database](#database)
    + [Schema Design](#schema-design)
    + [Entity Relationship Diagram](#entity-relationship-diagram)
  * [Styling](#styling)
  * [Project Management](#project-management)
    + [Wireframes](#wireframes)
    + [Trello](#trello)

## Purpose

### Mission Statement
TransPlant is the place to buy and sell indoor plants - because everybody should have more plants in their space.

#### The Problem
##### Carbon Emissions
Climate change is caused by humans generating excessive carbon dioxide emissions. Plants absorb carbon and emit oxygen. The world needs more plants. TransPlant encourages people to grow plants, sell them online for profit and help the planet at the same time.

Indoor plants are also shown to improve air quality in an environment, which has health benefits. 

##### Demand for Indoor Plants
Demand for indoor plants is on the rise and there is room in the market for more vendors. Indoor plants are in fashion in 2019. Many young people are enthusiastic to decorate their homes sustainably. They care about the environment and they want to create a greener future. 

The trend towards decorating city apartments and offices with indoor plants has been accelerated by social media. Instagram users post beautiful pictures of their stylish plants and influence others to take an interest in plants.

Plants have a calming effect on the mind. Decorating your home or office with green plants can improve the mental wellbeing of the occupants. 

##### Existing Marketplaces
Many Australians buy their indoor plants in store from Bunnings. This does not cater for those who wish to sell their plants. Plants are easy to grow and cultivate for those who are handy around the garden. The ability for users to sell plants is key to the functionality of TransPlant.

Some people sell their plants on large existing platforms such as Gumtree or Facebook; however, these are generic buy/sell platforms which do not directly target the niche of indoor plants. TransPlant aims to create a market hub specifically for indoor potted plants.

### User Stories
#### Target Audience
TransPlant is for anybody who wants to buy or sell potted indoor plants; either to make their home or office greener or to make some money by selling their excess plants. 

Much demand for indoor plants comes from inner city dwellers and offices,who don't have outdoor gardens. 

#### Detailed User Stories
- As someone who grows plants as a hobby, I want to be able to sell my plants to make a side income
- As a plant enthusiast, I want to buy potted plants directly from the grower
- As an interior designer, I want to buy indoor plants at a good price for my clients' offices
- As a shopper for indoor plants, I want to know how big the plant is that I'm looking at buying
- As a shopper for indoor plants, I want to know how much light the plant requires to be able to plan the plant location in my space
- As a shopper for indoor plants, I want to see images of the plant I am looking to buy
- As a buyer of indoor plants, I want to be able to pay online with my credit card
As a shopper for indoor plants, I want to know what kind of pot the plant comes with
- As a shopper for indoor plants, I want to be able to view the available plants in order from lowest cost to highest cost
- As a shopper for indoor plants, I want to know where the plant is located
- As a seller of indoor plants, I want to be able to view and edit my current listings
- As a seller of indoor plants, I want to provide a description of my plant
- As a user, I want to be able to login to view my listings or to buy plants
- As a user, I want to be able to edit my profile
- As a user, I want to be able to recover my password if I can't remember it


### Sitemap
Insert image

### Functionality
#### Tech Stack
The tech stack employed in this Ruby on Rails application is as follows:
- Rails version 5.2.3 
- Ruby version 2.6.3
- Markup language: HTML
- Styling: CSS
- Database: PostgreSQL
- Authentication/Authorisation: Devise
- Cloud storage: s3
- Payment: Stripe
- Deployment: Heroku

#### Architecture
This Ruby on Rails application utilises Model View Controller (MVC) architecture. MVC architecture is a way of grouping code into three functionalities which allow web applications to be developed in parallel by multiple developers as well as enabling the code to be easily reused.

The Model layer interacts with the database. Any functionality such as creating, reading, updating or deleting data is carried out within the model. The view is the front-end of the application. It takes care of the elements that the user will see and interact with. The controller sits between the model and the view. It handles the HTTP requests and orchestrates view events and model changes accordingly. 


#### Features
- Search Bar
- Refine Results

#### Models
Object-relational mapping (ORM) is the link between a relational database management system and your preferred object-oriented programming language. ActiveRecord is an ORM framework used in Rails. It is used to represent models and the associations between these models.

<!-- 
Complete discussion of the project’s models with an understanding of how its active record associations function -->

### Third Party Services
Stripe is an online payment system and is integrated into TransPlant for accepting credit card payments. When a user selects buy on a listed item, they are re-directed to Stripe to complete the purchase.

### Database
#### Schema Design
![ERB](/docs/ERD/TransPlant-ERD.png)

#### Database Relations
There are 3 types of relationships in relational database design. They are:

One-to-One
One-to-Many (or Many-to-One)
Many-to-Many

<!-- Discuss the database relations to be implemented
Provides coherent discussion of the database relations, with reference to the ERD -->

<!-- - user_id links to plants where one user has many plants.
- user_id links to transactions where one user has many transactions
- user_id links to addresses where one user has one address
- plant_id links to transactions where one plant has many transactions
- active_storage_blobs link to record_id and blob_id -->


### Styling
color scheme

### Project Management


#### Wireframes
link

#### Trello
Trello has been utilised to manage and track tasks within the project. 

The project is structured to achieve a minimum viable product (MVP) by the end of week 1. To contain the scope of the project, 'Nice to have' features are separated out to be implemented only after MVP has been met.

Tasks are further broken down into; planning, documentation, coding and styling. Planning and documentation are addressed first, followed by coding and then finally styling.
