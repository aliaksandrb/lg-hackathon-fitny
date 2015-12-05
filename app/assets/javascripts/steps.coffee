$(document).ready( ->
  clock = $('.timer-clock')
  time = clock.data('time')

  stop_callback = ->
    setTimeout(->
      if flip_clock.getTime().time == 0
        $("#fake-loader").fakeLoader({
          timeToHide: 10000,
          spinner: "spinner1",
          bgColor: '#26c6da'
        });
        next_step()
      else
        console.log(flip_clock.getTime().time)
    , 1000)

  next_step = ->
    step_id = $('.step').data('step-id')
    guide_id = $('.step').data('guide-id')

    $.ajax({
      url: '/steps/' + step_id + '/next_step',
      dataType: 'JSON',
      type: 'POST'
    }).done((data, status, xhr) ->
      if data.step_id != 0
        window.location.replace(data.url + '/play')
      else
        window.location.replace('/guides/' + guide_id)

    ).fail((xhr, textStatus, error) ->
    )

  flip_clock = clock.FlipClock(time, {
    autoStart: false,
    countdown: true,
    clockFace: 'MinuteCounter',
    callbacks: {
      stop: ->
        stop_callback()
    }
  })

  $('#play-btn').on('click', (e) ->
    e.preventDefault()
    $('video')[0].play()
    flip_clock.start()
  )

  $('#stop-btn').on('click', (e) ->
    e.preventDefault()
    $('video')[0].pause()
    flip_clock.stop()
  )
)
