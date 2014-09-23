express = require('express')
fs = require('fs')
bcrypt = require 'bcrypt-nodejs'
cookieParser = require 'cookie-parser'
session = require 'express-session'
# request = require('request')
app     = express()
router = express.Router()

# bcrypt.hashSync("bacon")
serverPassword = "$2a$10$VzR1yyM7JRgTXMP3MXGSTOf/oQ8kBWHG3HSj5XytBQYr39.UE2etC"

app.use(cookieParser())
app.use(session({secret:'whatIsThis?'}))


# router.use((req,res,next)->
# 	if req.session.varified?
# 		res.send "yummyummy picture"
# 		console.log req.originalUrl
# 	else
# 		res.send "sahar vald this is just work"
# )

app.get('/verify', (req, res)->
	console.log "mekmek"
	req.session.varified = true
	res.send "hacked"
)
app.get('/',(req,res)->
	res.redirect('/client/index.html')
)
app.use('/client',(req,res)->
	console.log "mekmek"

	if req.session.varified == true
		console.log req.originalUrl.replace("/client/","")
		requestedFile = req.originalUrl.replace("/client/","")
		options = 
			root: (__dirname.replace("server/js","") + "client")

		res.sendFile(requestedFile,options,(err)->
			if err
				console.log err
			else
				console.log "sent"
				
			
		)
	else
		req.session.varified = false
		res.redirect('/loginPage')
)

app.use("/loginPage",express.static(__dirname.replace("server/js","") + "loginPage"))


app.listen('5555')
console.log('Magic happens on port 5555')



# bcrypt.compare("nissim",serverPassword,(err,result)->
# 	console.log result
# )

# bcrypt.compare("lior",serverPassword,(err,result)->
# 	console.log result
# )
