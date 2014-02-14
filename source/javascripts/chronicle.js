$(function() {
  var nav_bar          = $('#nav_floater')[0];
  var nav_location     = nav_bar.getBoundingClientRect();
  var nav_height       = nav_location.height;
  var nav_top          =
      nav_top_original = nav_location.bottom - nav_height;

  console.log('My <body> is ready.');
  $(window).scroll(function() {
    nav_location = nav_bar.getBoundingClientRect();
    nav_top = nav_location.bottom - nav_location.height;
    if (nav_top < 0) {
      if (!$(nav_bar).hasClass('follow')) {
        $(nav_bar).addClass('follow');
      }
    } else if(  $(nav_bar).hasClass('follow')
             && $(window).scrollTop() < nav_top_original
    ) {
      $(nav_bar).removeClass('follow');
    }
  });
});
