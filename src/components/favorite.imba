import {Shared} from './shared'
import { postResource, deleteResource } from './util'

export tag Favorite < Shared
	prop article
	prop large
	def favorite
		if @article:favorited
			await deleteResource("articles/" + @article:slug + "/favorite", @headers)
		else
			await postResource("articles/" + @article:slug + "/favorite", null, @headers)
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