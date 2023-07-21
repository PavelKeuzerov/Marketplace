# Online shop for selling handmade crafts

___

## The following functions are implemented in the project

+ User authentication:
  + The user can register, log in and manage their profile
  + Implemented password encryption and secure authentication methods

+ User authorization:
  + The application can distinguish between sellers, buyers and administrator
  + Merchants have the ability to create product lists, set product photos, update and delete products
  + Buyers have the ability to view, buy crafts and leave reviews and ratings, use the search functionality
  + Administrator can remove incorrect reviews and products

+ Background tasks:
  + Purchase Alert

+ Internationalization (I18n):
  + The main language is English, translation into Russian is being conducted

+ There are complex unit tests and integration tests:
  + RSpec Testing Environment

+ Caching:
  + Redis caching mechanisms

+ Docker
  
___
     
### Created in programming language ___Ruby___ using the framework ___Ruby on Rails___, using database ___PostgreSQL___

+ Ruby 3.1.0
+ Ruby on Rails 7.0.4
+ PostgreSQL 14.8
____

#### Installation and Setup

To get started with a project, follow these steps:

1. Clone the repository:
  
    `git clone https://github.com/PavelKeuzerov/Marketplace`

2. Navigate to the project directory  
 
    `cd online_store`

3. Install the gems:
  
    `bundle install`

4. Set up the database:

    `rails db:create`

    `rails db:migrate`

5. Run application:

    `rails s`


6. Run sidekiq:

   `sidekiq`

