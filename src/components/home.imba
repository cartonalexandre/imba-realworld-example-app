import {Articles} from './articles'
import {Page} from './page'
import { loadResource, formatDate } from './util'

export tag Home < Page
	prop tags
	prop currentTag
	prop currentFeed
	def load
		var data = await loadResource "tags"
		@tags = data:tags
	def selectFeed current, param
		@currentFeed = current
		if (current == "tag")
			@currentTag = param
	def articles
		let params, headers
		let src = "articles"
		if @currentFeed == "tag"
			params = [{"tag": currentTag}]
		if @currentFeed == "your"
			src = "articles/feed"
			headers = @headers
		<Articles src=src params=params headers=headers>
	def mount
		@currentFeed = "global"
	def render
		<self>
			<div .home-page>
				if !isLog
					<div .banner>
						<div .container>
							<h1 .logo-font> "conduit"
							<p> "A place to share your knowledge."
				<div .container .page>
					<div .row>
						<div .col-md-9>
							<div .feed-toggle>
								<ul .nav .nav-pills .outline-active>
									if isLog
										<li .nav-item>
											<button :click.selectFeed("your") .nav-link .active=(currentFeed == "your")> "Your Feed"
									<li .nav-item>
										<button :click.selectFeed("global") .nav-link .active=(currentFeed == "global")> "Global Feed"
									if currentFeed == "tag"
										<li .nav-item>
											<button .nav-link .active> "#" + currentTag
							articles
						<div .col-md-3>
							<div .sidebar>
								<p> "Popular Tags"
								<div .tag-list> for item in tags
									<a href="#" .tag-default .tag-pill :click.selectFeed("tag", item)> item