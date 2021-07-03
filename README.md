# Api with JWT authentication system
### About
This is an API build with ruby on rails. It is made up of three resources which are, users, posts and comments.
### Functionalities
* Hand coded JWT authentication system.
* Authorization for protected routes.
* REST architecture for users, posts and comments resources.
* Validation of sensitive information.
* Serialization and nested formating of data.
* Error handling for resources which are not found.
* Unit and request test with Rspec.
* seeded data to start wth.
### Technology used
* Ruby 3.0.0
* Rails 6.1.4
* Rspec
* Faker
* Blueprint
### Installation
- clone the application using `git clone git@github.com:RoyNyaga/rails_api_interview.git`
- open your terminal and cd to your root directory `cd rails_api_interview`
- install gems `bundle`
- setup application with `rails db:setup` this should get you up and running with seeded data.
- start the development server `rails s`
### usage
You will need `curl` or any other application for making request to the server.
#### End points
NB: All of the endpoints will require authentication except for the `/authenticate` and get `users`.
NB: Users need to be Admin in other to be able to develete resouces

