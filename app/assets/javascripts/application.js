//= require jquery
//= require jquery_ujs
//= require_tree .

$(document).ready(function () {
  $('.download').on('click', function(){
    var id = $(this).data('id')
    $.ajax({
      method: "POST",
      url: "/books/"+id+"/download",
      data: { id: id }
    })
  })
})