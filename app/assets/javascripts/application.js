// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require turbolinks
//= require materialize-sprockets
//= require materialize/extras/nouislider
//= require flipclock.min
//= require fakeLoader.min
//= require ckeditor/init
//= require video
//= require_tree .

$(document).ready(function() {
  $('select').material_select();
  $('a.start, .collection.side-bar a, .card-action a').on('click', function(e) {
        $("#fake-loader").fakeLoader({
          timeToHide: 10000,
          spinner: "spinner1",
          bgColor: '#26c6da'
        });
    });
});
