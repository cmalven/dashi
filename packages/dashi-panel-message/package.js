Package.describe({
  summary: "Allows real-time messaging through Dashi",
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
      'mrt:moment'
    ], 
    [
      'client',
      'server'
    ]
  );

  api.add_files(
    [
      'client/message-panel.styl',
      'client/message-panel.coffee',
      'client/message-panel.html',
      'client/message-panel-template.coffee'
    ],
    'client'
  );

  api.add_files(
    [
      'server/message-panel-model.coffee'
    ],
    'server'
  );
});