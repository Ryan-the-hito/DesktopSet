width        = '367px'
barHeight    = '36px'
labelColor   = '#fff'
usedColor    = '#d7051d'
freeColor    = '#525252'
bgColor      = '#fff'
borderRadius = '3px'
bgOpacity    = 0.9

command: """
ioreg -l -n "IOBluetoothDevice" | grep '\"BatteryPercent\" =' | sed 's/|//g' | sed -e 's/^[ \t]*//'
"""

refreshFrequency: 30000

style: """
  // Change bar height
  bar-height = 10px

  // Align contents left or right
  widget-align = left

  // Position this where you want
  top 375px
  left 720px

  color #625861
  font-family Helvetica Neue
  background rgba(#fff, .5)
  padding 10px 10px 15px
  border-radius 20px
  line-height: 3

  .container
    width: 310px
    height: 50px
    text-align: widget-align
    position: relative
    clear: both

  .container:not(:first-child)
    margin-top: 20px

  .widget-title
    text-align: widget-align

  .widget-title, p
    font-size 12px
    text-transform uppercase
    font-weight bold

  .label
    float: right

  .bar-container
    width: 100%
    height: bar-height
    border-radius: bar-height
    float: widget-align
    clear: both
    background: rgba(#fff, .5)
    position: absolute
    margin-bottom: 5px

  .bar
    height: bar-height
    float: widget-align
    transition: width .2s ease-in-out

  .bar:first-child
    if widget-align == left
      border-radius: bar-height 0 0 bar-height
    else
      border-radius: 0 bar-height bar-height 0

  .bar:last-child
    if widget-align == right
      border-radius: bar-height 0 0 bar-height
    else
      border-radius: 0 bar-height bar-height 0

  .bar-used
    background: rgba(#ECB713, .5)
"""

renderInfo: (name, pctg) -> """
  <div class="container">
    <div class="widget-title">#{name} <span class="label">#{pctg}%</span></div>
    <div class="bar-container">
      <div class="bar bar-used" style="width: #{pctg}%"></div>
    </div>
  </div>
"""

update: (output, domEl) ->
  devices = (device for device in output.split('\n') when device.trim() != '')
  patt = /(.*?)(\d{1,3})/

  $(domEl).html ''
  render = @renderInfo

  if devices.length == 0
    $(domEl).append render("No Devices", 0)
    $(domEl).append render("No Devices", 0)
  if devices.length == 1
    for device, i in devices 
      if match = device.match(patt)
        [_, name, pct] = match
        $(domEl).append render(name, pct)
      else
        $(domEl).append render("No Match", 0)
    $(domEl).append render("No Devices", 0)
  else
    for device, i in devices 
      if match = device.match(patt)
        [_, name, pct] = match
        $(domEl).append render(name, pct)
      else
        $(domEl).append render("No Match", 0)
