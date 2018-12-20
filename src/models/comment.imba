export class Comment
	prop body
	def toJSON
		{"comment": {body: body}}