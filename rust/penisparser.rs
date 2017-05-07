use std::env;
use std::fs::File;
use std::io::Read;

fn main() {
    if let Some(arg1) = env::args().nth(1) {

        // reading into a string
        let mut contents = String::new();
        let mut file = File::open(&arg1).expect("opening the file failed");
        file.read_to_string(&mut contents).expect("reading the file failed");

        // printing 
        for line in contents.split("\n").collect::<Vec<&str>>() {
            for word in line.split(" ").collect::<Vec<&str>>() {
                if word.trim() != "" {
                    println!("penis")
                }
            }
        }
    }
    else {
        println!("pass a path to a file as an argument")
    }
}
