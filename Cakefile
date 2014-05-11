fs      = require('fs-extra')
url     = require('url')
exec    = require('child_process').exec
coffee  = require('coffee-script')
uglify  = require('uglify-js')

project =

  package: ->
    JSON.parse(fs.readFileSync('bower.json'))

  name: ->
    @package().name

  version: ->
    @package().version

  authors: ->
    @package().authors[0]

  description: ->
    @package().description

  homepage: ->
    @package().homepage

  message: ->
    """
    /*
     * #{@name()}-#{@version()}
     * #{@description()}
     * #{@homepage()}
     * #{(new Date).getFullYear()} #{@authors()}
     */\n\n
    """

cmd = (command) ->
  exec command, (err, stdout, stderr) ->
    throw err if err
    console.log stdout + stderr

compile = (file) ->
  coffee.compile(readFile(file))

readFile = (file) ->
  fs.readFileSync(file).toString()


task 'clean', 'Remove all generated files', ->
  fs.removeSync('pkg/') if fs.existsSync('pkg/')
  for file in fs.readdirSync('./')
    fs.removeSync(file) if file.match(/\.gem$/)
  fs.removeSync('test/adaptive.js') if fs.existsSync('test/adaptive.js')


task 'build', 'Compile coffee files', ->
  invoke('clean')
  fs.mkdirsSync('pkg/')

  adaptive    = project.message()
  adaptive    += compile('./lib/adaptive-evil-blocks.coffee')

  compiled    = ''
  compiled    += readFile('./bower_components/matchMedia/matchMedia.js')
  compiled    += readFile('./bower_components/matchMedia/matchMedia.addListener.js')
  compiled    += adaptive
  minimized   = uglify.minify(compiled, fromString: true).code

  fs.writeFileSync("pkg/#{project.name()}.polyfilled.js", compiled)
  fs.writeFileSync("pkg/#{project.name()}.polyfilled.min.js", minimized)

  minimized = uglify.minify(adaptive, fromString: true).code
  fs.writeFileSync("pkg/#{project.name()}.js", adaptive)
  fs.writeFileSync("pkg/#{project.name()}.min.js", minimized)


task 'test', 'Run tests', ->
  invoke('build')
  fs.writeFileSync('test/adaptive.js', compile('test/adaptive.coffee'))


