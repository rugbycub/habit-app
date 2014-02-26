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

  $('#post').on('click', function(event){
    event.preventDefault();
    var params = {};
    params.post = {body: $('.form-control').val() };
    params.name = $('.form-control').data().name;
    // $.ajax({type: 'post', url: "/posts", data: params }).done(function(response){}); the ajax call
    $('.posts').append('<h4>' + params.post.body + '</h4>'); // this will be a handle bar template;

    $('.form-control').val("") 
  
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
  var freq, liWidth;
  var i = 1;
  $.each(freqs, function(index, item){
    freq = +($(item).text());
    liWidth = 100.0/freq;
    $('#progress-ul-'+i).children().css('width', liWidth + '%');
    i++;
  });
});

