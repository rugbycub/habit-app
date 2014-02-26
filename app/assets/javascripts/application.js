// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery.ui.sortable
//= require turbolinks
//= require handlebars
//= require_tree .


$(function(){

  function include_completions(date, completions){
    for ( var i = 0; i < completions.length; i++ ){
      var d = Date.parse(completions[i].date);
      d = new Date(d);
      if ( d.getDate() === date.getDate() ){
        return true;
      }
    }
    return false;
  }

  $('.date').on('click', function(event){
    var d = Date.parse($('.date').data().date);
    d = new Date(d);
    var params = {};
    params.date = d.toISOString();
    params.name = $('.form-control').data().name;

    $.ajax({type: "post", url: "/previous_week", data: params}).done(function(response){ 
      var d = Date.parse(response.date);
      d = new Date(d);
      d.setDate(d.getDate()-1)
      var week_day = ["Sun", "M", "Tu", "W", "Th", "F", "Sat"];
      var list = "";
      for (var i = 0; i < 7; i++){
        d.setDate(d.getDate()+1);
        list += "<li data-day='" + d.toISOString() + "' class='";

        if (include_completions(d, response.completions)){
          list += "completed ";
        }
        if ( d.getDate() === new Date().getDate() ){
          list += "active ";
        }

        list +="' ><a href='#'>" + week_day[i] + "</a></li>";
      }

      var d = Date.parse(response.date);
      d = new Date(d);

      var header = "<h4 class='center-text date' data-date='"+ d.toISOString() ;
      d.setDate(d.getDate()+1);
      header += "' >Week of " + (d.getUTCMonth()+1) +"/"+ d.getDate() +"/"+ d.getUTCFullYear();

      $('h4.date').remove()
      $('div.date-div').append(header)

      $('ul.nav-pills').empty();
      $('ul.nav-pills').append(list);

    });
  });

  $('#post').on('click', function(event){
    event.preventDefault();
    var params = {};
    params.post = {body: $('.form-control').val() };
    params.name = $('.form-control').data().name;
    // $.ajax({type: 'post', url: "/posts", data: params }).done(function(response){}); the ajax call
    $('.posts').append('<h4>' + params.post.body + '</h4>'); // this will be a handle bar template;

    $('.form-control').val(""); 
  
  });

  $('.nav').on('click', 'li' ,function(event){
    event.preventDefault();

    var d = Date.parse(this.dataset.day);
    var day = new Date(d);
     if (day < new Date()){
      var parent = $(this).closest('ul');
      var params = {name: parent.data().name, date: $(this).data().day};
      if ( $(this).hasClass('completed') ){
        $(this).removeClass('completed');
        $.ajax({type: 'delete', url: "/completions", data: params}).done(function(r){ alert("Deleted the completion"); }).fail(function(r){ alert("You Failed"); });
      } else {
        $(this).addClass('completed');
        $.ajax({type: 'post', url: "/completions", data: params}).done(function(r){ alert("Congratualtions"); }).fail(function(r){ alert("You Failed"); });
      }  
    }

  });

});

$(function() {  
  $( "#sortable" ).sortable({   
    placeholder: "ui-sortable-placeholder",
    start: function(e, ui){
        ui.placeholder.height(ui.item.height());
    }   
  });  
});  

$(function(){
  var freqs = $('.frequency');
  var total, freq, liWidth;
  var i = 1;
  $.each(freqs, function(index, item){
    total = $('#progress-ul-'+i).width();
    freq = +($(item).text());
    liWidth = parseFloat(total)/freq;
    $('#progress-ul-'+i).children().css('width', liWidth + 'px');
    i++;
  });
});

