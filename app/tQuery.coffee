( (window)->

	#private methods

	_findItem = (selector) -> document.querySelector selector
	_findAll = (selector) -> document.querySelectorAll selector

	class tQuery
		
		constructor: (param) ->
			if typeof param is 'string'
				@_domItem = _findItem param
				@_selector = param
			else
				@_domItem = param
			@
		#Events
		live: (eventName, callback) ->
			document.addEventListener 'click', (e,i) =>
				console.log 'Doc clicked!', @_selector
				for i in _findAll @_selector
					callback e.srcElement if i is e.srcElement
						

		draggable: ->
		droppable: ->
		click: (callback) -> 
			@_domItem.addEventListener 'click', callback
			@
		
		#Dom Manipulation
		append: (elementName) ->
			element = document.createElement elementName
			@_domItem.appendChild element
			new tQuery element
		
		#Data Extraction
		attr: (name, value) ->
			if value isnt undefined
				@_domItem.setAttribute name, value
			@_domItem.getAttribute name
		val: -> @_domItem.value
		innerHtml: (value) ->  @_domItem.innerHTML = value
		





	window.$ = (selector) -> new tQuery selector

)(window)