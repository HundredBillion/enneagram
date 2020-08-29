document.addEventListener("DOMContentLoaded", function () {
  const element = document.querySelector("#carousel-indicator");
  element.classList.add("active");

  // document.querySelector('.carousel-indicators :first-child').classList.add('active');
  document.querySelector(".carousel-inner :first-child").classList.add("active");

  var sliders = document.getElementsByClassName("slider-1");
  for (var i = 0; i < sliders.length; i++) {
    sliders[i].addEventListener("input", function () {
      document.getElementById(
        this.getAttribute("id") + "score"
      ).innerText = this.value;
    });
  }

  //// show submit button when user gets to the final question /////
  const last_question = document.getElementById("question74");
  const first_question = document.querySelector(".carousel-inner :first-child");
  const showArrowBtn = () => {
    if (first_question.classList.contains("active")) {
      document.getElementsByClassName("carousel-control-prev")[0].style.display =
        "none";
    } else {
      document.getElementsByClassName("carousel-control-prev")[0].style.display =
        "flex";
    }
    //hide next arrow when user is on last question.
    if (last_question.offsetWidth > 0 && last_question.offsetHeight > 0) {
      document.getElementsByClassName("carousel-control-next")[0].style.display =
        "none";
      document.getElementById("calculate-btn").style.opacity = "1";
    } else {
      document.getElementsByClassName("carousel-control-next")[0].style.display =
        "flex";
    }
  }
  $('.arrow-button').on('click', function () {
    //show prev arrow when user has moved on from question 1.
    setTimeout(showArrowBtn, 645)
  })

})