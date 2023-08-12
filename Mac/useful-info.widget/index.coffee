command: "useful-info.widget/wallpaper.sh"

refreshFrequency: 1800000

render: -> 
	"<table>
		<tr>
			<td>Hostname:</td>
			<td class='cell1'></td>
		</tr>
		<tr>
			<td>Serial Number:</td>
			<td class='cell2'></td>
		</tr>
		<tr class='space'>
			<td></br></td>
			<td></br></td>
		</tr>	
		<tr class='sysver'>
			<td>OS Version:</td>
			<td class='cell3'></td>
		</tr>
		<tr class='user'>
			<td>User Name:</td>
			<td class='cell4'></td>
		</tr>
		<tr class='boot'>
			<td>Boot Time:</td>
			<td class='cell5'></td>
		</tr>
		<tr class='space'>
			<td></br></td>
			<td></br></td>
		</tr>	
		<tr class='memory'>
			<td>Memory:</td>
			<td class='cell6'></td>
		</tr>	
		<tr class='freedisk'>
			<td>Free Disk:</td>
			<td class='cell7'></td>
		</tr>
		<tr class='space'>
			<td></br></td>
			<td></br></td>
		</tr>
		<tr>
			<td class='cell8'></td>
			<td class='cell9'></td>
		</tr>
		<tr>
			<td class='cell10'></td>
			<td class='cell11'></td>
		</tr>	
		<tr>
			<td class='cell12'></br></td>
			<td class='cell13'></br></td>
		</tr>	
		<tr>
			<td class='cell14'></td>
			<td class='cell15'></td>
		</tr>	
		<tr>
			<td class='cell16'></td>
			<td class='cell17'></td>
		</tr>	
		<tr>
			<td class='cell18'></td>
			<td class='cell19'></td>
		</tr>	
		<tr>
			<td class='cell20'></td>
			<td class='cell21'></td>
		</tr>	
		<tr>
			<td class='cell22'></td>
			<td class='cell23'></td>
		</tr>	
		<tr>
			<td class='cell24'></td>
			<td class='cell25'></td>
		</tr>
		<tr class='space'>
			<td></br></td>
			<td></br></td>
		</tr>																			
	</table>"

update: (output, domEl) ->
	@$domEl = $(domEl)
	el = @$domEl.find('table')

	args = output.split('\n')
	ip = 0
	dns = 0
	mac = 0
	
	for arg, i in args
		info = arg.split('\t')
		if info[0] is 'Hostname:'
			host = info[1].split('.')
			el.find(".cell1").text host[0].toUpperCase()
		else if info[0] is 'Serial Number:'
			el.find(".cell2").text info[1]
		else if info[0] is 'OS Version:'
			el.find(".cell3").text info[1]
		else if info[0] is 'User Name:'
			el.find(".cell4").text info[1]
		else if info[0] is 'Boot Time:'
			el.find(".cell5").text info[1]
		else if info[0] is 'Memory:'
			el.find(".cell6").text info[1]
		else if info[0] is 'Free Disk:'
			el.find(".cell7").text info[1]
		else if info[0] is 'IP Address:'
			if ip is 0
				el.find(".cell8").text info[0]
				el.find(".cell9").text info[1]
				ip += 1
			else if ip is 1
				el.find(".cell10").text info[0]
				el.find(".cell11").text info[1]
				ip += 1
		else if info[0] is 'DNS Server:'
			if dns is 0
				el.find(".cell14").text info[0]
				el.find(".cell15").text info[1]
				dns += 1
			else if dns is 1
				el.find(".cell16").text info[0]
				el.find(".cell17").text info[1]
		else if info[0] is 'Mac Address:'
			if mac is 0
				el.find(".cell18").text info[0]
				el.find(".cell19").text info[1]
				mac += 1
			else if mac is 1
				el.find(".cell20").text info[0]
				el.find(".cell21").text info[1]
				mac += 1
		else if info[0] is 'Display Mac:'
			if mac is 0
				el.find(".cell18").text info[0]
				el.find(".cell19").text info[1]	
				mac += 1															
			else if mac is 1
				el.find(".cell20").text info[0]
				el.find(".cell21").text info[1]
				mac += 1
			else if mac is 2
				el.find(".cell22").text info[0]
				el.find(".cell23").text info[1]
				mac +=1

	if ip is 1
		el.find(".cell10").text ''
		el.find(".cell11").text ''			
	if mac is 1
		el.find(".cell20").text ''
		el.find(".cell21").text ''
		el.find(".cell22").text ''
		el.find(".cell23").text ''	
	else if mac is 2
		el.find(".cell22").text ''
		el.find(".cell23").text ''	

style: """
	top: 540px
	left: 720px
	color: #fff
	font-family: Helvetica Neue
	font-size: 14px
	font-weight: bold

	table
		width: 800px
		height: 200px

	td:first-child
		width: 27%	
"""