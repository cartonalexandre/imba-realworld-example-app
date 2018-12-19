import {Page} from './page'
import {Articles} from './articles'
import { loadResource, formatDate } from './util'

export tag Profile < Page
	prop profile
	let username
	def load params
		username = params:username
		var data = await loadResource "profiles/" + params:username
		@profile = data:profile
	def articles
		<Articles src="articles" params=[{"author": username}]>
	def render
		<self>
			<div .profile-page>
				<div .user-info>
					<div .container>
						<div .row>
							<div .col-xs-12 .col-md-10 .offset-md-1>
								<img .user-img src=profile:image>
								<h4> profile:username
								<p> profile:bio
								<button .btn .btn-sm .action-btn .btn-outline-secondary>
									<i .ion-plus-round>
									"   "
									"Follow " + profile:username
								<a .btn .btn-sm .btn-outline-secondary .action-btn css:display='none'>
									<i .ion-gear-a>
									"Edit Profile Settings"
				<div .container>
					<div .row>
						<div .col-xs-12 .col-md-10 .offset-md-1>
							<div .articles-toggle>
								<ul .nav .nav-pills .outline-active>
									<li .nav-item>
										<a .nav-link .active> "My Posts"
									<li .nav-item>
										<a .nav-link> "Favorited Posts"
							articles