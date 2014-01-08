$('#addTaskButton').click ->
	name = $('#taskName').val()
	tm.addTask name

	tv.clearTaskName()
	tv.clearTasksList()
	tv.loadTasksList tm.getAllTasks()

$('#addCategoryButton').click ->
	name = $('#categoryName').val()
	tv.addCategory name
	tm.addCategory name
	tv.clearCategoryName()

#Live Events

$('.close').live 'click', (e) ->
	index = $(e).attr 'index'
	tm.removeTask index
	tv.clearTasksList()
	tv.loadTasksList tm.getAllTasks()

$('.task-item input[type="text"]').live 'focusout', (e) ->
	val = $(e).val()
	index = $(e).attr('index')
	tm.updateTask index, val
	tv.clearTasksList()
	tv.loadTasksList tm.getAllTasks()

$('.category-item').live 'click', (e)->		
	index = $(e).attr 'index'

	#updating model
	tm.setCategorySelectedIndex index

	#updating ui
	tv.deSelectAllCategories()
	$(e).attr 'category-selected', true

	tasks = tm.getAllTasks()
	tv.clearTasksList()
	tv.loadTasksList(tasks)


# Demo insert
$('#categoryName').val('Pending')
$('#addCategoryButton')._domItem.click()

$('#categoryName').val('On Hold')
$('#addCategoryButton')._domItem.click()

$('#categoryName').val('Doing')
$('#addCategoryButton')._domItem.click()

$('[index]')._domItem.click()

tm.addTask 'Eat a pie'
tm.addTask 'Drink some tea'
tm.addTask 'Play squash'
tv.loadTasksList tm.getAllTasks()