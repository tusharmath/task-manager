	matchdep = require 'matchdep'
		
	module.exports = (grunt) ->	
		matchdep.filter('grunt-*').forEach (task)-> grunt.loadNpmTasks(task)

		grunt_config = 
			opt: output: './.bin'
			pkg: grunt.file.readJSON 'package.json'
			release: 
				options: npm: false

			manifest: generate:
				options:
					timerstamp: true
					basePath : '<%= opt.output%>'
					verbose: true
					master: 'index.html'
					
				src: [
					'*.js', '*.css'
				]
				dest: '<%= opt.output%>/manifest.appcache'



			'gh-pages':
				release:
					options: base: "<%= opt.output%>"
					src: "**"

			jade:
				compile:
					options: data: 
						debug: false, version: "<%= pkg.version%>"
					files: [
						"<%= opt.output%>/index.html" : "./views/index.jade"
					]
			coffee:
				compile:
					options: join: true
					
					files: {
						'app/app.min.js': [
							'app/tQuery.coffee'
							'app/TaskManager.coffee'
							'app/View.coffee'
							'app/app.coffee'
						]
					}
			uglify: compile: files:
				"<%= opt.output%>/script-<%= pkg.version%>.js":[
					'app/app.min.js'
				]

			clean: 
				build: ['<%= opt.output%>']
				tempJS: ['app/app.min.js']
			less: 
				compile:
					options: 
						strictImports: true
						compress: true

					files: 
						"<%= opt.output%>/style-<%= pkg.version%>.css" : "app/styles/less/style.less"
				
		grunt.initConfig grunt_config
		grunt.registerTask 'publish', ['release', 'clean:build','jade', 'less', 'coffee', 'uglify','clean:tempJS', 'manifest', 'gh-pages']
