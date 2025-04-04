# Fivecast

Fivecast: Weather forecasting taken to another level. Level **5**.


https://fivecast.baconwrappedurns.com/


## Features
- No ads
- No third party data sharing
- No tracking cookies


## Technologies
- Ruby
- Ruby on Rails
- MiniTest
- Haml 🤗
- Sqlite
- Plain old CSS
- No~de~ JS


## Data Model
- Location: Collaspes all inputed addresses to a five digit zipcode.
- Forecast: A recorded call to the weather API.

A location has many forecasts. The latest forecast is available
via Location#latest_forecast. This method will fetch new data if it hasn't
been called in the passed 30 minutes.


## Local Development
- git clone
- bundle install
- rails db:setup db:migrate
- rails test


## Deploying
- Launch a VPS like a Digital Ocean Droplet
- Create an account in an Docker image registry like Docker
- Export FIVECAST_IP, FIVECAST_HOSTS, and FIVECAST_REGISTRY_USERNAME
- kamal setup
- kamal deploy


## Authors
- [@bradly](https://www.github.com/bradly)
