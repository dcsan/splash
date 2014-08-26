CoverData = {
  test: true
}

console.log("CoverData.open")

CoverData.find = () ->
  
  panels = [

    {
      image: '/splash/panels/comic.png'
      title: 'Comic Adventure'
      captions: [
        {text: "Your english adventure"}
        {text: "starts here!"}
      ]
      long: "A choose your own adventure style game. Listen to the in-game characters and make the right decisions."
      imageClass: "comicPanelImage"

    }

    {
      image: '/splash/panels/game.png'
      title: 'Lots of Games'
      captions: [
        {text: "Keep your mind engaged"}
        {text: "with fun games!"}
      ]
      long: "We have a series of different games to keep your brain engaged. Everything from vocabulary matching to deeper quizzes and even noughts and crosses!"
      imageClass: null
    }

    {
      image: '/splash/panels/lesson.png'
      title: 'Grammar Lessons'
      captions: [
        {text: "Learn from our experts"}
      ]
      imageClass: "comicPanelImage"
    }

    {
      image: '/splash/panels/discuss.png'
      title: 'Discussion'
      captions: [
        {text: "Learn from our other students"}
      ]
      imageClass: "comicPanelImage"
    }

  ]

  return panels