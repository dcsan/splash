Package.describe({
    summary: 'splash page with LPO'
});

Package.on_use(function(api) {

    console.log('splash.on_use')

    api.use([
      'iron-router', 
      'templating',
      'ui',
      'coffeescript',
      'underscore',
      'jade',
    ]);

    // server
    // api.add_files([
    //   'server/pubs.coffee',
    // ], 'server');

    // client
    api.add_files([
      'client/views/layout/mobile.html',
      'client/lib/SplashView.coffee',
      'client/lib/FamRender.coffee',
      'client/splash.css',
      'client/views/splash/splash.jade', 
      'client/views/splash/splash.coffee',
      // 'client/famous.css'
    ], 'client');

    // both
    api.add_files([
      'init.coffee',
      'routes.coffee'
    ]);

    api.export([
      'FamRender',
      'SplashView',
      // 'famo'
    ]);

});