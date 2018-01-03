// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require rails-ujs
//= require trix
//= require turbolinks
//= require_tree .


function searchUsers() {
  var input, filter, table, tr, td, i;
  input = document.getElementById("userSearch");
  filter = input.value.toUpperCase();
  table = document.getElementById("userTable");
  tr = table.getElementsByTagName("tr");
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[0];
    if (td) {
      if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
    }
  }
}

$( document ).ready(function() {
  $(document).on ("click", ".dropdown-trigger", function () {
    $(".dropdown").toggleClass('is-active');
  });
  $(document).on ("click", "#nav-toggle", function () {
    $(".navbar-menu").toggleClass('is-active');
    $(".dropdown").removeClass("is-active");
  });
  $(document).on ("click", "#admin-toggle", function () {
    $(".admin-menu").toggleClass('is-active');
    console.log("admin")
  });



});
