var URL_ENDPOINT="https://conduit.productionready.io/api/"

export def loadResource resource, headers
	var res = await window.fetch(URL_ENDPOINT+resource, {
		headers: headers
	})
	return res.json

export def loadAsyncResource resource
	window.fetch(URL_ENDPOINT+resource).then do |res|
		return res.json

export def postResource resource, data, headers
	var res = await window.fetch(URL_ENDPOINT+resource, {
				method: 'post',
				headers: headers,
				body: JSON.stringify(data)
			}
		)
	return res.json

export def putResource resource, data, headers
	var res = await window.fetch(URL_ENDPOINT+resource, {
				method: 'put',
				headers: headers,
				body: JSON.stringify(data)
			}
		)
	return res.json

export def formatDate inputDate
	var options = { year: 'numeric', month: 'long', day: 'numeric' };
	var aDate = Date.new(inputDate);
	return aDate.toLocaleDateString("en-US", options)

export def encode p
	return window.encodeURIComponent(p).replace(/!/g, '%21').replace(/'/g, '%27').replace(/\(/g, '%28').replace(/\)/g, '%29').replace(/\*/g, '%2A').replace(/%20/g, '+')
