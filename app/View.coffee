( (window)->

		
	window.tv = {}

	tv.addTask= (name, index) ->
		task = $('.task-list')
			.append('div')
			.attr('draggable', true)
			.attr('index', index)

		task.append('span')
			.innerHtml('#')	
			
			.addClass('draggable-hash')

		task.append('input')
			.val(name)
			.attr('index', index)
			.attr('type', 'text')
		task.append('span')
			.addClass('close')
			.innerHtml('x')
			.attr('index', index)


		task.addClass 'task-item'

	tv.loadTasksList = (tasks) ->
		tv.addTask t.description, i for t,i in tasks
		

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