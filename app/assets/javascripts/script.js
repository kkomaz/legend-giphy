// SLIDER
var slider = function() {

  // Set time delay of slider
  var delay = 5000;

  // Set variables
  var numImages = $('.player-image img').length;
  var previousImage = numImages;
  var currentImage = 1;
  var nextImage = 2;

  // Find width of container div
  var sliderWidth = $("#slider").width() + 2;

  // Give images same width as slider
  var sizeImages = function() {
    $(".player-image img").width(sliderWidth);
  };
  sizeImages();

  // Create as many navigation dots as there are pictures
  for (var i = 1; i <= numImages; i++) {
    $('#dots').find('ul').append($('<li class="dot ' + i + '""></li>'));
  }

  // Set initial position of images
  var resetImages = function() {
    $('.img').css({"left": sliderWidth+"px"});
    $('.img').first().css({"left": "0px"});
  };
  resetImages();
  //set the initial position

  // Slide to next image
  var slideNextImageLeft = function() {
    $('.image-' + nextImage).css({"left": sliderWidth+"px"});
    //setting the margin left of the next image with 878 px away
    $('.image-' + currentImage).animate({left: sliderWidth * -1}, 1000);
    //animating the current image left -878px away at 1000 timer
    $('.image-' + nextImage).animate({left: "0px"}, 1000);
    //animating the next to become to show up
    currentImage = nextImage;
    //setting current image to become nextImage
    increaseImages();
    //call the increase images
  };

  // Slide to the previous image
  var slidePreviousImageRight = function() {
    $('.image-' + previousImage).css({"left": (sliderWidth * -1)+"px"});
    //setting the margin left to be -878 px away from the left
    $('.image-' + currentImage).animate({left: sliderWidth}, 1000);
    //setting the previous current image to the 878 px from the left
    $('.image-' + previousImage).animate({left: "0px"}, 1000);
    //setting the previous image back to center
    currentImage = previousImage;
    //setting the current Image back to the previous image
    increaseImages();
    //call the increase images
  };

  // Shift which images are next and previous
  var increaseImages = function() {
    if(currentImage === numImages) {
      nextImage = 1;
      previousImage = currentImage - 1;
    } else {
      nextImage = currentImage + 1;
      if(currentImage === 1) {
        previousImage = numImages;
      } else {
        previousImage = currentImage - 1;
      }
    }

    // Change dots status
    $('#dots').find('li').removeClass("active");
    $('#dots').find('.' + currentImage).addClass("active");
    //goes throught dots id into the dot array. finds current dot and adds class of active
  };

  //starter and actuaal clicks

  // Set initial slider interval
  moveImages = setInterval(function() {
    slideNextImageLeft();
  }, delay);

  // When next button is clicked
  $('.next').click(function() {
    clearInterval(moveImages);
    moveImages = setInterval(function() {
      slideNextImageLeft();
    }, delay);
    slideNextImageLeft();
    //calls the slide image left along with the timer again
  });

  // When previous button is clicked
  $('.previous').click(function() {
    clearInterval(moveImages);
    moveImages = setInterval(function() {
      slideNextImageLeft();
    }, delay);
    slidePreviousImageRight();
    //calls the slide image right along with the timer again
  });

  // When a navigation dot is clicked
  $('.dot').click(function() {
    dotList = $('#dots').children().children();
    buttonPressed = dotList.index(this) + 1;
    //finds the index wrapped by the li (starts at 0 thus the + 1)
    if(buttonPressed !== currentImage) {
      clearInterval(moveImages);
      moveImages = setInterval(function() {
        slideNextImageLeft();
      }, delay);
      if(currentImage < buttonPressed) {
        //current image = 1, button pressed = 4
        nextImage = buttonPressed;
        slideNextImageLeft();
      } else {
        previousImage = buttonPressed;
        //current image = 4, button pressed = 3
        slidePreviousImageRight();
      }
    }
  });
};

$(function() {
  slider();
});