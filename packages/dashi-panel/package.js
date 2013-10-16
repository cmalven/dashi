Package.describe({
  summary: "Base Dashi Panel"
});

Package.on_use(function (api, where) {
  api.use(
    [
      'jquery',
      'coffeescript',
      'underscore',
      'templating',
      'minimongo',
      'mongo-livedata'
    ], 
    'client'
  );

  api.add_files(
    [
      'panel.coffee'
    ],
    'client'
  );
});