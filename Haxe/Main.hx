import sys.io.File;
import sys.FileSystem;

class Main {

    static var filePath : String = "";
    static var fileContent : String = "";

    public static function main() {
        
        getFilePath();
        checkfilePath();
        output(replaceWords());

    }

    static function getFilePath() {
        filePath = Sys.args()[0];
    }

    static function checkfilePath() {
        if(FileSystem.exists(filePath)) {
            fileContent = File.getContent(filePath);
        } else {
            throw "File not found";
        }
    }

    static function replaceWords() : String {
        var lines : Array<String> = fileContent.split("\n");
        var out : String = "";

        for(line in lines) {
            for(word in line.split(" ")) {
                if(word.length > 0) {
                    out += "penis ";
                }
            }
            out += "\n";
        }

        return out;
    }

    static function output(input : String) {
        Sys.stdout().writeString(input);
    }

}