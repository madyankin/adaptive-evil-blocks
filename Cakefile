fs      = require('fs-extra')
url     = require('url')
exec    = require('child_process').exec
coffee  = require('coffee-script')
uglify  = require('uglify-js')

project =

  package: ->
    JSON.parse(fs.readFileSync('package.json'))

  name: ->
    @package().name

  version: ->
    @package().version


task 'clean', 'Remove all generated files', ->
  fs.removeSync('pkg/') if fs.existsSync('pkg/')
  for file in fs.readdirSync('./')
    fs.removeSync(file) if file.match(/\.gem$/)


task 'build', 'Compile coffee files', ->
  invoke('clean')
  fs.mkdirsSync('pkg/')

  source    = fs.readFileSync('./lib/adaptive-evil-blocks.coffee').toString()
  compiled  = coffee.compile(source)
  minimized = uglify.minify(compiled, fromString: true).code

  fs.writeFile("pkg/#{project.name()}-#{project.version()}.js", compiled)
  fs.writeFile("pkg/#{project.name()}-#{project.version()}.min.js", minimized)
