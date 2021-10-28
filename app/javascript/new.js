function post (){
  const timezoneButton = document.getElementById("lists")
  const pullDownParents = document.getElementById("pull-down")
  const pullDownChild1 = document.getElementById("morning")
  const pullDownChild2 = document.getElementById("lunch")
  const pullDownChild3 = document.getElementById("dinner")
  const currentTime1 = document.getElementById("reservation_time_4i")
  const currentTime2 = document.getElementById("reservation_time_5i")
  const currentTime3 = document.getElementById("reservation_end_time_4i")
  const currentTime4 = document.getElementById("reservation_end_time_5i")

  timezoneButton.addEventListener('mouseover', function(){
    this.setAttribute("style", "background-color:#FFBEDA;")
  })

  timezoneButton.addEventListener('mouseout', function(){
    this.removeAttribute("style", "background-color:#FFBEDA;")
  })

  timezoneButton.addEventListener('click', function(){
    if  (pullDownParents.getAttribute("style") ==  "display:flex;") {
      pullDownParents.removeAttribute("style", "display:flex;")
    } else {
      pullDownParents.setAttribute("style", "display:flex;")
    }
  })

  pullDownChild1.addEventListener('click', function(){
    currentTime1.selectedIndex = 8;
    currentTime2.selectedIndex = 1;
    currentTime3.selectedIndex = 10;
    currentTime4.selectedIndex = 1;
  })
  pullDownChild2.addEventListener('click', function(){
    currentTime1.selectedIndex = 13;
    currentTime2.selectedIndex = 1;
    currentTime3.selectedIndex = 15;
    currentTime4.selectedIndex = 1;
  })
  pullDownChild3.addEventListener('click', function(){
    currentTime1.selectedIndex = 19;
    currentTime2.selectedIndex = 1;
    currentTime3.selectedIndex = 21;
    currentTime4.selectedIndex = 1;
  })

};

window.addEventListener('load', post);
