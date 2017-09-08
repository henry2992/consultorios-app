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
    var id = $(this).attr('data-id');
    console.log(id);

    var request = $.ajax({
      url: "/docs/image/" + id,
      method: "POST",
      data: { id : id },
      dataType: "json"
    });
     
    request.done(function( data ) {
      console.log(data);
      $('#img').attr("src",data['url_image']);
      $('#descripcion_img').text(data['description']);
      $('#btnDelete').attr('data-id',id);
      $('#btnDelete').attr('data-eq',id);
      $('#formUpdateImgage').attr('action',"/docs/update_image/"+id);
      });
     
    request.fail(function( jqXHR, textStatus ) {
      console.log('cosa: ' + jqXHR + ' status: ' + textStatus);
    });
  });

  $('#btnDelete').click(function (obj) {
    var id = $(this).attr('data-id');

    var request = $.ajax({
      url: "/docs/image/" + id,
      method: "DELETE",
      data: { id : id },
      dataType: "json"
    });
     
    request.done(function( data ) {
      console.log(data);
      $("#elemt-carrusel-" + id).remove();
      $('#descImg').modal('hide');
    });
     
    request.fail(function( jqXHR, textStatus ) {
      console.log('cosa: ' + jqXHR + ' status: ' + textStatus);
    });
  });

  $('#descImg #btnUpd').click(function(){
    $('#descImg').modal('hide');
    $('#descripcion').val($('#descripcion_img').text());
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
          if ($('#update_' + index).attr('type') == 'checkbox' ) {
            if (value != null && value != '') {
              $('#update_' + index).prop('checked', true);
            }else {
              $('#update_' + index).prop('checked', false);
            }
          }else{
            $('#update_' + index).val(value);
          }
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