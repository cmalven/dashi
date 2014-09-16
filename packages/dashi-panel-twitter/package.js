Package.describe({
  summary: "Displays the most recent tweet for a search",
  version: "1.0.0"
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
      'mrt:moment',
      'mrt:twit@0.2.0'
    ], 
    [
      'client',
      'server'
    ]
  );

  api.add_files(
    [
      'client/twitter-panel.styl',
      'client/twitter-panel.coffee',
      'client/twitter-panel.html',
      'client/twitter-panel-template.coffee'
    ],
    'client'
  );

  api.add_files(
    [
      'server/twitter-panel-methods.coffee',
      'server/twitter-panel-model.coffee'
    ],
    'server'
  );
});