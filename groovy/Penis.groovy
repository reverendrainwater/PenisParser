if (this.args.length < 1) {
    println("filename pls")
    return
}

file = new File(this.args[0])

if (!file.exists()) {
    println("real filename pls")
    return
}

file.text = file.text.replaceAll "\\S+", "penis"
