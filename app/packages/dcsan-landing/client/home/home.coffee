Template.home.events
  'click #feedback': (evt) ->
    console.log("feedback")
    Intercom('show')

Template.home.helpers
  sampleLessons: () ->
    [
      { href:"/lessons/one/modals-1", text: "introduction to modals" }
      { href:"/lessons/one/modals", text: "more modals" }
      { href:"/lessons/one/comparisons", text: "comparisons" }
      { href:"/lessons/one/could-should-would", text: "could-should-would" }
      { href:"/lessons/one/despite-although", text: "despite-although" }
      { href:"/lessons/one/permission-advice", text: "permission-advice" }
      
    ]
