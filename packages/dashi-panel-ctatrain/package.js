Package.describe({
  summary: "Displays upcoming stops for a given station of the Chicago Transit Authority L Train"
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
      'client/ctatrain-panel.styl',
      'client/ctatrain-panel.coffee',
      'client/ctatrain-panel.html',
      'client/ctatrain-panel-template.coffee',
      'client/vendor/jquery.xml2json.js'
    ],
    'client'
  );

  api.add_files(
    [
      'server/ctatrain-panel-methods.coffee',
      'server/ctatrain-panel-model.coffee'
    ],
    'server'
  );
});