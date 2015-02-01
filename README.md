# Dashi

A simple dashboard built using Meteor.js

----

## Getting Started


```
# Install Meteor
curl https://install.meteor.com | /bin/sh

# Start the App
meteor
```

### API Keys

Each Dashi _Board_ consists of any number of _Panels_ which are simple, independent Meteor packages that can visualize anything from local weather to Heroku deployments. The following panels are included with Dashi, and creating your own panels is super simple, just use one of the existing panels as a code reference...

- **CTA Train:** Shows upcoming arrivals for any El station in the [CTA](http://www.transitchicago.com). 
- **HelpScout:** Show the number of outstanding tickets for any mailbox in [HelpScout](http://www.helpscout.net) 
- **Heroku:** Show the number of deployments per week for any [Heroku](https://www.heroku.com) app.
- **Message:** A simple way to post messages to the dashboard (e.g. "Cookies in the break room!")
- **Semaphore:** Show the status of the latest [Semaphore](https://semaphoreapp.com) build.
- **Time:** An analog display of the current time.
- **Twitter:** View the latest [Twitter](https://twitter.com) post matching a search query.
- **Weather:** Displays the local weather.
- **Web:** Embeds an iframe view of any web site. Great for including panels from [other dashboard systems](http://panic.com/statusboard/).

### API Keys

Many dashboard panels rely on API keys to function. When working with the app locally, the easiest way to handle this is by adding a file called `api_keys.coffee` to `/server`, with contents similar to the following:

```
process.env.FORECAST_API_KEY = 'XXXXXXXXXXXXXXXXXXXXXXXXXXXX'
process.env.CTA_TRAIN_TRACKER_API_KEY = 'XXXXXXXXXXXXXXXXXXXXXXXXXXXX'
process.env.HELP_SCOUT_API_KEY = 'XXXXXXXXXXXXXXXXXXXXXXXXXXXX'
process.env.SEMAPHORE_AUTH_TOKEN = 'XXXXXXXXXXXXXXXXXXXXXXXXXXXX'
process.env.HEROKU_API_KEY = 'XXXXXXXXXXXXXXXXXXXXXXXXXXXX'
process.env.TWITTER_CONSUMER_KEY = 'XXXXXXXXXXXXXXXXXXXXXXXXXX'
process.env.TWITTER_CONSUMER_SECRET = 'XXXXXXXXXXXXXXXXXXXXXXXXXX'
process.env.TWITTER_ACCESS_TOKEN = 'XXXXXXXXXXXXXXXXXXXXXXXXXX'
process.env.TWITTER_ACCESS_TOKEN_SECRET = 'XXXXXXXXXXXXXXXXXXXXXXXXXX'
```

It's up to you to acquire and supply your own API keys for all services. `api_keys.coffee` should not be checked into version control for security reasons. In fact, it's added to `.gitignore` by default.

**Note:** Use of the Twitter Panel requires that you register an application at https://dev.twitter.com/


## Deployment

### …on meteor.com

```
meteor deploy yourappname.meteor.com
```

## Troubleshooting

### Uninstall and reinstall Meteor
```
rm -rf ~/.meteor/ && sudo rm /usr/local/bin/meteor

curl https://install.meteor.com | /bin/sh
```