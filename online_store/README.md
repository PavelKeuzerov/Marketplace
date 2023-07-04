# README

This project is the thesis of IT school TeachMeSkills. The goal of the project is to create an online store. Which allows you to sell and buy handmade products, including the ability to create and send comments and rating products.

Main characteristics:
- User authentication
- User authorization
- Crafts announcements
- Reviews and ratings
- File/image upload
- Containerization of the application using Docker
- Internationalization i18n

* Ruby version - 3.1.0
* Ruby on Rails version - 7.0.5
* Database version - postgres (PostgreSQL) 14.8

Installation and setup Download the project: 
- git clone https://github.com/PavelKeuzerov/Marketplace 
- cd online_store

Install the libraries: 
- bundle install

Create DB:
- rails db:create $ 
- rails db:migrate

Run application: 
- rails s 

Run Sidekiq: 
- rails sidekiq

Run Docker
-????????&