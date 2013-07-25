$(document).ready(function() {

  var clock;

  var refresh_stocks_table = function(){
      $.ajax({
        dataType: "script",
        type: "get",
        url: "/users/3/stocks" //need to create custom route in the future
      });
    };

    // $("#refresh_stocks").on('click', refresh_stocks_table);
    var start_timer = function() {
      clock = setInterval(refresh_stocks_table, 1000);
    };


  if ($('#stocks_table').length !== 0) {
    start_timer();
  }


});