import {Page} from './page'
import {User} from '../models/user'
import { loadResource, putResource } from './util'

export tag Editor < Page
	def render
		<self>