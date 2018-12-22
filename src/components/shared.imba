export tag Shared
	prop currentUser
	prop headers
	def setup
		@headers = {
			'Accept': 'application/json'
			'Content-Type': 'application/json'
		}
		@currentUser = JSON.parse(window:localStorage.getItem('user-conduit')) or undefined
		if @currentUser
			@headers = {
				'Authorization': 'Token ' + @currentUser:token,
				'Accept': 'application/json'
				'Content-Type': 'application/json'
			}
	def isLog
		return @currentUser

	def isMine author
		return isLog and @currentUser:username === author:username