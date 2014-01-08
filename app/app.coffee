$('#addTaskButton').click ->
	name = $('#taskName').val()
	tv.addTask name
	tm.addTask name
	tv.clearTaskName()

$('#addCategoryButton').click ->
	name = $('#categoryName').val()
	tv.addCategory name
	tm.addCategory name
	tv.clearCategoryName()

#Live Events


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


$('#taskName').val('Eat a pie')
$('#addTaskButton')._domItem.click()

$('#taskName').val('Drink some tea')
$('#addTaskButton')._domItem.click()

$('#taskName').val('Play squash')
$('#addTaskButton')._domItem.click()
