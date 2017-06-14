// This is a manifest file that'll be compiled into application, which will include all the files
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
//= require ./bootstrap/jquery-3.2.1.min
//= require ./bootstrap/js/bootstrap.min
//= require ./bootstrap/bootstrap-select/bootstrap-select.min
//= require ./bootstrap/bootstrap-select/i18n/defaults-es_ES.min
//= require moment 
//= require fullcalendar
//= require locale-all

$(document).ready(function() {
  var selected = new Array();
  var index = 0;
  var initialLocaleCode = 'es';
  var today = moment().format('YYYY-MM-DD');

  $("#nueva_cita").prop('disabled', true).click(function(event) {

    var decimalTimeString = selected.length * 0.5;
    var n = new Date(0,0);
    n.setSeconds(+decimalTimeString * 60 * 60);
    
    $("#tiempo").html(n.toTimeString().slice(0, 8));
    $('#NuevaCita').modal({
      backdrop: 'static',
      keyboard: false
    });
  });;
  $('.selectpicker').selectpicker({
    size: 'auto'
  });

  $('#calendar').fullCalendar({
    header: {
      left: 'prev,next today',
      center: 'title',
      right: 'month,agendaWeek,agendaDay,listMonth'
    },
    defaultTimedEventDuration: '00:30:00',
    defaultDate: today,
    locale: initialLocaleCode,
    defaultView: 'agendaDay',
    buttonIcons: false,
    weekNumbers: true,
    navLinks: true,
    editable: true,
    eventLimit: true,
    eventSources: [
      {
        events: [
          {
            title: 'All Day Event',
            start: '2017-05-01'
          },
          {
            title: 'Long Event',
            start: '2017-05-07',
            end: '2017-05-10'
          },
          {
            id: 999,
            title: 'Repeating Event',
            start: '2017-05-09T16:00:00'
          },
          {
            id: 999,
            title: 'Repeating Event',
            start: '2017-05-16T16:00:00'
          },
          {
            title: 'Conference',
            start: '2017-05-11',
            end: '2017-05-13'
          },
          {
            title: 'Meeting',
            start: '2017-05-12T10:30:00',
            end: '2017-05-12T12:30:00'
          },
          {
            title: 'Lunch',
            start: '2017-05-12T12:00:00'
          },
          {
            title: 'Meeting',
            start: '2017-05-12T14:30:00'
          },
          {
            title: 'Happy Hour',
            start: '2017-05-12T17:30:00'
          },
          {
            title: 'Dinner',
            start: '2017-05-12T20:00:00'
          },
          {
            title: 'Birthday Party',
            start: '2017-05-13T07:00:00'
          },
          {
            title: 'Click for Google',
            url: 'http://google.com/',
            start: '2017-05-28'
          }
        ],
        color: 'black',
        textColor: 'yellow'
      }
    ],
    dayClick: function(date, jsEvent, view, resourceObj) {
      // console.log(date.format("HH:mm:00"));
      $("[data-time='"+date.format("HH:mm:00")+"']").toggleClass('selected');
      index = selected.indexOf(date.format("HH:mm:00"));
      index >= 0 ? selected.splice(index, 1) : selected.push(date.format("YYYY-MM-DD HH:mm:00"));
      selected.length > 0 ? $("#nueva_cita").prop('disabled', false) : $("#nueva_cita").prop('disabled', true);
      selected.sort().reverse();
      console.log(selected);
      $('#time').html(function(){
        var html = '';
          
        for (var i = selected.length - 1; i >= 0; i--) {
          html += `
            <label class="btn btn-primary active">
              <input name="appointment[timespan][]" type="checkbox" autocomplete="off" value="${selected[i]}" checked> ${selected[i]}
            </label>
          `;
        }
        html += "";
          
        return html;
      });

    }
  });
});