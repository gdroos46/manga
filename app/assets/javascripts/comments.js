$(function(){
  function buildHTML(comment){
    var html = `<p>
                  <strong>
                    <a href=/users/${comment.user_id}>${comment.user_name}</a>
                    ：
                  </strong>
                  ${comment.text}
                </p>`
    return html;
  }
  $('#submit').on('click', function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var href = window.location.href + '/comments'
    $.ajax({
      url: href,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      var html = buildHTML(data);
      $('.comments').append(html)
      $('.textbox').val('')
    })
    .fail(function(){
      alert('error');
    })
  })
});

// $(document).ready(function() {
//   // var title = $("#title").text()
//   // console.log(title)

//   // var text = $('#task_title').val()

//   // console.log(text)

//   $("#submit").on('click', function(e) {
//     e.preventDefault();
//     // e.target =
//     var text = $('#comment_text').val()
//     console.log(text)
//   $(function(){

//     var href = window.location.href + '/comments'
//     $.ajax({
//       url: href,
//       type: 'POST',
//       dataType: 'json',
//       success: function(data) {

//         console.log("成功");
//         alert(data);
//       },
//       error:function() {

//         console.log("失敗");
//       }
//     });

//   })

//     // $('task-list').append(
//     //   "<td>" + text + "</td>"
//     // )


//     $('#task_title').val('')
//   })
// })


