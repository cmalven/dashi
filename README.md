# Meteor Dashboard

A simple dashboard built using Meteor.js

----

## Getting Started


```
# Install Meteor
curl https://install.meteor.com | /bin/sh

# Install Meteorite
sudo npm install -g meteorite

# Start the App (only need sudo the first time)
sudo mrt
```

## Finding your way around

```
/server/main.coffee
```
All panels are configured here

```
/lib/panel.coffee
```
All panels extend from this class

```
/client/panels
```
Each panel is stored here in its own self-contained directory

```
/client/panels/foo-panel/foo-panel.coffee
```
The coffeescript class that extends Panel. Most important bit in here is the "_update" method, which will run once at app start, and again as determined by the panels interval. "_update" should add or modify data in the current collection to reactively update the template.

```
/client/panels/foo-panel/foo-panel.styl
```
The unique style for this panel. A class is automatically applied to every panel that you can use to hook styles into.

```
/client/panels/foo-panel/foo-panel.html
```
The unique template for the style. This can contain whatever you want, and will be updated whenever the collection changes.

```
/client/panels/foo-panel/foo-panel-template.coffee
```
Template helpers for the panel. This file might not be necessary for all panels.

## Deployment

### …on meteor.com
Deploying to meteor.com is the fastest and easiest way to get the app online for live testing. The app is deployed at http://dashi.meteor.com

`meteor deploy dashi.meteor.com	`

### …on Heroku

```
# Create the app initially
heroku apps:create your-app-name --stack cedar --buildpack https://github.com/oortcloud/heroku-buildpack-meteorite.git

# Add MongoHQ
heroku addons:add mongohq:sandbox

# Deploy updates
git push heroku master
```