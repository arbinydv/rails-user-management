# Rails Authentication and Authorization 







### Rails API  📦✨
#### Rails API to support user authentication and authorization on the App. 🛒🔍
## Overview 📋
This project leverages authentication and authorization using `jwt`token based user managment in the Ruby on Rails tech stack to add user session management.
## Prerequisites 🛠️
Before you embark on this adventure, ensure you have the following tools installed on your system:
- Ruby on Rails framework
- Postman 

## 1. Check out the repository 📦
```bash
For instance, if you have GitHub SSH configured on your machine:

git clone git@github.com:arbinydv/rails-user-management.git

```
### 2. Getting the project up and running  🚀
* Install Dependencies 
  * Database: `PostgreSQL` 🐘
  * Gems
     * JWT token based authentication
        - Bcrypt
        - JWT
    * JSON Builder 
        - json
    * Modal Serializers
      - active_model_serializers
    * CORS Handler
      - rack-cors
  
  * Project
    ```
    bundle install
    ```
### Generating JWT Token and Hiding the Access
  * Generating 32 bits random key on app directory terminal:
    
      `openssl rand -base64 32`
  * Hiding the JWT_KEY: Run the command on your terminal:
      `EDITOR="code --wait" rails credentials:edit`

### Migrating Data 🌱

  Ensure that your PostgreSQL database is properly configured in `database.yml`
  ``` 
  rake db:create 
  
  rake db:migrate

  rake db:seed 
  ```

* Running Project  🏃
 * Rails Server
    ``` 
    rails server || rails s
    ```
 Now, your project is up and running at http://localhost:3000 🌐
#### 3. API Authentication and Authorization using POSTMAN
* Please refer to this Postman Collection inside this directory for all endpoints
    - app/storage


Feel free to explore and give feedbacks! 🎉
