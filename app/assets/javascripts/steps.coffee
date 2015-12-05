$(document).ready( ->
  clock = $('.timer-clock')
  time = clock.data('time')

  stop_callback = ->
    setTimeout(->
      clock.html('the end')
    , 1000)

  clock.FlipClock(time, {
    countdown: true,
    clockFace: 'MinuteCounter',
    callbacks: {
      stop: ->
        stop_callback()
    }
  })
)
