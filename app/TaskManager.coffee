#Tasks Manager Module
( (window) ->

	class CategoryManager
		constructor: ->
			@_Categories = []
			@selectedCategory = -1
		
		#GROUP  MANIPULATION
		addCategory: (name) -> @_Categories.push new Category name
		removeCategory: (id) -> @_Categories.splice id, 1
		getAllTasks: (CategoryId = @selectedCategory) -> @_Categories[CategoryId].getAllTasks()
		getAllCategorys: () -> @_Categories
		getCategoryCount: () -> @_Categories.length
		setCategorySelectedIndex: (val) ->
			@selectedCategory = Number val
		getCategorySelectedIndex: () ->
			@selectedCategory


		#TASKS MANIPULATION	
		addTask: (description, categoryId = @selectedCategory) ->
			@_Categories[categoryId].addTask(new Task description)
		
		removeTask: (taskId, categoryId = @selectedCategory) ->
			@_Categories[categoryId].deleteTask taskId
		
		updateTask: (taskId, description, categoryId = @selectedCategory) ->
			@_Categories[categoryId].getTask(Number(taskId)).update description
		
		getTask: (taskId, categoryId = @selectedCategory) ->
			@_Categories[categoryId].getTask Number taskId


	class Category
		constructor:(@name) -> @_tasks = []
		addTask: (task)-> @_tasks.push task
		deleteTask: (id) ->	@_tasks.splice id, 1
		CategoryTasks : -> @_tasks
		getTask: (id) -> @_tasks[id]
		getAllTasks: () -> @_tasks

	class Task
		constructor: (@description)->
		update: (@description) ->

	window.tm = new CategoryManager

)(window)