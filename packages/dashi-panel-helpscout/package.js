Package.describe({
  summary: "Displays the number of ongoing conversations for a HelpScout account"
});

Package.on_use(function (api, where) {
  api.use(
    [
      'dashi-panel',
      'jquery',
      'stylus',
      'templating',
      'minimongo',
      'mongo-livedata'
    ], 
    'client'
  );

  api.use(
    [
      'coffeescript',
      'momentjs'
    ], 
    [
      'client',
      'server'
    ]
  );

  api.add_files(
    [
      'client/helpscout-panel.styl',
      'client/helpscout-panel.coffee',
      'client/helpscout-panel.html',
      'client/helpscout-panel-template.coffee'
    ],
    'client'
  );

  api.add_files(
    [
      'server/helpscout-panel-methods.coffee',
      'server/helpscout-panel-model.coffee'
    ],
    'server'
  );
});