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
//= require jquery.ui.core
//= require jquery.ui.widget 
//= require jquery.ui.menu 
//= require jquery.ui.position 
//= require jquery.ui.autocomplete
//= require jquery.ui.button
//= require jquery_ujs
//= require dataTables/jquery.dataTables
//= require_tree .



/*(function($) {
  $.widget("ui.combobox", {
    _create: function() {
      var self = this;
      var select = this.element;
      select.hide();
      
      // process select options into an array
      var opts = new Array();
      $('option',select).each(function(index) {
        var opt = new Object();
        opt.value = $(this).val();
        opt.label = $(this).text();
        opts[opts.length] = opt;
      });
      
      // set up input text element
      var input = $("<input>");
      input.insertAfter(select);
      input.autocomplete({
          source: opts,
          delay: 0,
          change: function(event, ui) {
            if (!ui.item) {
              // user didn't select an option, but what they typed may still match
              var enteredString = $(this).val();
              var stringMatch = false;
              for (var i=0; i < opts.length; i++){
                if(opts[i].label.toLowerCase() == enteredString.toLowerCase()){
                  select.val(opts[i].value);// update (hidden) select
                  $(this).val(opts[i].label);// corrects any incorrect case
                  stringMatch = true;
                  break;
                }
              }
              if(!stringMatch){
                // remove invalid value, as it didn't match anything
                $(this).val($(':selected',select).text());
              }
              return false;
            }
          },
          select: function(event, ui) {
            select.val(ui.item.value);// update (hidden) select
            $(this).val(ui.item.label);
            return false;
          },
          focus: function(event, ui) {
            if (event.which === 38 || event.which === 40){
              $(this).val(ui.item.label);
              return false;
            }
          },
          // stop parent form from being while menu is open
          open: function(event, ui) {
            input.attr("menustatus","open");
          },
          close: function(event, ui) {
            input.attr("menustatus","closed");
          },
          minLength: 0
        });
      input.addClass("ui-widget ui-widget-content ui-corner-left");
      // initialise text with what's currently selected
      input.val($(':selected',select).text());
      //clear text when user clicks in text input
      input.click(function(){
        $(this).val("");
      });
      
      // over-ride form submit, so it cant submit if the menu is open
      input.attr("menustatus","closed");
      var form = $(input).parents('form:first');
      $(form).submit(function(e){
        return (input.attr('menustatus') == 'closed');
      });
        
      // set up button for fake 'select'
      var btn = $("<button>&nbsp;</button>");
      btn.attr("tabIndex", -1);
      btn.attr("title", "Show All Items");
      btn.insertAfter(input);
      btn.button({
        icons: {
          primary: "ui-icon-triangle-1-s"
        },
        text: false
      });
      btn.removeClass("ui-corner-all");
      btn.addClass("ui-corner-right ui-button-icon");
      btn.click(function() {
        //event.preventDefault();
        // close if already visible
        if (input.autocomplete("widget").is(":visible")) {
          input.autocomplete("close");
          return false; // return false, so form isn't automatically submitted
        }
        // pass empty string as value to search for, displaying all results
        input.autocomplete("search", "");
        input.focus();
        return false; // return false, so form isn't automatically submitted
      });
      
      // add some styles
      btn.css("margin-left","-1px");
      input.css("margin",0);
      btn.css("padding",0);
      input.css("padding","0 0.4em 0 0.4em");
      $('span.ui-button-text', btn).css("padding",0);
      input.css("width",select.outerWidth() - btn.outerWidth(true) - 10);// match the width
    }
  });

})(jQuery);
  
// new code
$(function() {
  $(".combobox").combobox();
});



$.widget("ui.combobox", {
    _create: function() {
        var _self = this
            , options = $.extend({}, this.options, {
            minLength: 0,
            source: function(request, response) {
                if (!request.term.length) {
                    response(_self.options.initialValues);
                } else {
                    if (typeof _self.options.source === "function") {
                        _self.options.source(request, response);
                    } else if (typeof _self.options.source === "string") {
                        $.ajax({
                            url: _self.options.source,
                            data: request,
                            dataType: "json",
                            success: function(data, status) {
                                response(data);
                            },
                            error: function() {
                                response([]);
                            }
                        });
                    }
                }
            }
        });
        
        this.element.autocomplete(options);

        this.button = $("<button type='button'>&nbsp;</button>")
            .attr("tabIndex", -1)
            .attr("title", "Show All Items")
            .insertAfter(this.element)
            .button({
                icons: {
                    primary: "ui-icon-triangle-1-s"
                },
            text: false
            })
            .removeClass("ui-corner-all")
            .addClass("ui-corner-right ui-button-icon")
            .click(function() {
                if (_self.element.autocomplete("widget").is(":visible")) {
                    _self.element.autocomplete("close");
                    return;
                }
                _self.element.autocomplete("search", "");
                _self.element.focus();
        });
    }
});

$(document).ready(function() {
    $("[id*='_stimul_name']").combobox({
        initialValues: ['Введите поле'],
        source: $("[id*='_stimul_name']").data('autocompete-source')
    });
});
*/