Package.describe({
    summary: 'splash page with LPO',
    name: 'dcsan:chapters'
});

Package.on_use(function(api) {

    console.log('splash.on_use')

    api.use([
      'iron-router', 
      'templating',
      'ui',
      'coffeescript',
      'underscore',
      'stylus',
      'mquandalle:jade',
    ]);

    // server
    // api.add_files([
    //   'server/pubs.coffee',
    // ], 'server');

    // client
    api.add_files([
      'client/chapters.css',
      'client/views/chapters/chapterList.jade',
    ], 'client');

    // both
    api.add_files([
      'init.coffee',
      'routes.coffee'
    ]);

});