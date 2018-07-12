$(document).ready(function() {
  // var title = $("#title").text()
  // console.log(title)

  // var text = $('#task_title').val()

  // console.log(text)

  $("#submit").on('click', function(e) {
    e.preventDefault();
    // e.target =
    var text = $('#task_title').val()
    // console.log(text)

    $.ajax({
      type: 'POST',
      url: '/topics/#{topic.id}/comments.json',
      data: {
        comment: {
          text: text,
        }
      }
    }).done(function(data){
      console.log(data.text)
      $('#task-list').append(
        `<tr>
          <td>
            ${comment.title}
          </td>
        </tr>`
      )
    })

    // $('task-list').append(
    //   "<td>" + text + "</td>"
    // )


    $('#task_title').val('')
  })
})
