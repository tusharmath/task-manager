$('#addCategoryButton').click ->
	name = $('#categoryName').val()
	tv.addCategory name
	tm.addCategory name
	$('#categoryName').val("")

$('[index]').live 'click', (e)->		
	index = $(e).attr 'index'
	tm.setCategorySelectedIndex index
	i.attr 'category-selected', false for i in $.all('[index]')
	$(e).attr 'category-selected', true


# Demo insert
$('#categoryName').val('Demo List 1')
$('#addCategoryButton')._domItem.click()

$('#categoryName').val('Demo List 2')
$('#addCategoryButton')._domItem.click()