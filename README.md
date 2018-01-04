# Online Investigators Guide

Online Investigators Guide provides researchers information on how to navigate their research by two ways.  The first way is to give the researchers
an unfiltered view of the PI Handbook. In this view the researchers will have full access to the entire PI Handbook and it is up to the researchers to
to figure out what sections applies to their research.  The second way is to give the researchers an filtered view of the PI Handbook, which is tailored
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

<big><pre>
**void** Click ([**Keycode**](#keycode) key) **const**
</pre></big>

## Deployment

Add additional notes about how to deploy this on a live system

## Built With

* [Dropwizard](http://www.dropwizard.io/1.0.2/docs/) - The web framework used
* [Maven](https://maven.apache.org/) - Dependency Management
* [ROME](https://rometools.github.io/rome/) - Used to generate RSS Feeds

## Contributing

Please read [CONTRIBUTING.md](https://gist.github.com/PurpleBooth/b24679402957c63ec426) for details on our code of conduct, and the process for submitting pull requests to us.

## Versioning

We use [SemVer](http://semver.org/) for versioning. For the versions available, see the [tags on this repository](https://github.com/your/project/tags).

## Authors

* **Billie Thompson** - *Initial work* - [PurpleBooth](https://github.com/PurpleBooth)

See also the list of [contributors](https://github.com/your/project/contributors) who participated in this project.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

* Hat tip to anyone who's code was used
* Inspiration
* etc













This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
