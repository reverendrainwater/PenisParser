(let [filename (first *command-line-args*)]
    (if (nil? filename)
        (println "feed me a file")
        (let [file (clojure.java.io/as-file filename)]
            (if (not (.exists file))
                (println "feed me a real file")
                (let [text (slurp file)]
                    (spit file
                        (clojure.string/replace text #"\S+" "penis")
                    )
                )
            )
        )
    )
)
