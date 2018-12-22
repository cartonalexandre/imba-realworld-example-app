import {Page} from './page'
import {Articles} from './articles'
import { loadResource, formatDate } from './util'

export tag Profile < Page
	prop profile
	def load params
		var data = await loadResource "profiles/" + params:username
		@profile = data:profile
	def articles
		<Articles src="articles" params=[{"author": @profile:username}]>
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
								if !isMine(profile)
									<button .btn .btn-sm .action-btn .btn-outline-secondary>
										<i .ion-plus-round>
										"   "
										"Follow " + profile:username
								else
									<a .btn .btn-sm .btn-outline-secondary .action-btn route-to='/settings'>
										<i .ion-gear-a>
										"   "
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