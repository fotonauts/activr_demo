# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->
  $("#activities").infinitescroll
    navSelector: "ul.pagination" # selector for the paged navigation (it will be hidden)
    nextSelector: "ul.pagination a[rel=next]" # selector for the NEXT link (to page 2)
    itemSelector: "#activities div.activity" # selector for all items you'll retrieve
