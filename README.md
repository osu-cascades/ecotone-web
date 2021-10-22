# Ecotone

[![Build Status](https://travis-ci.org/osu-cascades/ecotone-web.svg?branch=master)](https://travis-ci.org/osu-cascades/ecotone-web)
[![Code Climate](https://codeclimate.com/github/osu-cascades/ecotone-web/badges/gpa.svg)](https://codeclimate.com/github/osu-cascades/ecotone-web)
[![Test Coverage](https://codeclimate.com/github/osu-cascades/ecotone-web/badges/coverage.svg)](https://codeclimate.com/github/osu-cascades/ecotone-web/coverage)
[![Security](https://hakiri.io/github/osu-cascades/ecotone-web/master.svg)](https://hakiri.io/github/osu-cascades/ecotone-web/master)

[Ecotone](https://osu-ecotone.herokuapp.com/) enables Biology and Resource Management students to practice identifying native plants, identify different sites (plots), and track the long term trends of the ecotone on the [OSU Cascades](http://osucascades.edu) campus.

## Development
If you want to contribute to Ecotone, be sure to review the [contribution guidelines](https://github.com/osu-cascades/ecotone-web/blob/899030573a4a79cb30bf1e87bf31b0ba6e11fc78/CONTRIBUTING.md). This project adheres to Ecotones's [code of conduct](https://github.com/osu-cascades/ecotone-web/blob/899030573a4a79cb30bf1e87bf31b0ba6e11fc78/CODE_OF_CONDUCT.md). By participating, you are expected to uphold this code.

### Prerequisites
* Ruby 2.6.6
* PostgreSQL

### Setting up your environment
* Clone the repository
* Install the dependencies
    * `bundle install`
    * `yarn install`
* Create a `.env` file following the format in [.env.example](./.env.example)
    * Obtain Google OAuth credentials following [these basic steps](https://developers.google.com/identity/protocols/OAuth2#basicsteps)
* Set up the database
    * `rails db:setup`
    * `rails db:migrate`
* Run the tests
    * `rspec`
* Run the application
    * `rails s`

© 2019 Nathan Struhs, Yong Bakos.
