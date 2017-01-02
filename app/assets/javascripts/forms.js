$.widget('custom.standardForm', {
  _create: function() {
    this.element.on('ajax:success ajax:error', $.proxy(this._onAjaxDone, this));
  },

  _onAjaxDone: function(e, data, result, xhr) {
    // ... if it succeeded, but the server indicated an error ...
    this.clearErrors();

    if (!data.success) {
      // ... add the attribute errors to the form
      for(var attr in data.errors) {
        if (data.errors.hasOwnProperty(attr)) {
          this.setError(attr, data.errors[attr]);
        }
      }
    }
  },

  setError: function(attr, messages, formGroup) {
    this.removeErrors(attr);

    var message = '';
    if ($.isArray(messages)) {
      message = messages.join(', ');
    } else {
      message = messages;
    }

    if (attr === false || attr == 'base') {
      this.element.prepend($('<div></div>')
        .addClass('standard-form-error-message base-error-message')
        .html(message));
    } else {
      var form_group = formGroup || this.element.find('.form-group.' + attr);
      form_group.addClass('has-error');
      error_div = $('<div></div>').addClass('standard-form-error-message').html(message);
      // error_icon = $('<i class="standard-form-error-icon"></i>');
      error_div.appendTo(form_group);
      // form_group.find('.standard-form-control-wrapper').append(error_icon);
    }
  },

  removeErrors: function(attr) {
    if (attr === false) {
      this.element.find('.standard-form-error-message.base-error-message').remove();
    } else {
      var fg = this.element.find('.form-group.' + attr);
      fg.removeClass('has-error');
      fg.find('.standard-form-error-message').remove();
      fg.find('.standard-form-error-icon').remove();
    }
  },

  clearErrors: function() {
    this.element.find('.standard-form-error-message').remove();
    this.element.find('.form-group.has-error').removeClass('has-error');
  }
});

$(document).on('turbolinks:load', function() {
  $('.remote-form').standardForm();
});
