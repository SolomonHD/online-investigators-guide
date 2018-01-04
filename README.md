# Online Investigators Guide

Online Investigators Guide provides researchers information on how to navigate thru the steps of their research by two ways.  The first way is to give the researchers
an unfiltered view of the Online Investigators Guide. In this view the researchers will have full access to the entire Online Investigators Guide and it is up to the researchers to
to figure out what sections applies to their research.  The second way is to give the researchers an filtered view of the Online Investigators Guide, which is tailored
to their research.  In order to generate this view, researchers must login with their net-id/password and answer a survey. Once the survey has been
completed, an filtered view will be created and saved. This view will have all of the necessary steps required for the researchers to follow to complete
their research.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites

What things you need to install the software and how to install them

* [Install rails](http://railsapps.github.io/installing-rails.html)   - Follow instructions here to install rails 5.+.
* [Install mysql server](http://www.mysqltutorial.org/install-mysql/) - Follow instructions here to install mysql server.

### Installing

A step by step series of examples that tell you have to get a local env running

```
git clone https://github.com/emory-lits-uit/online-investigators-guide.git
```
```
cd online-investigators-guide
```
```
bundle install
```
```
Configure database setting in the rails application
* create a new database on your mysql server - https://www.wikihow.com/Create-a-Database-in-MySQL
  example: create database online_investigators_guide_development
* create an environment variable to store the connection string to your database.
  example: ONLINE_INVESTIGATORS_GUIDE_LOCAL_DATABASE_URL=mysql2://<host>:<password>@localhost/online_investigators_guide_development
* open online-investigators-guide/config/database.yml and configure the local database
  local:
    <<: *default
    url: <%= ENV['ONLINE_INVESTIGATORS_GUIDE_LOCAL_DATABASE_URL'] %>
    socket: /tmp/mysql.sock
* save
```
```
rails db:migrate RAILS_ENV=local
```
```
rails db:seed RAILS_ENV=local
```
```
rails s -e local
```
```
open browser and go to http://localhost:3000/
```

## Design

[ER Diagram](erd.pdf)

## Running the tests

Explain how to run the automated tests for this system

### Break down into end to end tests

Explain what these tests test and why

```
Give an example - TBD
```

### And coding style tests

Explain what these tests test and why

```
Give an example - TBD
```

## Deployment
```
cd online-investigators-guide
```

### Development Environment
```
cap d deploy
```

### QA Environment
```
cap qa deploy
```
## Generate Application Documentation
```
cd online-investigators-guide
```
```
rails rdoc
```
```
open doc/app/index.html
```

## Troubleshooting Application

### Local Environment
```
cd online-investigators-guide
```
#### Start rails console
```
rails c
```
#### View logs
```
tail -f  log/local.log
```

### Development Environment
#### Start rails console
```
ssh deploy@whpihdev1
```
```
cd Apps/online-investigators-guide/current/
```
```
scl enable rh-ruby24 rh-git29 rh-nodejs6 mysql55 bash
```
```
rails c
```
#### View logs
```
cd Apps/online-investigators-guide/
```
```
tail -f  current/log/development.log
```

### QA Environment
#### Start rails console
```
ssh deploy@whrailsqa1
```
```
cd Apps/online-investigators-guide/current/
```
```
scl enable rh-ruby24 rh-git29 rh-nodejs6 mysql55 bash
```
```
rails c
```
#### View logs
```
cd Apps/online-investigators-guide/
```
```
tail -f  current/log/qa.log
```
