const navSlide = () => {
	const  burger = document.querySelector('.burger');
	 const nav = document.querySelector('.nav-links'); 
	const navLinks = document.querySelector('.nav-links li'); 
	console.log(nav); 	
    burger.addEventListener('click',() =>{
	nav.classList.toggle("nav-active");
	console.log(nav);
	})
	
	
	
}

navSlide();


function clickButton() {
	  document.getElementById("myDropdown").style.display="block";
}
document.onload();
function openCity(evt, cityName) {
	  // Declare all variables
	  var i, tabcontent, tablinks;

	  // Get all elements with class="tabcontent" and hide them
	  tabcontent = document.getElementsByClassName("tabcontent");
	  for (i = 0; i < tabcontent.length; i++) {
	    tabcontent[i].style.display = "none";
	  }

	  // Get all elements with class="tablinks" and remove the class "active"
	  tablinks = document.getElementsByClassName("tablinks");
	  for (i = 0; i < tablinks.length; i++) {
	    tablinks[i].className = tablinks[i].className.replace(" active", "");
	  }

	  // Show the current tab, and add an "active" class to the link that opened the tab
	  document.getElementById(cityName).style.display = "block";
	  evt.currentTarget.className += " active";
	}