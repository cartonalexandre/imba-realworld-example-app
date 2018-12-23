require 'imba-router'

import {Home} from './home'
import {Login} from './login'
import {Register} from './register'
import {Article} from './article'
import {Profile} from './profile'
import {User} from '../models/user'
import {Settings} from './settings'
import {Shared} from './shared'
import {Editor} from './editor'
import { encode } from './util'

export tag App < Shared
	def render
		<self>
			<header>
				<nav .navbar .navbar-light>
					<div .container>
						<a .navbar-brand route-to='/'> 'conduit'
						<ul .nav .navbar-nav .pull-xs-right>
							<li .nav-item>
								<a .nav-link route-to='/'> 'Home'
							if !isLog
								<li .nav-item>
									<a .nav-link route-to='/login'> 'Sign in'
								<li .nav-item>
									<a .nav-link route-to='/register'> 'Sign up'
							else
								<li .nav-item>
									<a .nav-link route-to='/editor/new'>
										<i .ion-compose>
										' New Article'
								<li .nav-item>
									<a .nav-link route-to='/settings'>
										<i .ion-gear-a>
										' Settings'
								<li .nav-item>
									<a .nav-link route-to="/profile/"+encode(currentUser:username)> currentUser:username
									<img .user-pic src=currentUser:image> 
			<Home route='/'>
			<Login route='/login'>
			<Register route='/register'>
			<Article route='/article/:slug'>
			<Profile route='/profile/:username'>
			<Settings route='/settings'>
			<Editor route='/editor/:slug'>
			<footer>
				<div .container>
					<a route-to='/' .logo-font> "conduit"
					<span .attribution> "An interactive learning project from "
						<a href="https://thinkster.io"> "Thinkster. "
						"Code & design licensed under MIT."

