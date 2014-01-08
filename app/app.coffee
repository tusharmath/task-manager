model =
	categoryCount: 0
	categorySelectedIndex: -1
	categories: []

$('#addCategoryButton').click ->
	name = $('#categoryName').val()

	#Adding data to model
	

	category  = $('.category-list').append('div')
	category.innerHtml(name)
	category.attr('index', tm.getCategoryCount() )
	category.click ->
		model.categorySelectedIndex = Number category.attr 'index'
	
	tm.addCategory name	



	 
