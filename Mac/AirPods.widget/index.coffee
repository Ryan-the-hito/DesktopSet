command: 'python3 AirPods.widget/bt.py'

refreshFrequency: '2s'

update: (output, domEl) ->
    $(domEl).empty().append("#{output}")

style: """
margin: 0px
left: 370px
bottom: 85px
background-color rgba(white, 0.4)
border:1px solid rgba(#000, .25)
border-radius:20px
color: white
padding: 5.5px
font-size: 10pt
font-family: Helvetica Neue
width: 318px
lineheight: 1.6
text-indent: 9px
white-space: nowrap

.s-box
    display: flex
    align-items:center

.s-txt
    margin-left: 9px
    font-size: 8pt
    padding: 6px

img
    height: 32px
    width: 32px
    margin-top: 0px
    float: left

.s-img
    height: 20px
    width: 20px
    padding: 6px

"""
