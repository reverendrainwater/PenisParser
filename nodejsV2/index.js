const http = require("http");
const fs = require("fs");
const querystring = require('querystring');
const fetch = require('node-fetch');

const url = "http://www.transltr.org";
const allLanguagesUrl = "api/getlanguagesfortranslate";
const translateUrl = "api/translate";
const baseCode = "en";
const word ="penis";

const languagesPath = "./languages.json"
const cachePath = "./cache.json";

let data = "";
let cache = [];
let path = process.argv[2];
if (path === undefined) {
	console.log("no file passed");
	process.exit();
}

function getLanguages() {
	fs.exists(languagesPath, (exists) => {
		if (!exists) {
			console.log("Initializing cache...");
			pipeLanguagesToFile();
		} else {
			getCache();
		}
	})
}

function pipeLanguagesToFile() {
	console.log("Getting Languages...");
	fs.writeFile(languagesPath, "", err => {
		if (err) {
			throw err;
		}
		let file = fs.createWriteStream(languagesPath);
		let req = http.get(url + "/" + allLanguagesUrl, res => {
			res.pipe(file).on('finish', () => {
				setCache();
			})
		})
	})
}

function setCache() {
	fs.readFile(languagesPath, 'utf8', (err, data) => {
		if (err) {
			throw err;
		}
		let json = JSON.parse(data);
		let tasks = 0;
		let results = [];
		json.forEach((obj) => {
			let body = {
				"from":baseCode,
				"to":obj.languageCode,
				"text":word
			}
			makeRequests(body, (data) => {
				results.push(data);
				tasks++;
				if (tasks == json.length) {
					writeCache(results);
				}
			});
		})
	})
}

function makeRequests(body, next) {
	fetch(url + "/" + translateUrl, {
		method: "post",
    body: JSON.stringify(body),
    headers: {
      'Accept': 'application/json',
      'Content-Type': 'application/json'
    }
	})
	.then(res => {
		return res.json();
	})
	.then(json => {
		next(json);
	})
}

function writeCache(results) {
	let data = JSON.stringify(results);
	fs.writeFile('cache.txt', data, 'utf8', (err) => {
		if (err) {
			throw err;
		}
		console.log("Cache Initialized.");
		getCache();
	})
}

function getCache() {
	fs.readFile(cachePath, 'utf8', (err, data) => {
		if (err) {
			throw err;
		}
		let json = JSON.parse(data);
		cache = json;
		changeFile();
	})
}

function changeFile() {
	console.log("Reading File...");
	let newText = "";
	fs.readFile(path, 'utf8', (err, data) => {
		let text = data;
		let lines = data.split('\n');
		for (let i = 0; i < lines.length; i++) {
			let words = lines[i].split(" ");
			for (let j = 0; j < words.length; j++) {
				newText += getRandomPenis() + " ";
			}
			newText += "\n"
		}
		rewriteFile(newText);
	})
}

function rewriteFile(text) {
	console.log("Penisfying File...");
	let newpath = path.split(".txt")[0] + "_penisified.txt";

	fs.writeFile(newpath, text, 'utf8', err => {
		if (err) {
			throw err;
		}
		console.log("Penisfied");
		console.log("Here is your new file...");
		setTimeout(function () {
			console.log("Thanks for using PenisParser[JS]!");
		}, 500);
	})
}

function getRandomPenis() {
	let length = cache.length;
	let index = Math.floor(Math.random() * cache.length);
	let translation = cache[index].translationText;
	return translation
}

getLanguages();
