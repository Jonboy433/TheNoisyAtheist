// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require bootstrap-sprockets
//= require turbolinks
//= require_tree .


$(document).ready(function(){
    
    $("#submitLogin").click(function(event){

        $("#loginMsg").remove();
        event.preventDefault();
        var inputs = $("#loginForm").serialize();

            $.ajax({
                url: '/users/sign_in',
                type: 'POST',
                data: inputs,
                dataType: 'json',
                statusCode: {
                    200: function(data){
                        $(".loginMsg").remove();
                        //Reload page after login
                        location.reload();
                        
                    },
                    201: function(data){
                        $(".loginMsg").remove();
                        //Reload page after login
                        location.reload();
                        
                    },
                    401: function(data){
                        //Add error message to login form for invalid credentials
                        var errorMsg = '<div class="alert alert-danger" id="loginMsg" role="alert">' + data.responseJSON.errors[0] + '</div>';
                        $(".dropdown-menu").prepend(errorMsg);
                    },
                    422: function(data){
                        console.log(data.responseText);
                    }
                }
            });
     });
});