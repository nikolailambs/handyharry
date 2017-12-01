

// document.addEventListener("keyup", (event) => {
//   var messageText = document.getElementById("message_content").value;

//   if( messageText.includes("@")){

//     var result = filter(messageText.split(" "), 0, "@" )
//     console.log(result);
//   };
// });

function filter(names, index, letter) {
    var filteredNames = names.filter(function(word) {
       return word.charAt(index) === letter;
    });
    return filteredNames;
}
