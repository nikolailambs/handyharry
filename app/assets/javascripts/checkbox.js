$('input.task-check').change(function change (){
  var task_id = $(this).data('task-id')
  console.log('form_' + task_id)
  $('#form_' + task_id).submit()
})



