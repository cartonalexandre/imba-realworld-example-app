import {Page} from './page'
import { api } from './util'

export tag Editor < Page
	prop currentArticle
	prop tags
	def load params
		@currentArticle = {}
		if params and params:slug and params:slug !== 'new'
			api("articles/" + params:slug, "get", null, @headers).then do |data|
				@currentArticle = data:article
				tags = @currentArticle:tagList.join(' ') or null
				render
			.catch do |result|
				console.log result
	def update
		@currentArticle:tagList = @tags?.split(" ") or null
		let resource, method
		if @currentArticle and @currentArticle:slug
			resource = "articles/" + @currentArticle:slug
			method = "put"
		else
			resource = "articles"
			method = "post"
		api(resource, method, {"article": @currentArticle}, @headers).then do |data|
			window:location:href = "/"
		.catch do |result|
			console.log result
	def render
		<self>
			<div .editor-page>
				<div .container .page>
					<div .row>
						<div .col-md-10 .offset-md-1 .col-xs-12>
							<form :submit.prevent.update>
								<fieldset>
									<fieldset .form-group>
										<input[@currentArticle:title] type="text" .form-control .form-control-lg placeholder="Article Title">
									<fieldset .form-group>
										<input[@currentArticle:description] type="text" .form-control placeholder="What's this article about?">
									<fieldset .form-group>
										<textarea[@currentArticle:body] .form-control rows="8" placeholder="Write your article (in markdown)">
									<fieldset .form-group>
										<input[@tags] type="text" .form-control placeholder="Enter tags">
									<button .btn .btn-lg .btn-primary .pull-xs-right type="submit"> "Publish Article"
