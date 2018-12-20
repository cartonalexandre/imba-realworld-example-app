export class ArticleModel
	prop body
	prop description
	prop tagList
	prop title
	def toJSON
		{"article": {body: body, description: description, tagList: tagList, title: title}}