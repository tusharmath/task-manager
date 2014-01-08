( (window)->

	#private methods

	_findItem = (selector) -> document.querySelector selector
	_findAll = (selector) -> document.querySelectorAll selector

	class tQuery
		
		constructor: (param) ->
			if typeof param is 'string'
				@_domItem = _findItem param
				@_selector = param
			else if param instanceof HTMLElement
				@_domItem = param
			else if param instanceof tQuery
				@_domItem = param._domItem
			@
		#Events
		live: (eventName, callback) ->
			document.addEventListener eventName, (ev) =>
				for i in _findAll @_selector
					if i is ev.srcElement
						callback ev.srcElement, ev
			
			@


		click: (callback) -> 
			@_domItem.addEventListener 'click', callback
			@
		
		#Dom Manipulation
		append: (elementName) ->
			element = document.createElement elementName
			@_domItem.appendChild element
			new tQuery element
		
		addClass: (name) ->
			if  r = @attr('class') is null
				@attr 'class', name
			else 
				@attr 'class', r + ' ' + name
			@
		
		#Data Extraction
		attr: (name, value) ->
			if value isnt undefined
				@_domItem.setAttribute name, value
				return @
			else
				@_domItem.getAttribute name
		val: (val) -> 
			if val isnt undefined
				@_domItem.value = val
				return @
			else	
				@_domItem.value
		innerHtml: (value) ->
			if value isnt undefined
				@_domItem.innerHTML = value
				@
			else 
				@_domItem.innerHTML
		

	window.$ = (selector) -> new tQuery selector
	window.$.all = (selector) ->
		return ($ i for i in _findAll(selector))
	
)(window)