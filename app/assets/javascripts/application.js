//= require_tree .
//= require jquery
//= require jquery_ujs
//= require foundation

//$(function(){ $(document).foundation(); });
var ready = function() {
  $(document).foundation();
};
$(document).ready(ready);
$(document).on('page:load', ready);
