$(document).ready(function(){
    $('.tab_wrap .tab-link').click(function(){
        var tab_id = $(this).attr('data-tab');

        $(this).removeClass('current');
        $('.tab-content').removeClass('current');
        $(this).addClass('current');
        $("#"+tab_id).addClass('current');
    });
    

    $('.tab_wrap').slick({
      infinite: true,
      slidesToShow: 6,
      slidesToScroll: 6,
    });
});