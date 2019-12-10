express = require 'express'
fs = require 'fs'
config = require './config'

app = express()
app.set 'view engine', 'pug'
app.set 'views', '.'

randomChoice = (l) -> l[Math.floor Math.random() * l.length]

EMOJIS_FILENAME = process.env.EMOJIS_FILENAME or 'emojis.txt'

emojis = fs.readFileSync(EMOJIS_FILENAME, 'utf8').trim().split('\n')

app.get '/', (req, res) ->
    res.render 'index', {emoji: randomChoice emojis}

app.use express.static '.'

app.listen config.port, -> console.log "Listening on :#{config.port}"
