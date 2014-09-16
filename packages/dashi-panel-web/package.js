Package.describe({
  summary: "Displays the contents of a web page",
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
      'client/web-panel.styl',
      'client/web-panel.coffee',
      'client/web-panel.html',
      'client/web-panel-template.coffee'
    ],
    'client'
  );

  api.add_files(
    [
      'server/web-panel-model.coffee'
    ],
    'server'
  );
});