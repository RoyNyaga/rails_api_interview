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
- You will need `curl` or any other software such as postman for making request to the server.
- test account: admin user credentials => email: "testname@gmail.com", password: "123456789"

### End points
- NBi: All of the endpoints will require authentication except for the POST `http://localhost:3000/api/v1/authenticate`, GET `http://localhost:3000/api/v1/users` and POST `http://localhost:3000/api/v1/users`.
- NBii: Users need to be Admin in other to be able to delete other users.
- NBiii: for endpoint requiring authentication, you will have to do post request to 
```http://localhost:3000/api/v1/authenticate
    {
      "email": "testname@gmail.com",
      "password": "123456789"
    }
```
copy the returned `auth_token` which you will pass on the header of subsequent request
```
  "Authorization": thoken
```
#### users endpoints
- PATCH http://localhost:3000/api/v1/users/:id/add_admin
- GET http://localhost:3000/api/v1/users
- GET http://localhost:3000/api/v1/users/:id
- POST http://localhost:3000/api/v1/users
- PATCH http://localhost:3000/api/v1/users/:id
- DELETE http://localhost:3000/api/v1/users/:id
#### posts endpoints
- GET http://localhost:3000/api/v1/posts
- GET http://localhost:3000/api/v1/posts/:id
- POST http://localhost:3000/api/v1/posts
- PATCH http://localhost:3000/api/v1/posts/:id
- DELETE http://localhost:3000/api/v1/posts/:id


