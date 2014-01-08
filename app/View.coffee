( (window)->

		
	window.tv = {}

	tv.addTask= (name) ->
		task = $('.task-list').append('div')
		task.innerHtml(name)
		task.addClass 'task-item'


	tv.addCategory = (name) ->
		
		category  = $('.category-list').append('div')
		category.innerHtml(name)
		category.addClass 'category-item'
		category.attr 'category-selected', false
		category.attr('index', tm.getCategoryCount())

		

)(window)