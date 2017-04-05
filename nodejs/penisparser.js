var fs = require("fs")

try {
	fs.readFile(process.argv[2], function (err, data) {
		if (err)
			return console.log(err)

		var lines = data.toString().split('\n')
		lines.forEach(function(line, i, oldLines) {
			var words = line.split(' ')
			words.forEach(function(word, i, oldWords) {
				if (word == '') return
				oldWords[i] = 'penis'
			})
			oldLines[i] = words.join(' ')
		})
		console.log(lines.join('\n'))
	})
} catch (e) {
	console.log("\nYou did it wrong!\nUsage:\n  node penisparser.js <inputfile>\n")
}
