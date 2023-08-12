# Execute the shell command.
command: ''

# Set the refresh frequency (milliseconds).
refreshFrequency: 7200000

# Render the output.
render: (output) -> """
  <div id='heading'>Today is</div>
  <table id='dateTable' border="0">
    <tr>
      <td id='dayNumber' colspan="2">0</td>
    </tr>
    <tr>
      <td id='dayName' colspan="2">Sunday</td>
    </tr>
      <td id='monthName'>January</td>
      <td id='year'>0000</td>
    </tr>
  </table>
"""

# Update the rendered output.
update: (output, domEl) -> 
  dom = $(domEl)
  
  # Get today's date information.
  theDate = new Date()
  theYear = theDate.getFullYear()
  theMonth = theDate.getMonth()
  theMonthName = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'][theMonth]
  theDay = theDate.getDay()
  theDayName = ['Sunday','Monday','Tuesday','Wednesday','Thursday','Friday','Saturday'][theDay]
  theDayNumber = theDate.getDate()
  
  # Update the table with the date information.
  dom.find(year).html(theYear)
  dom.find(monthName).html(theMonthName)
  dom.find(dayName).html(theDayName)
  dom.find(dayNumber).html(theDayNumber)
  
# CSS Style
style: """
  top: 547px
  left: 20px
  width:330px
  margin:0px
  padding:0px
  background:rgba(#FFF, 0.5)
  border:0px solid rgba(#000, 0.5)
  border-radius:20px
  overflow:hidden

  #dateTable
    width:100%
    background:rgba(255,255,255,0.5)

  #heading
    margin:20pt
    padding-left:5pt
    font-family: Helvetica
    font-size: 25pt
    font-weight:bold
    color: rgba(#FFF, 0.75)
  
  #dayNumber
    margin-left:5pt
    margin-right:5pt
    font-family: American Typewriter
    font-size: 130pt
    font-weight:bold
    text-align:center
    
  #dayName, #monthName, #year
    padding-left:12pt
    padding-right:12pt
    font-family: Helvetica
    font-weight:bold
    font-size: 20pt
  
  #monthName, #year
    padding-bottom:12pt
    
  #year
    text-align:right  
  
  
"""
