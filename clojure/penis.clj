(let [filename (first *command-line-args*)]
    (if (nil? filename)
        (println "feed me a file")
        (let [text (slurp filename)]
            (spit filename
                (clojure.string/replace text #"[a-zA-Z0-9]+" "penis")
            )
        )
    )
)
