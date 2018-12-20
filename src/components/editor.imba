import {Page} from './page'
import {ArticleModel} from '../models/article'
import { loadResource, postResource, putResource } from './util'

export tag Editor < Page
	prop title
	prop description
	prop body
	prop tags
	prop currentArticle
	def load params
		if params and params:slug and params:slug !== 'new'
			var data = await loadResource("articles/" + params:slug)
			@currentArticle = data:article
			@title = @currentArticle:title
			@description = @currentArticle:description
			@body = @currentArticle:body
			@tags = @currentArticle:tagList
			render
	def update
		if @currentArticle
			var article = @currentArticle
			article:title = @title or null
			article:description = @description or null
			article:body = @body or null
			article:tagList = [@tags] or null
			await putResource("articles/" + @currentArticle:slug, article, @headers)
		else
			var article = ArticleModel.new
			article.title = @title or null
			article.description = @description or null
			article.body = @body or null
			article.tagList = [@tags] or null
			await postResource("articles", article, @headers)
		window:location:href = "/"
		self
	def render
		<self>
			<div .editor-page>
				<div .container .page>
					<div .row>
						<div .col-md-10 .offset-md-1 .col-xs-12>
							<form :submit.prevent.update>
								<fieldset>
									<fieldset .form-group>
										<input[@title] type="text" .form-control .form-control-lg placeholder="Article Title">
									<fieldset .form-group>
										<input[@description] type="text" .form-control placeholder="What's this article about?">
									<fieldset .form-group>
										<textarea[@body] .form-control rows="8" placeholder="Write your article (in markdown)">
									<fieldset .form-group>
										<input[@tags] type="text" .form-control placeholder="Enter tags">
									<button .btn .btn-lg .btn-primary .pull-xs-right type="submit"> "Publish Article"
