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
//= require turbolinks
//= require_tree .
//= require bootstrap
//= require jquery.infinitescroll

// Enable infinite scroll on activities and timeline entries lists
(function() {
  $(document).ready(function() {
    return $("#activities").infinitescroll({
      navSelector: "ul.pagination",
      nextSelector: "ul.pagination a[rel=next]",
      itemSelector: "#activities div.activity",
      loading: {
        msgText: "<em>Loading more activities...</em>",
        finishedMsg: "<em>No more activities.</em>"
      }
    });
  });

  $(document).ready(function() {
    return $("#news_feed").infinitescroll({
      navSelector: "ul.pagination",
      nextSelector: "ul.pagination a[rel=next]",
      itemSelector: "#news_feed div.activity",
      loading: {
        msgText: "<em>Loading more news...</em>",
        finishedMsg: "<em>No more news.</em>"
      }
    });
  });
}).call(this);
