CoverData = {
  test: true
}

console.log("CoverData.open")

CoverData.find = () ->
  
  panels = [

    {
      image: '/splash/covers/cover-350.jpg'
      title: 'Comic Adventure'
      captions: [
        {text: "Your english adventure"}
        {text: "starts here!"}
      ]
      imageClass: "comicPanelImage"

    }

    {
      image: '/splash/mocks/syns-thumb-350.png'
      title: 'Lots of Games'
      captions: [
        {text: "Keep your mind engaged"}
        {text: "with fun games!"}
      ]
      imageClass: null
    }

    {
      image: '/splash/mocks/lesson.png'
      title: 'Grammar Lessons'
      captions: [
        {text: "Learn from our experts"}
      ]
      imageClass: "comicPanelImage"
    }

    {
      image: '/splash/mocks/discuss.png'
      title: 'Discussion'
      captions: [
        {text: "Learn from our other students"}
      ]
      imageClass: "comicPanelImage"
    }

  ]

  return panels