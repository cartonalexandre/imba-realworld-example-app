export class User
	prop username
	prop email
	prop password
	prop token
	prop bio
	prop image
	def toJSON
		{"user": {username: username, email: email, password: password, bio: bio, image: image}}