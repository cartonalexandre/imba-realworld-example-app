require 'imba-router'

import {Home} from './home'
import {Login} from './login'
import {Register} from './register'
import {Article} from './article'
import {Profile} from './profile'

export tag App
	def render
		<self>
			<header>
				<nav .navbar .navbar-light>
					<div .container>
						<a .navbar-brand route-to='/'> 'conduit'
						<ul .nav .navbar-nav .pull-xs-right css:display='inherit'>
							<li .nav-item>
								<a .nav-link .active route-to='/'> 'Home'
							<li .nav-item>
								<a .nav-link route-to='/login'> 'Sign in'
							<li .nav-item>
								<a .nav-link route-to='/register'> 'Sign up'
						<ul .nav .navbar-nav .pull-xs-right css:display='none'>
							<li .nav-item>
								<a .nav-link .active route-to=''> 'Home'
							<li .nav-item>
								<a .nav-link route-to='/editor'>
									<i .ion-compose>
									'New Article'
							<li .nav-item>
								<a .nav-link route-to='/settings'>
									<i .ion-gear-a>
									'Settings'
							<li .nav-item>
								<a .nav-link>
									<img .user-pic>
			<Home route="/">
			<Login route="/login">
			<Register route="/register">
			<Article route="/article/:slug">
			<Profile route="/profile/:username">
			<footer>
				<div .container>
					<a route-to='/' .logo-font> "conduit"
					<span .attribution> "An interactive learning project from "
						<a href="https://thinkster.io"> "Thinkster. "
						"Code & design licensed under MIT."

