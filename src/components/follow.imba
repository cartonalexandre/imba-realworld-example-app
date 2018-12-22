import {Shared} from './shared'
import { postResource, deleteResource } from './util'

export tag Follow < Shared
	prop profile
	prop embedded
	def follow
		if @profile:following
			await deleteResource("profiles/" + @profile:username + "/follow", @headers)
		else
			await postResource("profiles/" + @profile:username + "/follow", null, @headers)
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