import {Page} from './page'

export tag Register < Page
	def render
		<self>
			<div .container .page>
				<div .row>
					<div .col-md-6 .offset-md-3 .col-xs-12>
						<h1 .text-xs-center> "Sign up"
						<p .text-xs-center>
							<a route-to='/login'> "Have an account?"
						<form>
							<fieldset>
								<fieldset .form-group>
									<input .form-control .form-control-lg type="text" placeholder="Username">
								<fieldset .form-group>
									<input .form-control .form-control-lg type="email" placeholder="Email">
								<fieldset .form-group>
									<input .form-control .form-control-lg type="password" placeholder="Password">
								<button .btn .btn-lg .btn-primary .pull-xs-right type="submit"> "Sign up"