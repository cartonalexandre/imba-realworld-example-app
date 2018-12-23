import {Shared} from './shared'
import { api } from './util'

export tag Follow < Shared
	prop profile
	prop embedded
	def follow
		if !isLog
			window:location:href = "/login"
			return
		let method = "post"
		if @profile:following
			method = "delete"
		api("profiles/" + @profile:username + "/follow", method, null, @headers).then do |data|
			@profile:following = !@profile:following
		.catch do |result|
			console.log result
	def render
		var css
		if embedded
			css = 'inline-block'
		<self css:display=css >
			<button .btn .btn-sm .btn-outline-secondary .action-btn .active=(profile:following) :click.follow >
				<i .ion-plus-round>
				"   "
				if profile:following
					"Unfollow "
				else
					"Follow "
				profile:username