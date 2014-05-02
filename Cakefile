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

  matchMedia  = readFile('./bower_components/matchMedia/matchMedia.js')
  compiled    = matchMedia + compile('./lib/adaptive-evil-blocks.coffee')
  minimized   = uglify.minify(compiled, fromString: true).code

  fs.writeFileSync("pkg/#{project.name()}-#{project.version()}.js", compiled)
  fs.writeFileSync("pkg/#{project.name()}-#{project.version()}.min.js", minimized)


task 'test', 'Run tests', ->
  invoke('build')
  fs.writeFileSync('test/adaptive.js', compile('test/adaptive.coffee'))


