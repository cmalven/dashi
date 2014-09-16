Package.describe({
  summary: "Shows the most recent build status for a Semaphore account",
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
      'client/semaphore-panel.styl',
      'client/semaphore-panel.coffee',
      'client/semaphore-panel.html',
      'client/semaphore-panel-template.coffee'
    ],
    'client'
  );

  api.add_files(
    [
      'server/semaphore-panel-methods.coffee',
      'server/semaphore-panel-model.coffee'
    ],
    'server'
  );
});