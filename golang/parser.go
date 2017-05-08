package main

import (
	"fmt"
	"io/ioutil"
	"log"
	"os"
	"regexp"
)

func main() {
	file, err := ioutil.ReadFile(os.Args[1])
	handleErr(err)

	//i wanted to keep punctuation but ' does weird stuff
	gexd, err := regexp.Compile(`(\w+)`)
	handleErr(err)

	strContent := string(file)
	strContent = gexd.ReplaceAllString(strContent, "penis")

	fmt.Println(strContent)
}

func handleErr(err error) {
	if err != nil {
		log.Fatal(err)
	}
}
