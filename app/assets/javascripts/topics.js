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

//     $.ajax({
//       type: 'POST',
//       url: '/comments.json',
//       data: {							
//         comment: {	
//           text: text,
//         }
//       }
//     }).done(function(data){
//       console.log(data.text)
//       $('#comment-list').append(
//         `<tr>
//           <td>
//             ${comment.title}
//           </td>
//         </tr>`
//       )
//     })

//     // $('task-list').append(
//     //   "<td>" + text + "</td>"
//     // )


//     $('#task_title').val('')
//   })
// })
