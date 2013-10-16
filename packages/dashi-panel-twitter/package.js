Package.describe({
  summary: "Displays the most recent tweet for a search"
});

Package.on_use(function (api, where) {
  api.use(
    [
      'dashi-panel'
    ], 
    'client'
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