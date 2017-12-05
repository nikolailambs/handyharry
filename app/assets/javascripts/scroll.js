// messager scroll
function scrollLastMessageIntoView() {
  const messages = document.querySelectorAll('.message');
  const lastMessage = messages[messages.length - 1];

  if (lastMessage !== undefined) {
    lastMessage.scrollIntoView();
  }
}



// messager scroll with keyboard
var $htmlOrBody = $('html, body'), // scrolling happens on body for some browsers, html for others
    scrollTopPadding = 8,
    scrollTopLast = 0;
$('#message_content').focus(function() {
  console.log("yes")
  var textareaTop = $(this).offset().top;
    // save the current scroll position for blur event
    console.log($(window).scrollTop());
    scrollTopLast = $(window).scrollTop();
    // scroll to the textarea
    var timing = 250;
    $htmlOrBody.animate({ scrollTop: textareaTop - scrollTopPadding }, timing);
}).blur(function() {
    // scroll back to position before textarea focus
    console.log("no")
    $htmlOrBody.scrollTop(scrollTopLast);
});


// scroll animation on index
window.onscroll=function(){
    window.stackHeads();
};
window.stackHeads=function(){
    fixedHeads=document.getElementsByClassName('fixed-objects');
    for(i=0;i<fixedHeads.length;i++){
        header=fixedHeads[i];
        nextheader=fixedHeads[i+1];
        holder=getPrevNext(header)[0];
        if(window.pageYOffset>findPosY(holder)){
            //if our scroll position in the window is father than the placeholder of the current header's position in the DOM...
            if(typeof nextheader!='undefined'){
                //If this isn't the last header.
                dif=findPosY(nextheader)-window.pageYOffset;
                //the diference between our scroll position and the header's placeholder's position
                if(dif<header.offsetHeight){
                    //if we have less distance between the placeholder of the next element and the top of of the page than the height of the current header, we push the header up so it doesn't overlap.
                    // header.style.opacity="1";
                    header.style.position="fixed";
                    header.style.top='-'+(header.offsetHeight-dif)+'px';
                    header.style.width="100% !important";

                }
                else{
                    //if there is another header, but we have room
                    //console.log(header)
                    // header.style.opacity="1";
                    holder.style.height=header.offsetHeight+'px';
                    header.style.position="fixed";
                    header.style.top="0px";
                    header.style.width="100% !important";
                }

            }

            else if (window.pageYOffset>180) {

              holder.style.height=header.offsetHeight+'px';
              header.style.opacity="0";
              //if there isn't another header
              header.style.position="fixed";
              header.style.top="0px";
              header.style.width="100% !important";
            }

            else{
                // console.log($('.tabs'));

                holder.style.height=header.offsetHeight+'px';
                //if there isn't another header
                header.style.position="fixed";
                header.style.top="0px";
                header.style.width="100% !important";
                header.style.opacity= `${100/window.pageYOffset + (1 - 0.9)}`;
            }


        }
        else{
            header.style.opacity= `${100/window.pageYOffset + (1 - 0.9)}`;
            // header.style.opacity="1";
            holder.style.height='0px';
            //if we haven't gotten to the header yet
            header.style.position='static';
            header.style.removeProperty('top');
            header.style.width="100% !important";

        }

    }
};
function getPrevNext(el){
    els=document.getElementsByTagName('*');
    for(j=0;j<els.length;j++){
        if(els[j]==el){
            return [els[j-1],els[j+1]];
        }
    }
    return false;
}

function findPosX(obj)
  {
    var curleft = 0;
    if(obj.offsetParent)
        while(1)
        {
          curleft += obj.offsetLeft;
          if(!obj.offsetParent)
            break;
          obj = obj.offsetParent;
        }
    else if(obj.x)
        curleft += obj.x;
    return curleft;
  }

  function findPosY(obj)
  {
    var curtop = 0;
    if(obj.offsetParent)
        while(1)
        {
          curtop += obj.offsetTop;
          if(!obj.offsetParent)
            break;
          obj = obj.offsetParent;
        }
    else if(obj.y)
        curtop += obj.y;
    return curtop;
  }
