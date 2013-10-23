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

# Start the App
meteor
```

### API Keys

Many dashboard panels rely on API keys to function. When working with the app locally, the easiest way to handle this is by adding a file called `api_keys.coffee` to `/server`, with contents similar to the following:

```
process.env.FORECAST_API_KEY = 'XXXXXXXXXXXXXXXXXXXXXXXXXXXX'
process.env.CTA_TRAIN_TRACKER_API_KEY = 'XXXXXXXXXXXXXXXXXXXXXXXXXXXX'
process.env.HELP_SCOUT_API_KEY = 'XXXXXXXXXXXXXXXXXXXXXXXXXXXX'
process.env.SEMAPHORE_AUTH_TOKEN = 'XXXXXXXXXXXXXXXXXXXXXXXXXXXX'
process.env.HEROKU_API_KEY = 'XXXXXXXXXXXXXXXXXXXXXXXXXXXX'
```

It's up to you to acquire and supply your own API keys for all services. `api_keys.coffee` should not be checked into version control for security reasons. In fact, it's added to `.gitignore` by default.


## Deployment

### …on meteor.com

```
meteor deploy yourappname.meteor.com
```

## Troubleshooting

### Permission woes?

It is *not* required that you run `sudo mrt`. If you do so, your home directory will pick up some root-owned files and you'll struggle to run `mrt` without `sudo` from then on. This isn't good.

To fix the problem, try cleaning up potentially "sudo-ed" files:

```bash
sudo mrt uninstall
sudo mrt uninstall --system
sudo chown -R `whoami` ~/.npm
```

If possible, try not to install Meteorite as root either. If you have permissions problems, make sure you install with `sudo -H npm install -g meteorite`. If you've installed without `-H`, your `~/.npm` directory will be owned by root and you should run the `chown` command above to fix it.

### If that fails, get rid of Meteorite and reinstall
```
sudo mrt uninstall && sudo mrt uninstall --system && sudo -H npm install -g meteorite && mrt install
```

### Or uninstall and reinstall Meteor
```
rm -rf ~/.meteor/ && sudo rm /usr/local/bin/meteor

curl https://install.meteor.com | /bin/sh
```