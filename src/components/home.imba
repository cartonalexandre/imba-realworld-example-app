import {Articles} from './articles'
import {Page} from './page'
import { loadResource, formatDate } from './util'

export tag Home < Page
	prop tags
	prop currentTag
	def load
		var data = await loadResource "tags"
		@tags = data:tags
	def selectTag item
		@currentTag = item
	def resetFeed
		delete @currentTag
	def articles
		<Articles src="articles" params=[{"tag": currentTag}]>
	def render
		<self.vbox>
			<div .home-page>
				if !@currentUser
					<div .banner>
						<div .container>
							<h1 .logo-font> "conduit"
							<p> "A place to share your knowledge."
				<div .container .page>
					<div .row>
						<div .col-md-9>
							<div .feed-toggle>
								<ul .nav .nav-pills .outline-active>
									<li .nav-item css:display='none'>
										<a href="" .nav-link> "Your Feed"
									<li .nav-item>
										<a href="#" :click.resetFeed() .nav-link .active=(currentTag == undefined)> "Global Feed"
									if currentTag
										<li .nav-item>
											<a href="#" .nav-link .active> "#" + currentTag
							articles
						<div .col-md-3>
							<div .sidebar>
								<p> "Popular Tags"
								<div .tag-list> for item in tags
									<a href="#" .tag-default .tag-pill :click.selectTag(item)> item										