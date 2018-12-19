import {Page} from './page'
import {Login} from './login'
import {Register} from './register'
import { loadResource, formatDate, encode } from './util'

export tag Article < Page
	prop article
	prop comments
	def load params
		var data = await loadResource "articles/" + params:slug
		@article = data:article
		data = await loadResource "articles/" + params:slug + "/comments"
		@comments = data:comments
	def render
		<self>
			<div .article-page>
				<div .banner>
					<div .container>
						<h1> article:title
						<div .article-meta>
							<a route-to="/profile/"+encode(article:author:username)>
								<img src=article:author:image>
							<div .info>
								<a route-to="/profile/"+encode(article:author:username) .author> article:author:username
								<span .date> formatDate article:createdAt
							<button .btn .btn-sm .btn-outline-secondary>
								<i .ion-plus-round>
								"  "
								"Follow " + article:author:username
							"     "
							<button .btn .btn-sm .btn-outline-primary>
								<i .ion-heart>
								"  "
								"Favorite Post "
								<span .counter> "(" + article:favoritesCount + ")"
				<div .container .page>
					<div .row .article-content>
						<div .col-md-12>
							<p> article:body
							<ul .tag-list> for item in article:tagList
								<li .tag-default .tag-pill .tag-outline> item
					<hr>
					<div .article-actions>
						<div .article-meta>
							<a route-to="/profile/"+encode(article:author:username)>
								<img src=article:author:image>
							<div .info>
								<a route-to="/profile/"+encode(article:author:username) .author> article:author:username
								<span .date> formatDate article:createdAt
							<button .btn .btn-sm .btn-outline-secondary>
								<i .ion-plus-round>
								"  "
								"Follow " + article:author:username
							"     "
							<button .btn .btn-sm .btn-outline-primary>
								<i .ion-heart>
								"  "
								"Favorite Post "
								<span .counter> "(" + article:favoritesCount + ")"
					<div .row>
						<div .col-xs-12 .col-md-8 .offset-md-2>
							<div css:display='none'>
								<form .card .comment-form>
									<div .card-block>
										<textarea .form-control placeholder="Write a comment..." rows="3">
									<div .card-footer>
									<img .comment-author-img>
									<button .btn .btn-sm .btn-primary type="submit"> "Post Comment"
							<p>
								<a href="#" route-to="/login"> "Sign in"
								" or "
								<a href="#" route-to="/register"> "sign up "
								"to add comments on this article."
							<div .comment> for comment in comments
								<div .card>
									<div .card-block>
										<p .card-text> comment:body
									<div .card-footer>
										<a .comment-author href="">
											<img .comment-author-img src=comment:author:image>
										"  "
										<a .comment-author href=""> comment:author:username
										<span .date-posted> formatDate comment:createdAt
										<span .mod-options css:display='none'>
											<i .ion-trash-a>
							