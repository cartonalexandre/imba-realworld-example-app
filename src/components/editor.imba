import {Page} from './page'
import { loadResource, postResource, putResource } from './util'

export tag Editor < Page
	prop currentArticle
	prop tags
	def load params
		if params and params:slug and params:slug !== 'new'
			var data = await loadResource("articles/" + params:slug)
			@currentArticle = data:article
			@tags = @currentArticle:tagList.join(' ') or null
			render
	def update
		@currentArticle:tagList = @tags.split(" ") or null
		if @currentArticle and @currentArticle:slug
			await putResource("articles/" + @currentArticle:slug, {"article": currentArticle}, @headers)
		else
			await postResource("articles", {"article": currentArticle}, @headers)
		window:location:href = "/"
		self
	def mount
		@currentArticle = {}
	def render
		<self>
			<div .editor-page>
				<div .container .page>
					<div .row>
						<div .col-md-10 .offset-md-1 .col-xs-12>
							<form :submit.prevent.update>
								<fieldset>
									<fieldset .form-group>
										<input[currentArticle:title] type="text" .form-control .form-control-lg placeholder="Article Title">
									<fieldset .form-group>
										<input[currentArticle:description] type="text" .form-control placeholder="What's this article about?">
									<fieldset .form-group>
										<textarea[currentArticle:body] .form-control rows="8" placeholder="Write your article (in markdown)">
									<fieldset .form-group>
										<input[@tags] type="text" .form-control placeholder="Enter tags">
									<button .btn .btn-lg .btn-primary .pull-xs-right type="submit"> "Publish Article"
