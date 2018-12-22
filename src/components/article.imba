import {Page} from './page'
import {Login} from './login'
import {Register} from './register'
import {Comment} from '../models/comment'
import {Follow} from './follow'
import {Favorite} from './favorite'
import { loadResource, formatDate, encode, postResource, deleteResource } from './util'

export tag Article < Page
	prop article
	prop comments
	prop currentComment
	def loadComments
		var data = await loadResource "articles/" + params:slug + "/comments"
		@comments = data:comments
	def load params
		var data = await loadResource "articles/" + params:slug
		@article = data:article
		loadComments
	def postComment
		var comment = Comment.new();
		comment.body = @currentComment
		await postResource("articles/" + params:slug + "/comments", comment, @headers)
		loadComments
	def deleteComment comment
		await deleteResource("articles/" + params:slug + "/comments/" + comment:id, @headers)
		loadComments
	def deleteArticle
		await deleteResource("articles/" + @article:slug, @headers)
		window:location:href = "/"
		self
	def followAndFavorite
		return
			<Follow embedded=true profile=@article:author>
			"   "
			<Favorite large=true article=@article>
	def editAndDeleteArticle
		return
			<a href route-to="/editor/"+encode(@article:slug) .btn .btn-outline-secondary .btn-sm>
				<i .ion-edit>
				"  "
				"Edit Article"
			"     "
			<button :click.deleteArticle .btn .btn-outline-danger .btn-sm>
				<i .ion-trash-a>
				"  "
				"Delete Article"
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
							if !isMine(article:author)
								followAndFavorite
							else
								editAndDeleteArticle
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
							if !isMine(article:author)
								followAndFavorite
							else
								editAndDeleteArticle
					<div .row>
						<div .col-xs-12 .col-md-8 .offset-md-2>
							if isLog
								<div>
									<form .card .comment-form :submit.prevent.postComment>
										<div .card-block>
											<textarea[@currentComment] .form-control placeholder="Write a comment..." rows="3">
										<div .card-footer>
											<img .comment-author-img>
											<button .btn .btn-sm .btn-primary type="submit"> "Post Comment"
							else
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
										if isMine(comment:author)
											<span .mod-options>
												<i .ion-trash-a :click.deleteComment(comment)>
							