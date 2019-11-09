#TransPlant
---
*A two-sided marketplace Ruby on Rails app build for Coder Academy Fastrack Bootcamp Assessment.*

*View live at:*

http://transplant-market.herokuapp.com/

*GitHub Repo:*

https://github.com/mr-jameson/transplant

---

### Contents

  * [Purpose](#purpose)
    + [Mission Statement](#mission-statement)
    + [The Problem](#the-problem)
      - [Carbon Emissions](#carbon-emissions)
      - [Demand for Indoor Plants](#demand-for-indoor-plants)
      - [Existing Marketplaces](#existing-marketplaces)
 * [User Stories](#user-stories)
    + [Target Audience](#target-audience)
    + [Detailed User Stories](#detailed-user-stories)
  * [Sitemap](#sitemap)
  * [Functionality](#functionality)
    + [Tech-Stack](#functionality)
    + [Architecture](#arcitecture)
    + [Models](#models)
    + [Database](#database)
        - [Database Relations](#database-relations)
        - [Entity Relationship Diagram](#entity-relationship-diagram)
    + [Features](#features)
  * [Third Party Services](#third-party-services)
    + [Stripe](#stripe)
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
- As someone who grows plants as a hobby, I want to be able to sell my plants to make a side income.
- As a plant enthusiast, I want to buy potted plants directly from the grower.
- As an interior designer, I want to buy indoor plants at a good price for my clients' offices.
- As a shopper for indoor plants, I want to know how big the plant is that I'm looking at buying.
- As a shopper for indoor plants, I want to know how much light the plant requires to be able to plan the plant location in my space.
- As a shopper for indoor plants, I want to see images of the plant I am looking to buy.
- As a buyer of indoor plants, I want to be able to pay online with my credit card.
As a shopper for indoor plants, I want to know what kind of pot the plant comes with.
- As a shopper for indoor plants, I want to know where the plant is located.
- As a seller of indoor plants, I want to be able to view and edit my current listings.
- As a seller of indoor plants, I want to provide a description of my plant.
- As a seller of indoor plants, I want to be able to delete my listing.
- As a user, I want to be able to login to view my listings or to buy plants.
- As a user, I want to be able to edit my profile.
- As a user, I want to be able to recover my password if I can't remember it.


### Sitemap
![sitemap](/docs/Sitemap/sitemap2.png)

### Functionality
#### Tech Stack
The tech stack employed in this Ruby on Rails application is as follows:
- Rails version 5.2.3 
- Ruby version 2.6.3
- Markup language: HTML
- Styling: CSS, Bootstrap
- Database: PostgreSQL
- Authentication/Authorisation: Devise
- Cloud storage: s3
- Payment: Stripe
- Deployment: Heroku

#### Architecture
This Ruby on Rails application utilises Model View Controller (MVC) architecture. MVC architecture is a way of grouping code into three functionalities. Grouping code in this pattern allows web applications to be better organised. It allows development to be undertaken in parallel by multiple developers as well as enabling the code to be easily reused.

The Model layer interacts with the database. Any functionality such as creating, reading, updating or deleting data is carried out within the model. The view is the front-end of the application. It takes care of the elements that the user will see and interact with. The controller sits between the model and the view. It handles the HTTP requests and orchestrates view events and model changes accordingly. 

#### Models
A Model in Rails is a Ruby class that can interact with the database to add records, find particular data you're looking for, update that data, or remove data.

There are multiple models in TransPlant; plant, user, address and ledger - each containing instructions for interacting with their respective databases. Rails creates connections between these models via associations. 

The plant model 'belongs to' the user model and 'has one' address through the user model. These associations are declared in the plant model so that rails knows that the plant model references the user_id foreign key, allowing it to map data between models correctly.

The user model 'has one' address and 'has many' plants. This tells rails that there is a one-to-one relationship between user and address, and a one-to-many relationship between user and plants.

The ledger model records the transactions that have been completed. It 'belongs to' the plant model and the user model, which tells rails that the ledger model references the plant and user foreign keys.



#### Database
##### Database Relations
TransPlant uses PostgreSQL as its database. PostgreSQL is a relational database. A relational database management system organises data into tables, otherwise known as relations. 

The defining feature of a relational database is that the tables can reference other tables via a column containing the primary keys of the other table. The references column values are called the foreign keys. This allows data to be grouped into tables or relations which then reference each other.

The database relations must correspond to the associations setup in the model, as the associations detail the foreign key links between relations. 

There are 3 types of relationships in relational database design:

- One-to-One
- One-to-Many (or Many-to-One)
- Many-to-Many
- Polymorphic One to Many

The Entity Relationship Diagram (ERD) below details the relationships between the tables. The asterisk at the end of the link represents 'many', and the 1 at the end represents 'one'. The relationships are as described in the models section: for example, a user has many plants.

Images are handled by active storage, which allows files to be uploaded into cloud storage. Active storage creates two database relations; active_storage_attachments and active_storage_blobs. A polymorphic association links the image data in these tables to the relevant model.

##### Entity Relationship Diagram
![ERD](/docs/ERD/TransPlant-ERD.png)


#### Features
- Search Bar
- Refine Results

### Third Party Services
#### Stripe
Collecting credit card details from users is high risk. It is therefore best to outsource the processing of payments to third party applications which have stringent cyber security integration.

Transplant integrates Stripe for its online payment system which includes accepting credit card payments. When a user selects buy on a listed item, they are re-directed to Stripe to complete the purchase. If the payment is successful the user will be redirected back to the application.

TransPlant connects to Stripe's API using a publishable and a secret key. A stripe gem has been loaded into the application to facilitate the setup. 

Webhooks are employed via Stripe to notify our application that a purchase has been made and completed in full. Once the webhook tells TransPlant that a purchase has been completed, the plant listings will be updated so that the purchased plant is removed.

### Styling
The CSS Bootstrap framework has been employed to streamline the styling.

Green colours dominate the design which complements the plant theme and the environmental motivation behind the project.

### Project Management
#### Wireframes
Wireframes were created at the start of the project to plan out the design and features to be built: 
Refer to link below for wireframes:
https://drive.google.com/open?id=1i0h7-2Cx8eDy-VxEuXvDDhuJYbHymm2S


#### Trello
Agile project management was employed throughout the building of the application. Although extensive planning was undertaken in the beginning,the planning was adaptive. The project evolved over its development in response to limited time available to complete the app.

Trello has been utilised to manage and track tasks throughout the project. 

View live trello board here:

https://trello.com/b/y99brOZq/transplant

The project was structured to achieve a minimum viable product (MVP) by the end of week 1. To contain the scope of the project, 'Nice to have' features are separated out to be implemented only after MVP has been met.

Tasks are further broken down into; planning, documentation, coding, styling, 'nice to have' and priorities. Planning and documentation are addressed first, followed by coding and then finally styling. Urgent bug fixes are placed in 'priorities' and are to be addressed before moving on. 


