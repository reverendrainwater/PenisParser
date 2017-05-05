if (this.args.length < 1) {
    println("filename pls")
    return
}

file = new File(this.args[0])

file.text = file.text.replaceAll "[a-zA-Z0-9]+", "penis"
