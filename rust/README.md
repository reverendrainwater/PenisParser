# RustyPenis

This implementation of penisparser writen in rust can recognize "words" separated by spaces, tabs and newlines.

You can compile penisparser.rc by running `rustc ./penisparser.rs` and you will get a binary file just called penisparser. The rustc command is available after installing rust on your machine.

This binary file is already included, so it should be possible to test this without having to compile it yourself. To test it, just run:

```
$ ./penisparser textfile.txt
```

and it will print penis for every word in your original textfile.
