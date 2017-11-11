$(document).ready(function () {
  $('.js-add-favourite').on('click', function(){
    $('.js-add-favourite').closest("li").toggleClass('hide');
  });
});
