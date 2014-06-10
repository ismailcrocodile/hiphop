# for node-webkit builds only
try
	# Load native UI library
	gui = require('nw.gui')

	# Get window object (!= $(window))
	win = gui.Window.get()

	# Debug flag
	isDebug = gui.App.argv.indexOf('--debug') > -1

	# Set the app title (for Windows mostly)
	win.title = gui.App.manifest.name + ' ' + gui.App.manifest.version

	# Focus the window when the app opens
	win.focus()

	# Cancel all new windows (Middle clicks / New Tab)
	win.on "new-win-policy", (frame, url, policy) ->
	    policy.ignore()

	# Prevent dragging/dropping files into/outside the window
	preventDefault = (e) ->
	    e.preventDefault()
	window.addEventListener "dragover", preventDefault, false
	window.addEventListener "drop", preventDefault, false
	window.addEventListener "dragstart", preventDefault, false


#####################################################################

hiphop = angular.module("hiphop", [])
