command: 'curl -s "http://feed.aqicn.org/feed/Beijing/cn/feed.v1.json"'

refreshFrequency: 600000

render: (output) -> """
       <div>
        <div id='city'></div>
        <span id='aqi'></span>
        <span id='impact'></span>
        <div id='date'></div>
		</div>
"""

update: (output) ->
  if(!output)
    return
  data = JSON.parse(output)
	
  $('#city').text data.city.name 

  $('#aqi').text data.aqi.val 

  $('#impact').text data.aqi.impact 
  
  $('#date').text data.aqi.date 


style: """
    left: 197px
    bottom: 400px
    color: rgba(#FFF, 0.75)
    font-family: Helvetica Neue
    font-size: 14px	
    font-weight: bold

	#city
		font-size: 16px

	#aqi	
		font-size: 25px

	#impact 
		font-size: 14px	
"""