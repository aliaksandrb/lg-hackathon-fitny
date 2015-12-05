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
        })
        next_step()
      else
        console.log(flip_clock.getTime().time)
    , 1000)

  next_step = ->
    step_id = $('.step').data('step-id')
    guide_id = $('.step').data('guide-id')

    if step_id
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
    fader = $('#fade-wrapper')
    fader.find('h1').html('Started')
    fader.fadeIn()
    setTimeout(->
      fader.fadeOut(->
        fader.find('h1').html('Paused')
      )
      video = $('video')[0]
      video.play() if video
      flip_clock.start()
    , 1000)
  )

  $('#stop-btn').on('click', (e) ->
    e.preventDefault()
    video = $('video')[0]
    video.pause() if video
    flip_clock.stop()

    fader = $('#fade-wrapper')
    fader.fadeIn()
    setTimeout(->
      fader.fadeOut()
    , 1000)
  )

  $('#cancel-btn').on('click', (e) ->
    $("#fake-loader").fakeLoader({
      timeToHide: 10000,
      spinner: "spinner1",
      bgColor: '#26c6da'
    })
  )

)
