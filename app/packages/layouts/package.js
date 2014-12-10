Package.describe({
  name: 'dcsan:layouts',
  summary: 'shared layouts and css',
  version: "0.0.1"
});

Package.on_use(function(api) {

    // use both
    api.use([
      'coffeescript',
      'underscore',
      'ui',
      'templating',
      'stylus',
      'mquandalle:jade',
      'jeremy:velocity-animate',
      'iron:router',
    ],['client']);

    // client assets
    api.addFiles([
      'styles/01-funcs.styl',
      'styles/animate.css',
      'styles/buttons.styl',
      'styles/logins.css',
      'styles/patterns-pure.css',
      'styles/patterns.styl',
      'styles/shared.styl',
      'styles/progress.styl',

      'styles/basic.styl',

      'client/page/mobile.jade',
      'client/page/meta.html',
      'client/page/loading.jade',
      'client/page/NotFound.jade',
      'client/page/ComingSoon.jade',
      'client/page/Locked.jade',
      'client/page/popUnder.jade',
      'client/page/popUnder.coffee',

      'client/styleGuide/styleGuide.jade',
      'client/styleGuide/styleGuide.styl',

      'client/side/SideMenu.jade',
      'client/side/SideMenu.styl',
      'client/side/SideMenu.coffee',

      'client/nav/MenuSpacer.jade',
      'client/nav/TopNav.jade',
      'client/nav/bottomNav.jade',
      'client/nav/bottomNav.styl',

      'client/widgets/nextButton.jade',
      'client/widgets/backButton.jade',
      'client/widgets/midButton.jade',
      'client/widgets/backButton.coffee',
      'client/nav/bottomNav.coffee'

    ], 'client' );

    api.addFiles([
      'both/routes.coffee'
    ], ['client' ,'server'] );

});
