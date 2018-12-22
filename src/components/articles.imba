import {Shared} from './shared'
import {Login} from './login'
import {Register} from './register'
import {Favorite} from './favorite'
import { loadResource, formatDate, encode, postResource, deleteResource } from './util'

export tag Articles < Shared
	prop src
	prop params
	prop headers

	let articles
	let articlesCount
	let limit = 10
	let offset = 0
	let pages = []
	let currentPage = 1
	def loadArticles
		let resource = @src + "?limit=" + limit + "&offset=" + offset
		for param in params
			if Object.values(param)[0] != undefined
				resource += "&" + Object.keys(param)[0] + "=" + Object.values(param)[0]
		var data = await loadResource(resource, @headers)
		articles = data:articles
		articlesCount = data:articlesCount
		pages = []
		var i = 0
		while true
			i++
			pages.push(i)
			break if i >= (data:articlesCount / limit)
		render
	def changePage expectedPage
		offset = (expectedPage - 1) * limit
		currentPage = expectedPage
	def favorite article
		return <Favorite article=article>
	def setup
		super
		loadArticles
	def render
		<self>
			<div> for article in articles
				<div .article-preview>
					<div .article-meta>
						<a route-to="/profile/"+encode(article:author:username)>
							<img src=article:author:image>
							"  "
						<div .info>
							<a .author route-to="/profile/"+encode(article:author:username)> article:author:username
							<span .date>
								formatDate article:createdAt
						<div .pull-xs-right>
							favorite article
					<a .preview-link route-to="/article/"+article:slug>
						<h1> article:title
						<p> article:description
						<span> "Read more..."
						<ul .tag-list> for item in article:tagList
							<li .tag-default .tag-pill .tag-outline> item
			<div> if articlesCount == 0
				<br>
				"No articles yet"
			<nav> if articles and pages:length > 1
				<ul .pagination> for page in pages
					<li .page-item .active=(currentPage == page)>
						<a css:cursor='pointer' .page-link :click.changePage(page)> page
							