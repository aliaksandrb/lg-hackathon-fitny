$(document).ready( ->
  clock = $('.timer-clock')
  time = clock.data('time')

  stop_callback = ->
    setTimeout(->
      if flip_clock.getTime().time == 0
        clock.html('the end')
    , 1000)

  flip_clock = clock.FlipClock(time, {
    countdown: true,
    clockFace: 'MinuteCounter',
    callbacks: {
      stop: ->
        stop_callback()
    }
  })

  $('#play-btn').on('click', (e) ->
    e.preventDefault()
    flip_clock.start()
  )

  $('#stop-btn').on('click', (e) ->
    e.preventDefault()
    flip_clock.stop()
  )
)
