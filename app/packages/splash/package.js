Package.describe({
    summary: 'splash page with LPO',
    name: 'dcsan:splash'
});

Package.on_use(function(api) {

    api.versionsFrom('METEOR@1.0');
    console.log('splash.on_use');

    api.use([
      'templating',
      'ui',
      'coffeescript',
      'underscore',
      'iron:router', 
      'mquandalle:jade',
      'raix:famono@0.8.0'
    ]);

    // server
    // api.add_files([
    //   'server/pubs.coffee',
    // ], 'server');

    // client
    api.add_files([
      'client/lib/ui-helpers.coffee',
      'client/lib/ComicPanel.coffee',
      'client/lib/SplashView.coffee',
      'client/lib/FamRender.coffee',
      'client/lib/SpriteButton.coffee',
      'client/views/shared/splashButtons.jade',
      'client/splash.css',
      'client/views/splash/splash.jade', 
      'client/views/splash/splash.coffee',
      'client/views/landing/landing.jade',
      'client/views/landing/landing.coffee',
      'client/views/about/about.jade',
      'client/views/about/about.coffee',
      // 'client/views/shared/mobile.html',
      // 'client/famous.css'
    ], 'client');

    // both
    api.add_files([
      'init.coffee',
      'routes.coffee',
      'data/CoverData.coffee',
    ]);

    api.export([
      'FamRender',
      'SplashView',
      'ComicPanel',
      'CoverData',
      'SpriteButton'
      // 'famo'
    ]);

});