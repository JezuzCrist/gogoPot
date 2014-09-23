build:
	coffee --compile --output server/js/ server/src/
	# coffee --compile --output js/ src/
build-watch:
	coffee -o server/js/ -cw server/src/
run:
	nodemon server/js/index.js