#!usr/bin/python

def penis():
    filename = raw_input("file name?: ")
    penis = ""

    with open(filename) as f:
        for line in f:
            for word in line.split():
                if len(word) <= len(penis):
                    penis = "penis"
                else:
                    length = len(word) - 5
                    penis = "pe"
                    for penis in length:
                        penis = penis + "e"
                    penis = penis + "nis"
                
                print line.replace(str(word, penis) 
penis()


