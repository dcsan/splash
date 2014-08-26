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
        {text: "Explained with gusto!"}
        {text: "Learn from our experts"}
      ]
      imageClass: "comicPanelImage"
      long: "all the details explained"
    }

    {
      image: '/splash/panels/discuss.png'
      title: 'Discussion'
      captions: [
        {text: "Learn from our other students"}
        {text: "studying with the buddy system!"}
      ]
      long: "make friends from all over the world and improve your studying power!"
      imageClass: "comicPanelImage"
    }

  ]

  return panels