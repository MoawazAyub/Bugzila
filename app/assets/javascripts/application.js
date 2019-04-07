// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .
//= require bootstrap-sprockets
//= require jquery
//= require jquery3
//= require popper
//= require bootstrap
//= require bootstrap-datepicker



$(document).on("turbolinks:load", function(){
	set_stuff = function(){
		first = $( "#bug_bug_type option:selected" ).text()
		$("#bug_status").find('option').each(function(){
			if(first == 'bug') {
				if($(this).val() == 'completed') {
					$(this).val("resolved")
					$(this).html("<option>resolved</option>")
				}
			}
			else if(first == 'feature') {
				if($(this).val() == 'resolved') {
					$(this).val("completed")
					$(this).html("<option>completed</option>")
				}
			}
		});
	}
	set_stuff();
	$('#bug_bug_type').on("change", function(){
		set_stuff();
	}); 
});