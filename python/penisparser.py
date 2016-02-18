#!usr/bin/python

def penis():
    filename = raw_input("file name?: ")


    with open(filename) as f:
        for line in f:
            for word in line.split():
                print line.replace(str(word), "penis") 
penis()


