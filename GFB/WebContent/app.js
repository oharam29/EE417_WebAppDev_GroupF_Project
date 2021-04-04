const burger = document.querySelector(".burger");
const nav = document.querySelector(".navlinks");
const navLinks = document.querySelectorAll(".navlinks li");

function navSlide() {
    
    burger.addEventListener("click", () => {
        //Toggle Nav
        nav.classList.toggle("nav-active");
        
        //Animate Links
        navLinks.forEach((link, index) => {
            if (link.style.animation) {
                link.style.animation = ""
            } else {
                link.style.animation = `navLinkFade 0.5s ease forwards ${index / 7 + 0.5}s`;
            }
        });
        //Burger Animation
        burger.classList.toggle("toggle");
    });
    
}

navSlide();

function navClose() {
    //Will close the menu after an action from the user

    nav.addEventListener("click", () => {
        //Toggle Nav
        nav.classList.toggle("nav-active");
        
        //Animate Links
        navLinks.forEach((link, index) => {
            if (link.style.animation) {
                link.style.animation = ""
            } else {
                link.style.animation = `navLinkFade 0.5s ease forwards ${index / 7 + 0.5}s`;
            }
        });
        //Burger Animation
        burger.classList.toggle("toggle");
    });

}


navClose();

     ///////////////////////////FOR THE MODAL
    // Get the modal
	var modal = document.getElementById("myModal");

    var btn = document.getElementById("actions");

    var span = document.getElementsByClassName("close")[0];

    span.onclick = function() {
         modal.style.display = "none";
    };

    window.onclick = function(event) {
     if (event.target == modal) {
        modal.style.display = "none";
        }
    };

