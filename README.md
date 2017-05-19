# Oracle Database Project

### Project Title:
Yu-Gi-Oh Application Express Relational Datebase Project - https://github.com/KevFan/database_project

### Purpose Of Project:
The purpose of this project applies concept learned from the Database module to design and implement a relational database model for a topic of interest. 

This project itself, attempts to model the card system and partly incorporate the player/tournament aspect of the Yu-Gi-Oh Trading card game using a relational database approach.


### How to start project:
The project was designed and tested using Application Express, and have not been tested in any other platform.

Several scripts are provided:
+ All in one - contains the drop, create and insert statements to poplulate the database as one script
+ Drop table - contains only the drop table/sequence statement
+ Create table - contains only the create table/sequence/trigger statements
+ Insert table - contains only the insert table statements to populate tables
+ Select table - contains sample select statements for how the database can be used


### User Instructions:
Run the all in one script in Application Express, view tables/data using the object browser or copy/paste provided select statements into the sql commands console to retrieve sample data. 

### Feature List:
+ Relational database model of Yu-Gi-Oh card system 
+ Trigger to check for card legality (e.g. Forbidden) when attempting to add a card to a deck
+ Auto increment primary key for player id and tournament
+ Return ban list by select statement (provided)

### Notes: 
+ Tables are normalised to 3NF - so knowledge on the database table is needed to correctly insert cards to card table
+ No roles are provided by this project 

### Authors:
Kevin Fan


### Version/Date:
25th April 2017
