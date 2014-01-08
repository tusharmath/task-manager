$('#addTaskButton').click ->
	name = $('#taskName').val()
	tv.addTask name
	tm.addTask name
	$('#taskName').val("")


$('#addCategoryButton').click ->
	name = $('#categoryName').val()
	tv.addCategory name
	tm.addCategory name
	$('#categoryName').val("")

#Live Events

$('.task-item').live 'click', (e) ->
	$(e).removeAttr 'disabled'

$('.task-item').live 'focusout', (e) ->
	$(e).attr 'disabled'

$('.category-item').live 'click', (e)->		
	index = $(e).attr 'index'

	#updating model
	tm.setCategorySelectedIndex index

	#updating ui
	i.attr 'category-selected', false for i in $.all('[index]')
	$(e).attr 'category-selected', true


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
