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
    td_1 = tr[i].getElementsByTagName("td")[1]
    if (td || td_1) {
      if (td.innerHTML.toUpperCase().indexOf(filter) > -1 || td_1.innerHTML.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
    }
  }
}

function printWindow() {
  // console.log("he")
  // $("pre").prepend('<img class="lightbulb" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAYAAABXAvmHAAAABmJLR0QA/wD/AP+gvaeTAAACnElEQVRoge2Yz2vUQBTHP6naipeyrRVb8AcFPS3WWytYwT15EC+9df8AsQeliEdF9KL4J4ilQqWn3nrSQlWkFg+LBU9WRXuqFaFFEC3r6mEn9E1Is5PkbQKSD4SdZN/7vu8kM5MhUFBQUJAnnrJeGbgInAdOAofM9Q3gPbAIzAPvlOumpgIsAH8djwWancydbmAKaOBu3j8aJrc7c9eGg0AtYOo3MAuMA4PAAXMMmmuzJkbm1IxWpnRhm28A00C/Q26/iZVPrWY0M+Mu9l2vJtCoYj+NO2ruWnAY2BaFr0TE9gLD5jeMCaGzbbTbzg1R9BXRS/ETdobYMnAh8L9nNHy969pmw3gpCo63iO0FLgG3gVWaHbkciKkKvReaRndjTRQ8FiNvPzAH/MReOo8LvS86FqOREy/uyjFs8sriWhf2gtB2NkRBl2UzyInA+YDQ+xpXrCOBgY+ifS5B/mrgfFS0P8QVS9KBp6J9lXQbQg+4Js6fpdBy5ij2PJhMoTUpdH4BR1K7c+SBKFwHxhJojJlcX+e+mjsH9gFL2HdvJEb+iMnx85eMZqb00Zx0vok1dt8ySErAJ5H3mYy2EGGUgS1h5qFDziMRv4X9TsgFuSGrA6ciYoeAPyJ+ou3uHOjAng9RT2FKxL0B9rTdnSMV7GHRGRLTCfwQcZXM3Dng0ZyMvrmhkJjT2BNX5YvIXg0RmkNhnZ3d6WPgWyCmT7TXTU5dqX5qbhH/q8RNjcJJ9kJhxHmJ+ZzRKKzVgecJchY1Cmt1IDe0OnA2Qc5o65DWaHUgyXBQGUJaeMAK7ivQCvpfxlOziXsHNrWKak7i5RixrxXrqtED3CN6KL01MT05eXSihL0vkvufUm6uYjIAzADfzTFjrhUUFBT8Z/wDtUPzRePu9NgAAAAASUVORK5CYII="/>')
  window.print();
  // $(".lightbulb").remove();
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
