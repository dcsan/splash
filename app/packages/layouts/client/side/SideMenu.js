// Generated by CoffeeScript 1.7.1
(function() {
  Template.SideMenu.hide = function() {
    console.log('SideMenu.hide');
    this.sideMenuVis = false;
    return $("#sideMenuOuter").hide();
  };

  this.sideMenuVis = false;

  Template.SideMenu.toggle = function() {
    console.log('SideMenu.toggle');
    this.sideMenuVis = !this.sideMenuVis;
    if (this.sideMenuVis) {
      return $("#sideMenuOuter").show();
    } else {
      return $("#sideMenuOuter").hide();
    }
  };

  Template.SideMenu.show = Template.SideMenu.toggle;

  Template.SideMenu.helpers({
    hide: function() {
      return Template.SideMenu.hide();
    },
    show: function() {
      return Template.SideMenu.toggle();
    },
    sideMenuItems: function() {
      return [
        {
          title: 'Home',
          url: '/home',
          icon: 'fa-home'
        }, {
          title: 'Lessons',
          url: '/lessons',
          icon: 'fa-graduation-cap'
        }, {
          title: 'XGram DB',
          url: '/lessons?topics=show',
          icon: 'fa-database'
        }, {
          title: 'My Deck',
          url: '/deck',
          icon: 'fa-list-alt'
        }, {
          title: 'Map',
          url: '/mapx',
          icon: 'fa-compass'
        }, {
          title: 'Dashboard',
          url: '/dashboard',
          icon: 'fa-line-chart'
        }, {
          title: 'Settings',
          url: '/settings',
          icon: 'fa-cog'
        }, {
          title: 'Splash',
          url: '/',
          icon: 'fa-sitemap'
        }
      ];
    }
  });

  Template.SideMenu.events({
    "click .sideItem": function(evt) {
      var url;
      evt.preventDefault();
      window.evt = evt;
      url = $(evt.target).attr("url");
      console.log("sideMenu", evt);
      Template.SideMenu.hide();
      return Router.go(url);
    },
    "click #sideMenuBack": function(evt) {
      evt.preventDefault();
      return Template.SideMenu.hide();
    }
  });

}).call(this);

//# sourceMappingURL=SideMenu.map
