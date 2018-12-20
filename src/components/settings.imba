import {Page} from './page'
import {User} from '../models/user'
import { loadResource, putResource } from './util'

export tag Settings < Page
	prop user
	prop username
	prop email
	prop bio
	prop image
	prop password
	def mount
		var data = await loadResource("user", @headers)
		@user = data:user
		@username = @user:username
		@image = @user:image
		@bio = @user:bio
		@email = @user:email
		render
	def update
		var user = User.new()
		user.username = @username or null
		user.email = @email or null
		user.bio = @bio or null
		user.image = @image or null
		user = await putResource("user", user, @headers)
		window:location:href = "/"
		self
	def logout
		window:localStorage.removeItem('user-conduit')
		window:location:href = "/"
		self
	def render
		<self>
			<div .settings-page>
				<div .container .page>
					<div .row>
						<div .col-md-6 .offset-md-3 .col-xs-12>
							<h1 .text-xs-center> "Your Settings"
							<form :submit.prevent.update>
								<fieldset>
									<fieldset .form-group>
										<input[@image] .form-control type="text" placeholder="URL of profile picture">
									<fieldset .form-group>
										<input[@username] .form-control .form-control-lg type="text" placeholder="Your Name">
									<fieldset .form-group>
										<textarea[@bio] .form-control .form-control-lg rows="8" placeholder="Short bio about you">
									<fieldset .form-group>
										<input[@email] .form-control .form-control-lg type="text" placeholder="Email">
									<fieldset .form-group>
										<input[@password] .form-control .form-control-lg type="password" placeholder="Password">
									<button .btn .btn-lg .btn-primary .pull-xs-right type="submit"> "Update Settings"
							<hr>
							<button .btn .btn-outline-danger :click.logout> "Or click here to logout."