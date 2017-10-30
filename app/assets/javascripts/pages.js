$(document).ready(function() {
  console.log('ready')
    $('.collection-check-box input[type=checkbox]').each(function(){
        if ($(this).is(':checked')) {
            $(this).closest( ".collection-check-box" ).addClass('selected');
        }
    });
    $('.collection-check-box input[type=checkbox]').change(function() {
        if ($(this).prop('checked')) {
          console.log($(this).closest( ".collection-check-box" ))
            $(this).closest( ".collection-check-box" ).toggleClass('selected');
            // alert("You have elected to show your checkout history."); //checked
        }
        else {
            $(this).closest( ".collection-check-box" ).toggleClass('selected');
            // alert("You have elected to turn off checkout history."); //not checked
        }
    });
});
