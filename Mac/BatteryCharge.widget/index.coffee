# Attributions:
# The svg path for the bolt icon provided by Open Iconic
# The source code is available at https://github.com/iconic/open-iconic

command: "pmset -g batt | grep \"%\" | awk 'BEGINN { FS = \";\" };{ print $2,$3,$4 }' | sed -e 's/-I/I/' -e 's/-0//' -e 's/;//' -e 's/;//'"

refreshFrequency: 10000

render: -> """
  <svg version="3.1" id="battery"
    xmlns="http://www.w3.org/2000/svg"
    xmlns:xlink="http://www.w3.org/1999/xlink"
    viewBox="0 0 120 28" >
    <defs>
      <clipPath id="cut-off-left">
        <rect x="107" y="0" width="10" height="100" />
      </clipPath>
    </defs>
    <rect id="hull" x="1" y="9" rx="7" ry="7" width="104" height="14" />
    <rect id="charge" x="3" y="11" rx="5" ry="5" height="10" />
    <text id="text" x="8" y="19" style="font-size:9">##%</text>
    <path id="bolt" d="M3 0l-3 5h2v3l3-5h-2v-3z" transform="translate(50,10), scale(1.5)" />
  </svg>
"""

update: (output, domEl) ->
  values = output.split(' ')
  text = $('#text')
  charge = values.filter((v) ->
    return v.indexOf('%') == v.length - 1)
    .map(parseInt)[0]

  charging = values.filter((v) ->
    return v.indexOf('charg') == 0).length

  if charge <= 25
    fill = '250,'+ 8 * charge + ',0'
  else
    fill = '236,183,19'
  fill = 'rgba('+fill+',1)'

  $('#charge').attr('width',charge)
  $('#charge').css('fill',fill)
  $('#bolt').css('display', charging && 'block' || 'none')


  text.text(charge + '%')



style: """
    main = rgba(#fff,1)
    color: main
    scale = 1
    opacity = .7

    bottom: 67px
    left: 720px
    font-family: Helvetica Neue
    font-size: .3em * scale

    svg
      width: 375px * scale
      height: auto
      margin: 0
      opacity: opacity

    #hull
      fill: none
      stroke: main
      stroke-width: 1

    #tip
      fill: main

    #charge
      stroke-width: 2

    #text
      font-weight: bold
      fill: main

    #bolt
      position: absolute
      fill: main
      height: 25px
"""
