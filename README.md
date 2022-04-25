# Ecotone

[![Build Status](https://travis-ci.org/osu-cascades/ecotone-web.svg?branch=master)](https://travis-ci.org/osu-cascades/ecotone-web)
[![Code Climate](https://codeclimate.com/github/osu-cascades/ecotone-web/badges/gpa.svg)](https://codeclimate.com/github/osu-cascades/ecotone-web)
[![Test Coverage](https://codeclimate.com/github/osu-cascades/ecotone-web/badges/coverage.svg)](https://codeclimate.com/github/osu-cascades/ecotone-web/coverage)

[Ecotone](https://osu-ecotone.herokuapp.com/) enables Biology and Resource Management students to practice identifying native plants, identify different sites (plots), and track the long term trends of the ecotone on the [OSU-Cascades](http://osucascades.edu) campus.

## Development
If you want to contribute to Ecotone, be sure to review the [contribution guidelines](https://github.com/osu-cascades/ecotone-web/blob/899030573a4a79cb30bf1e87bf31b0ba6e11fc78/CONTRIBUTING.md). This project adheres to Ecotones's [code of conduct](https://github.com/osu-cascades/ecotone-web/blob/899030573a4a79cb30bf1e87bf31b0ba6e11fc78/CODE_OF_CONDUCT.md). By participating, you are expected to uphold this code.

## Prerequisites
* [Ruby 3.1.1](https://rvm.io/)
* [Rails 7.0.2](http://www.installrails.com/)
* [PostgreSQL](https://www.digitalocean.com/community/tutorials/how-to-install-postgresql-on-ubuntu-20-04-quickstart)
* [NodeJS](https://nodejs.org/en/download/)

## Environment Setup

### 1. Clone the repository
Add the GitHub repository in your choice of directory.
````
git clone git@github.com:osu-cascades/ecotone-web.git
````

### 2. Install dependencies
After cloning the repository, install the required gems.
````
bundle install
````
If you run into dependency issues, try deleting `Gemfile.lock` and rerunning the install command.

### 3. Database setup
3.1 Create a `.env` file following the format in [.env.example](./.env.example)     
Fill the {} in the DATABASE_URL sections with the credentials you used setting up PostgreSQL.     
Don't worry about the GOOGLE_CLIENT yet, we'll get there.

3.2 Obtain Google OAuth credentials     
Now it's time to worry about the GOOGLE_CLIENT sections. 
* [Set up an account](https://console.developers.google.com/) with Google API Console
* On the main page, click "Create Project"
    * Name the project Ecotone
    * Leave "No Location" as the option
    * Click "Create"
* Look to the menu on the left and click "OAuth Consent Screen"
    * Choose "External" for User Type, then "Save and Continue"
    * App information
        * App name: Ecotone
        * User support email: email used to create account
        * App logo: Ignore this
    * App domain: Ignore this section
    * Authorized domains (click "Add domain" for each one you need)
        ````
        ecotone.com
        ````
        ````
        osu-ecotone.herokuapp.com
        ````
        ````
        osu-ecotone-staging.herokuapp.com
        ````
        * Note: only add herokuapp domains if you will be deploying the app
    * Developer contact email: email used to create account
    * Click "Save and Continue"
    * Skip everything in Scopes, click "Save and Continue"
    * Skip everything in Test Users, click "Save and Continue"
    * Verify the information, then click "Back to Dashboard"
* Look to the menu on the left and click "Credentials"
    * Click "Create Credentials", choose "OAuth Client ID"
    * Application type: Web application
    * Name: Ecotone Development
    * Authorized JavaScript origins: Ignore this
    * Authorized redirect URIs (click "Add URI" for each one)
        ````
        http://localhost:3000/users/auth/google_oauth2/callback
        ````
        ````
        https://osu-ecotone.herokuapp.com/users/auth/google_oauth2/callback
        ````
        ````
        https://osu-ecotone-staging.herokuapp.com/users/auth/google_oauth2/callback
        ````
    * Click "Create"
* A page will pop up with your Google Client ID and Client Secret - use these to fill in the rest of the `.env` file

3.3 Finally, set up the databases in rails. If everything is set up correctly, these will run without errors. 
````
rails db:setup
rails db:migrate
````
If you want to start with some information already populated in the database, run the seed file.
````
rails db:seed
````
If that command fails, instead run the reset command to drop and reset the databases with the seed data.
````
rails db:reset
````

### 4. "Hello world" run of Ecotone
* Run the tests (test suite should be green): `rspec`
* Run the application: `rails s`
* Hit http://localhost:3000 in your browser of choice

If you see the Ecotone homepage pop up, congratulations! You can now hack away:tada:

### 5. Heroku setup (optional)
Still not sick of setting up your dev environment? Then continue with configuring app deployment to Heroku by adding the following lines to your `.git/config` file:
````
[remote "production"]
    url = https://git.heroku.com/osu-ecotone.git
    fetch = +refs/heads/*:refs/remotes/heroku/*
[remote "staging"]
    url = https://git.heroku.com/osu-ecotone-staging.git
    fetch = +refs/heads/*:refs/remotes/heroku/*
````
This adds the remote Heroku repositories to your local git configuration. To use Heroku on the command line, make sure you have installed the [Heroku CLI](https://devcenter.heroku.com/articles/heroku-cli#install-the-heroku-cli).

To deploy the app, git push to one of the Heroku apps.
````
git push [staging|production] {branch}:master
````
If you are pushing from your local master branch, then you can omit the last part of the command. Otherwise, replace {branch} with the name of the branch you are deploying from. To override outdated commits, such as when you push then rollback to a previous version, add `--force` to the command.

### Final Tidbits
If you want all the app power of admin privileges, follow these steps:

First, find yourself as a user. You can either take a guess at your ID or check using Rails dbconsole.
````
rails db
````
Enter the password if prompted. This opens up a shell to your local development database. You can use basic SQL statements to see all users in the database. Find yourself and take note of what ID is assigned to you.
````
>>> SELECT * from users;
````

Next, open up the rails console (another shell), which we can use to manipulate information.
````
rails c
````
This will open up the rails terminal. Once inside, find yourself as a user then set your admin priveleges.
````
>>> me = User.find(ID)
>>> me.admin = true
>>> me.save
>>> exit
````
Run `rails s` and go to `localhost:3000` in your browser. You will know you are an admin if there is an additional "Users" section on the navbar and you have the ability to "Add Plots" on the Plots page.      

Thanks for reading! :bowtie:

#### License
© 2019 Nathan Struhs, Yong Bakos.
