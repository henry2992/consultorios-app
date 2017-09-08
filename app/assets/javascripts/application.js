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
//= require bootstrap-datepicker/core
//= require bootstrap-datepicker/locales/bootstrap-datepicker.es.js

$(document).ready(function() {
  // $("#search_form input").on('keyup', function(event) {
  //   event.preventDefault();
  //   $.get($("#search_form").attr("action"), $("#search_form").serialize(), function(json){
  //     $("#data").html(json.data);
  //   }, "json");
  // });
  $("#search_form").on('submit', function(event) {
    event.preventDefault();
    // console.log('entra;')
    $.get($(this).attr("action"), $(this).serialize(), function(json){
      $("#data").html(json.data);
    }, "json");
  });


  $('#recipeCarousel').carousel({
    interval: 10000
  })

  $('.carousel .carousel-item').each(function(){
      var next = $(this).next();
      if (!next.length) {
      next = $(this).siblings(':first');
      }
      next.children(':first-child').clone().appendTo($(this));
      
      if (next.next().length>0) {
      next.next().children(':first-child').clone().appendTo($(this));
      }
      else {
        $(this).siblings(':first').children(':first-child').clone().appendTo($(this));
      }
  });


  $('#addImg').modal({
    show:false
  });
  $('#addEntrada').modal({
    show:false
  });
  $('#descImg').modal({
    show:false
  });
  $('#updImg').modal({
    show:false
  });
  $('#showEntrada').modal({
    show:false
  });
  $('#updateEntrada').modal({
    show:false
  });
  

  $('#btnSaveUpd').click(function(){
    
    alert(msg);
  });

  $('.imgCarousel').click(function(){
    $('#img').attr("src",$(this).find("img").eq(0).attr("src"));
    $('#descripcion').text($(this).attr("data-description"));
    $('#btnDelete').attr('data-id',$(this).attr('data-id'));
    $('#btnDelete').attr('data-eq',$(this).attr('data-eq'));
  });

  $('#descImg #btnDelete').click(function(){
    window.location.reload();
    alert("Se supone q despues de eliminar la imagen se debe recargar la pagina...");
  });
  $('#descImg #btnUpd').click(function(){
    $('#descImg').modal('hide');
    $('#addDesc').val($('#descripcion').text());
    $('#img2').attr("src",$('#img').attr("src"));
    $('#updImg').modal('show');
    
  });

  $('.btn-show-entry').click(function (obj) {
    var id = $(this).attr('id').replace('entry','');

    var request = $.ajax({
      url: "/docs/show_history_entry/" + id,
      method: "POST",
      data: { id : id },
      dataType: "json"
    });
     
    request.done(function( data ) {
      console.log(data);
      $.each(data['history_entry'], function (index, value) {
          if ( $('#show_' + index).length > 0 ) {
            $('#show_' + index).html(value);
          }
      });

      $('#show_attachament').attr('src',data['attachment']);
    });
     
    request.fail(function( jqXHR, textStatus ) {
      console.log('cosa: ' + jqXHR + ' status: ' + textStatus);
    });
  });

  $('.updSec').click(function (obj) {
    var id = $(this).attr('id').replace('entry-update-','');
    
    $('#update_history_entry').val(id);

    var request = $.ajax({
      url: "/docs/show_history_entry/" + id,
      method: "POST",
      data: { id : id },
      dataType: "json"
    });
     
    request.done(function( data ) {
      console.log(data);
      $.each(data['history_entry'], function (index, value) {
        if ( $('#update_' + index).length > 0 ) {
          if ($('#update_' + index).attr('type') == 'checkbox' && value != null ) {
            $('#update_' + index).attr('checked', 'true');
          }
          $('#update_' + index).val(value);
        }
      });
    });
     
    request.fail(function( jqXHR, textStatus ) {
      console.log('cosa: ' + jqXHR + ' status: ' + textStatus);
    });
  });

   $('.delSec').click(function (obj) {
    var id = $(this).attr('id').replace('entry-delete-','');

    var request = $.ajax({
      url: "/docs/history_entry/" + id,
      method: "DELETE",
      data: { id : id },
      dataType: "json"
    });
     
    request.done(function( data ) {
      console.log(data);
      $('#elem'+id).remove();
    });
     
    request.fail(function( jqXHR, textStatus ) {
      console.log('cosa: ' + jqXHR + ' status: ' + textStatus);
    });
  });

});