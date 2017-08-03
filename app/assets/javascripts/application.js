// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require_tree .
//= requiere bootstrap
//= require tether
//= require bootstrap-sprockets

$(document).ready(function() {
  $("#search_form input").on('keyup', function(event) {
    event.preventDefault();
    $.get($("#search_form").attr("action"), $("#search_form").serialize(), function(json){
      $("#data").html(json.data);
    }, "json");
  });
  $("#search_form").on('submit', function(event) {
    event.preventDefault();
    // console.log('entra;')
    $.get($(this).attr("action"), $(this).serialize(), function(json){
      $("#data").html(json.data);
    }, "json");
  });
});