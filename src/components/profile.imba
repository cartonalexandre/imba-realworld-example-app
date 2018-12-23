import {Page} from './page'
import {Articles} from './articles'
import {Follow} from './follow'
import { formatDate, api } from './util'

export tag Profile < Page
	prop profile
	prop currentFeed
	def mount
		currentFeed = 'my'
	def load params
		api("profiles/" + params:username, "get", null, @headers).then do |data|
			@profile = data:profile
		.catch do |result|
			console.log result
	def selectFeed feed
		@currentFeed = feed
	def articles
		let params, headers
		if @currentFeed == "my"
			params =[{"author": @profile:username}]
		if @currentFeed == "favorited"
			params =[{"favorited": @profile:username}]
		<Articles src="articles" params=params>
	def follow
		return <Follow profile=profile>
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
								if isMine(profile)
									<a .btn .btn-sm .btn-outline-secondary .action-btn route-to='/settings'>
										<i .ion-gear-a>
										"   "
										"Edit Profile Settings"
								else
									follow
				<div .container>
					<div .row>
						<div .col-xs-12 .col-md-10 .offset-md-1>
							<div .articles-toggle>
								<ul .nav .nav-pills .outline-active>
									<li .nav-item>
										<button .nav-link :click.selectFeed("my") .active=(currentFeed === 'my')> "My Posts"
									<li .nav-item>
										<button .nav-link :click.selectFeed("favorited") .active=(currentFeed === 'favorited')> "Favorited Posts"
							articles