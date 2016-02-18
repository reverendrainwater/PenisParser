OBTW Program to replace all words with "penis" at the behest of @ZhengC1 (github.com/zhengc1)

Please note: LOLCODE is (surprise, surprise) not the most robust language.  Since this
was a simple task, I just use every space as counter and then write the word that many
times, so this is not a true replace.  All LOLCODE supports for file IO is a buffer 
specification

Author: WamboJambo (jamesnc.me and github.com/WamboJambo)
TLDR

HAI 1.3
        
        CAN HAS STDIO?
        VISIBLE "File name to open?"
        I HAS A NAME
        GIMMEH NAME

        BTW catch empty string, as would cause a seg fault
        BOTH SAEM NAME AN ""
        O RLY?
                YA RLY, NAME R "text.txt" BTW default to "text.txt"
        OIC

        I HAS A MODE ITZ "r" BTW specify r mode for file reading
        I HAS A FILE ITZ I IZ STDIO'Z OPEN YR NAME AN YR MODE MKAY BTW file to read/write from
        I HAS A BUFR ITZ 1 BTW buffer value, or how many characters to read from file
        
        BOTH SAEM WIN AN I IZ STDIO'Z DIAF YR FILE MKAY
        O RLY?
          YA RLY, VISIBLE "Invalid file! Please check your spelling." BTW display error
          NO WAI
                I HAS A TXT ITZ I IZ STDIO'Z LUK YR FILE AN YR BUFR MKAY BTW characters read in from file, as a YARN

                I HAS A CND ITZ FAIL

                I HAS A TEMP ITZ 1
                I HAS A DUBZ
                
                IM IN YR FACE UPPIN YR TEMP TIL BOTH SAEM CND AN WIN

                        VISIBLE TXT                        
                        TXT R I IZ STDIO'Z LUK YR FILE AN YR BUFR MKAY
                        BOTH SAEM TXT AN " "
                          O RLY?
                              YA RLY
                                  I HAS A OUTFILE ITZ I IZ STDIO'Z OPEN YR "out.txt" AN YR "a" MKAY
                                  I IZ STDIO'Z SCRIBBEL YR OUTFILE AN YR "penis " MKAY BTW write "penis" to outfile
                          OIC

                        BOTH SAEM TXT AN ""  BTW somehow detects EOF, I don't understand but I'll take it!
                          O RLY?
                              YA RLY
                                  CND R WIN
                                  GTFO
                          OIC

                IM OUTTA YR FACE

                VISIBLE TXT

                I IZ STDIO'Z CLOSE YR FILE MKAY BTW close file, we're finished reading from it

        OIC



KTHXBYE