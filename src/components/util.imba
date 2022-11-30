var URL_ENDPOINT="https://api.realworld.io/api/"

def parseJSON response
	return Promise.new(
		do |resolve|
			response.json().then(
				do |json|
					resolve({
						status: response:status,
						ok: response:ok,
						json: json
					})
			)
	)

export def api url, method, data, headers
	var options = {
		method: method,
		headers: headers
	}
	if method !== 'get' and data
		options:body = JSON.stringify(data)

	return Promise.new do |resolve, reject|
		window.fetch(URL_ENDPOINT  + url, options)
		.then( do |response|
			parseJSON response
		).then( do |response|
			if response:ok
				return resolve(response:json)
			return reject(response:json)
		)
		.catch( do |error|
			reject({
				networkError: error:message,
			})
		)

export def formatDate inputDate
	var options = { year: 'numeric', month: 'long', day: 'numeric' };
	var aDate = Date.new(inputDate);
	return aDate.toLocaleDateString("en-US", options)

export def encode p
	return window.encodeURIComponent(p).replace(/!/g, '%21').replace(/'/g, '%27').replace(/\(/g, '%28').replace(/\)/g, '%29').replace(/\*/g, '%2A').replace(/%20/g, '+')
