import {Page} from './page'
import {User} from '../models/user'
import { formatDate, encode, api } from './util'

export tag Register < Page
	let errors
	def register
		let user = User.new();
		user.username = @username
		user.email = @email
		user.password = @password
		api("users", "post", user, @headers).then do |data|
			user = data
			window:localStorage.setItem('user-conduit',JSON.stringify(user:user)) if user:user != @user
			window:location:href = "/"
		.catch do |result|
			errors = result:errors
	def render
		<self>
			<div .container .page>
				<div .row>
					<div .col-md-6 .offset-md-3 .col-xs-12>
						<h1 .text-xs-center> "Sign up"
						<p .text-xs-center>
							<a route-to='/login'> "Have an account?"
						if errors
							<ul .error-messages>
								for key in Object.keys(errors)
									<li> for val in Object.values(errors[key])
										key + " " + val
						<form :submit.prevent.register>
							<fieldset>
								<fieldset .form-group>
									<input[@username] .form-control .form-control-lg type="text" placeholder="Username">
								<fieldset .form-group>
									<input[@email] .form-control .form-control-lg type="email" placeholder="Email">
								<fieldset .form-group>
									<input[@password] .form-control .form-control-lg type="password" placeholder="Password">
								<button .btn .btn-lg .btn-primary .pull-xs-right type="submit"> "Sign up"