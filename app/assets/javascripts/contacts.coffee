hasHtml5Validation = ->
  typeof document.createElement('input').checkValidity == 'function'

resetForm = ($form) ->
  $form.trigger('reset')
  $form.find('.email-error-placeholder').html('')
  $form.siblings('.email-note').html('')

$ ->
  return unless $('.contact-form form')
  if hasHtml5Validation()
    $('.contact-us-form').submit (e) ->
      $contactForm = $(@)
      if !@checkValidity()
        e.preventDefault()
        $contactForm.addClass 'invalid'
        return false
      else
        $contactForm.removeClass 'invalid'
        return true

  $('.contact-form form').on 'ajax:error', (event, data) ->
    $(@).find('.email-error-placeholder').html('')
    errors = data.responseJSON.errors
    for error of errors
      $('.' + error + '_errors').html(errors[error])
    $element = $(@).parent().find('p.email-note')
    $element.show().html($element[0].dataset.error)

  $(document).on 'ajax:success', '.contact-form', (event, response) ->
    resetForm $('.contact-form form')
    $element = $(@).parent().find('p.email-note')
    $element.show().html($element[0].dataset.success)


    return

