var request = require('request');

var gkey = '10Kwg8Flo-5lmeAcBHme6K7EUrgSWwQNn_FgKLMl3niU';

Sheets = {
  Grammar: 1066923483,
  Examples: 232694477,
  Dialog: 722833796,
  Pairs: 1472623918,
  Vocab: 0,
  Lessons: 1841763393
}

// function writeFile(fp, data) {
//   fs.writeFile("/tmp/test", "Hey there!", function(err) {
//     if(err) {
//         console.log(err);
//     } else {
//         console.log("The file was saved!");
//     }
// }); 


sheetNames = Object.keys(Sheets)

for (c in sheetNames) {
  var fs = require('fs');

  sn = sheetNames[c]
  sid = Sheets[sn]
  // console.log(sn, Sheets[sn])
  url = "https://docs.google.com/spreadsheets/d/" + gkey + "/export?gid=" + sid + "&format=csv&id=" + gkey
  // console.log(sn, Sheets[sn])

  console.log('sn', sn)
  console.log('url', url)

  request(url, function (error, response, body) {

    if (!error && response.statusCode == 200) {
      fp = "app/packages/datapack/data/" + sn + ".csv";
      console.log('writing ', sn, "to:", fp)
      fs.writeFile(fp, body, function(err) {
          if(err) {
              console.log(err);
          } else {
              console.log("sn saved to:", fp);
          }
      });
      // console.log(body) // Print the google web page.
    } else {
      console.log('error?', error, response, body)
    }
  })

}



// URL="https://docs.google.com/spreadsheets/d/${KEY}/export?gid=${GTAB}&format=csv&id=${KEY}"


// request('http://www.google.com', function (error, response, body) {
//   if (!error && response.statusCode == 200) {
//     console.log(body) // Print the google web page.
//   }
// })
