( (window)->

	#private methods

	_findItem = (selector) -> document.querySelector selector

	class tQuery
		
		constructor: (param) ->
			if typeof param is 'string'
				@_domItem = _findItem param
			else
				@_domItem = param
			@
		#Events
		on: ->
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