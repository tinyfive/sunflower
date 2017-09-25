$(document).on 'click', '.form-apply .btn-submit, .form-apply .btn-draft', (e) ->
  $btn = $ e.target
  $form = $btn.closest 'form'

  $field = $form.find ':input[name$="[status]"]'
  $field.val $btn.data('status')

  $form.submit()
