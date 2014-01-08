$('#addTaskButton').click ->
	name = $('#taskName').val()
	if name.length > 0
		tm.addTask name
		tv.clearTaskName()
		tv.clearTasksList()
		tv.loadTasksList()

$('#addCategoryButton').click ->
	name = $('#categoryName').val()
	if name.length > 0
		tv.addCategory name
		tm.addCategory name
		tv.clearCategoryName()

#Live Events

$('.task-item').live 'dragstart', (el, ev)-> 
	index = $(el).attr 'index'
	ev.dataTransfer.setData 'index', index
	true


$('.category-item').live 'dragenter', (el, ev) ->
	ev.preventDefault()
	true
	
$('.category-item').live 'dragenter', (el, ev) ->
	el.classList.add('over');

$('.category-item').live 'dragleave', (el, ev) ->
	el.classList.remove('over');

$('.category-item').live 'dragover', (el, ev) ->
	ev.preventDefault()
	false
	
$('.category-item').live 'drop', (el, ev) ->

	index = ev.dataTransfer.getData 'index'
	el.classList.remove('over')

	task = tm.getTask index
	tm.removeTask index
	tm.setCategorySelectedIndex $(el).attr 'index'
	tm.addTask task.description

	tv.clearTasksList()
	tv.loadTasksList tm.getAllTasks()
	tv.setCategorySelected()

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
	tv.loadTasksList()

$('.category-item').live 'click', (e)->		
	index = $(e).attr 'index'

	#updating model
	tm.setCategorySelectedIndex index

	#updating ui
	tv.setCategorySelected()
	
	tv.clearTasksList()
	tv.loadTasksList()


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
tv.loadTasksList()