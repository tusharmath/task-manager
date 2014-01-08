( (window)->

		
	window.tv = {}

	tv.addTask= (name) ->
		task = $('.task-list').append('div')
		task.innerHtml(name)
		task.addClass 'task-item'

	tv.loadTasksList = (tasks) ->
		tv.addTask t.description for t in tasks
		

	tv.addCategory = (name) ->
		
		category  = $('.category-list').append('div')
		category.innerHtml(name)
		category.addClass 'category-item'
		category.attr 'category-selected', false
		category.attr('index', tm.getCategoryCount())

	tv.deSelectAllCategories= () ->
		i.attr 'category-selected', false for i in $.all('[index]')
		
	tv.clearTasksList = () ->
		$('.task-list').innerHtml ""
	tv.clearCategoryName = () ->
		$('#categoryName').val("")
	tv.clearTaskName = () ->
		$('#taskName').val("")
)(window)