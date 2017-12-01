

document.addEventListener("keyup", (event) => {
  var messageText = document.getElementById("message_content").value;

  if( messageText.includes("@")){
    console.log('yes');

  }else{
    console.log('no');

  }
})

