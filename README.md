# Meteor Dashboard

A simple dashboard built using Meteor.js

----

## Getting Started


```
# Install Meteor
curl https://install.meteor.com | /bin/sh

# Install Meteorite
sudo -H npm install -g meteorite

# Install Smart Packages
mrt install

# Start the App (only need sudo the first time)
meteor
```

## API Keys

Certain dashboard panels rely on API keys to function. When working with the app locally, the easiest way to handle this is by adding a file called `api_keys.coffee` to `/server`, with contents similar to the following:

```
process.env.FORECAST_API_KEY = 'XXXXXXXXXXXXXXXXXXXXXXXXXXXX'
process.env.CTA_TRAIN_TRACKER_API_KEY = 'XXXXXXXXXXXXXXXXXXXXXXXXXXXX'
process.env.HELP_SCOUT_API_KEY = 'XXXXXXXXXXXXXXXXXXXXXXXXXXXX'
process.env.SEMAPHORE_AUTH_TOKEN = 'XXXXXXXXXXXXXXXXXXXXXXXXXXXX'
process.env.HEROKU_API_KEY = 'XXXXXXXXXXXXXXXXXXXXXXXXXXXX'
```

It's up to you to acquire and supply your own API keys for all services. `api_keys.coffee` should not be checked into version control for security reasons. In fact, its add to `.gitignore` by default.


## Finding your way around

```
/server/main.coffee
```
Sets up Publications, makes the various panel options available, and bootstraps the default Dashboard.

```
/lib/panel.coffee
```
All panels extend from this class

```
panels
```
Each panel is stored here in its own self-contained directory

```
panels/foo-panel/client/foo-panel.coffee
```
The coffeescript class that extends Panel. Most important bit in here is the "_update" method, which will run once at app start, and again as determined by the panels interval. "_update" should add or modify data in the current collection to reactively update the template.

```
panels/foo-panel/client/foo-panel.styl
```
The unique style for this panel. A class is automatically applied to every panel that you can use to hook styles into.

```
panels/foo-panel/client/foo-panel.html
```
The unique template for the style. This can contain whatever you want, and will be updated whenever the collection changes.

```
panels/foo-panel/client/foo-panel-template.coffee
```
Template helpers for the panel. This file might not be necessary for all panels.

```
panels/foo-panel/server/foo-panel-model.coffee
```
Defines the parameters available when creating or editing this panel type. This will be have defaults added and be added to the PanelOptions collection by `server/main.coffee`


## Deployment

### …on Heroku

```
# Create the app initially
heroku apps:create your-app-name --stack cedar --buildpack https://github.com/oortcloud/heroku-buildpack-meteorite.git

# Add MongoHQ
heroku addons:add mongohq:sandbox

# Deploy updates
git push heroku master
```
### Resetting MongoHQ database on Heroku…

```
heroku addons:remove mongohq:sandbox && heroku addons:add mongohq:sandbox
```

### API Keys on Heroku

Certain dashboard panels rely on API keys to function. You can add your API keys to Heroku via Environment variables, like so:

```
heroku config:add FORECAST_API_KEY=XXXXXXXXXXXXXXXXXXXXXXXXXXXX
heroku config:add CTA_TRAIN_TRACKER_API_KEY=XXXXXXXXXXXXXXXXXXXXXXXXXXXX
heroku config:add HELP_SCOUT_API_KEY=XXXXXXXXXXXXXXXXXXXXXXXXXXXX
heroku config:add SEMAPHORE_AUTH_TOKEN=XXXXXXXXXXXXXXXXXXXXXXXXXXXX
heroku config:add HEROKU_API_KEY=XXXXXXXXXXXXXXXXXXXXXXXXXXXX
```

## Problems?

Meteor is still pretty fresh, so you're likely to run into some issues every once in awhile. Outlined below are the common issues and ways to address them:

### Issues with MongoDB

```
# Reset the database
meteor reset
```

### Permission woes?

It is *not* required that you run `sudo mrt`. If you do so, your home directory will pick up some root-owned files and you'll struggle to run `mrt` without `sudo` from then on. This isn't good.

To fix the problem, try cleaning up potentially "sudo-ed" files:

```bash
sudo mrt uninstall
sudo mrt uninstall --system
sudo chown -R `whoami` ~/.npm
```

If possible, try not to install Meteorite as root either. If you have permissions problems, make sure you install with `sudo -H npm install -g meteorite`. If you've installed without `-H`, your `~/.npm` directory will be owned by root and you should run the `chown` command above to fix it.

# If that fails, get rid of Meteorite and reinstall
sudo mrt uninstall && sudo mrt uninstall --system && sudo -H npm install -g meteorite && mrt install
```