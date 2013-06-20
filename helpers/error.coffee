exports.MESSAGE_500 = "Ugh, we messed up! Rest assured, we're looking into it."

exports.render500 = (res) ->
  res.render "error",
    title: '500 | Choir',
    code: 500,
    message: exports.MESSAGE_500

exports.render404 = (res, message) ->
  res.render 'error',
    title: '404 | Choir'
    code: 404,
    message: "Oops, #{message}!"
