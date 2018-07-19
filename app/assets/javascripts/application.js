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
//= require turbolinks
//= require_tree .
$(document).ready(function () {

    var nokori_count = $('.nokori_count').text();

    $('input').change(function () { 

        var participation_check = $(this).prop('checked');
        // .prop('checked')を使うと、チェックされていればtrue、されていなければfalseを返す

        if (participation_check == true) {

            $(this).parent()
            .clone(true)
            .prependTo('#participation_country');

            $(this).parent()
            .remove();

            nokori_count--;
            $('.nokori_count').text(nokori_count);

        } else {

            $(this).parent()
            .clone(true)
            .prependTo('#countries_scroll');

            $(this).parent()
            .remove();
            
            nokori_count++
            $('.nokori_count').text(nokori_count);
        }
    });

});