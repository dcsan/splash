# splash router

Meteor.startup ->

  Router.map ->

    @route 'chapterList',
      path: '/chapters'
      data: ->
        chapters = []
        for c in [1..20]
          chap = {
            title: "chapter #{c}"
            idx: c
            caption: "something #{c} something"
          }
          chapters.push(chap)
        return {
          chapters: chapters
        }
