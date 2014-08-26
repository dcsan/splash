Package.describe({
    summary: 'splash page with LPO'
});

Package.on_use(function(api) {

    console.log('splash.on_use')

    api.use([
      'famono',
      'iron-router', 
      'templating',
      'ui',
      'coffeescript',
      'underscore',
      // 'jade',
    ]);

    // server
    // api.add_files([
    //   'server/pubs.coffee',
    // ], 'server');

    // client
    api.add_files([

      // 'client/views/shared/splashButtons.jade',
      // 'client/views/splash/splash.jade', 
      // 'client/views/about/about.jade',
      // 'client/views/landing/landing.jade',
      'client/views/shared/splashButtons.html',
      'client/views/splash/splash.html', 
      'client/views/about/about.html',
      'client/views/landing/landing.html',

      'client/lib/ui-helpers.coffee',
      'client/lib/SplashPanel.coffee',
      'client/lib/SplashView.coffee',
      'client/lib/FamRender.coffee',
      'client/lib/SpriteButton.coffee',
      
      'client/splash.css',
      'client/views/splash/splash.coffee',
      'client/views/landing/landing.coffee',
      'client/views/about/about.coffee',
      // 'client/views/shared/mobile.html',
      // 'client/famous.css'
    ], 'client');

    // both
    api.add_files([
      'init.coffee',
      'routes.coffee',
      'data/SplashData.coffee',
    ]);

    api.export([
      'FamRender',
      'SplashView',
      'SplashPanel',
      'CoverData',
      'SpriteButton'
      // 'famo'
    ]);

});