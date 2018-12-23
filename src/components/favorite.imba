import {Shared} from './shared'
import { api } from './util'

export tag Favorite < Shared
	prop article
	prop large
	def favorite
		if !isLog
			window:location:href = "/login"
			return
		let method = "post"
		if @article:favorited
			method = "delete"
		api("articles/" + @article:slug + "/favorite", method, null, @headers).then do |data|
			# nothing
		.catch do |result|
			console.log result
	def render
		<self css:display='inline-block'>
			<button .btn .btn-sm .btn-outline-primary :click.favorite(article) .active=(article:favorited)>
				<i .ion-heart>
				"  "
				if !large
					<span> article:favoritesCount
				else
					"Favorite Post "
					<span .counter> "(" + article:favoritesCount + ")"