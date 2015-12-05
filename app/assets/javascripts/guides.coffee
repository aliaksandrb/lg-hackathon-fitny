$(document).ready( ->
  $('#start-guide-btn, #cancel-guide-btn').on('click', (e) ->
    $("#fake-loader").fakeLoader({
      timeToHide: 10000,
      spinner: "spinner1",
      bgColor: '#26c6da'
    })
  )
)
