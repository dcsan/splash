Package.describe({
  name: 'dcsan:landing',
  summary: 'landing page optimization',
  version: "0.0.1"
});

Package.on_use(function (api) {

  // use both
  api.use([
    'iron:router',
    'coffeescript',
    'underscore',
    // 'dcsan:dclib',
    // 'dcsan:loco',
  ],['client', 'server'])

  // use client
  api.use([
    'ui',
    'templating',
    'stylus',
    'mquandalle:jade',
    // 'dcsan:apubsubman',
    // 'dcsan:trix',
    // 'dcsan:deck'
  ], 'client');

  // SERVER
  // api.use([
  //   'meteorhacks:npm@1.2.0',
  //   'npm-container'
  // ], 'server')

  // assets
  // api.addFiles([
  //   'assets/menuItems.yml'
  // ], ['server'], {isAsset: true} )



  // both
  api.addFiles([
    'both/routes.coffee',
    'both/colib.coffee'
  ]);

  // client
  api.addFiles([

    'client/shared.styl',

    'client/lib/global-helpers.coffee',

    'client/landing/landing.jade',
    'client/landing/landing.styl',
    'client/landing/MenuData.coffee',
    'client/landing/landing.coffee',

    'client/widgets/topLogo.jade',
    'client/widgets/topLogo.styl',
    'client/widgets/landingButton.jade',
    'client/widgets/landingButton.styl',

    'client/home/home.styl',
    'client/home/home.jade',
    'client/home/home.coffee',

  ], 'client');

  api.export(['colib', 'MenuData'])

});
