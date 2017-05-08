Memory usage throughout the program:

{
    0:              112 (p)
    1:              101 (e)
    2:              110 (n)
    3:              105 (i)
    4:              115 (s)
    5:              temp loop counter/character input/else flag
    6:              current whitespace flag
    7 through 13:   copies of character input
    14:             prior whitespace flag
}

>>>>>   Use slot five as temp loop counter
+++++ +++++ Loop ten times
[
    <<<<<
      +++++ +++++ + 110 after loop
    > +++++ +++++   100 after loop
    > +++++ +++++ + 110 after loop
    > +++++ +++++   100 after loop
    > +++++ +++++ + 110 after loop
    > -             0   after loop
]
< +++++ 's'
< +++++ 'i'
<       'n'
< +     'e'
< ++    'p'

>>>>> >>>>>  >>>> + Set prior whitespace flag to true

<<<<< <<<< ,    Move to slot 5 and read character
+               Increment by one to test for EOF (which is negative one)
[
    -   Decrement by one (return to original value)

    [   Copy input over to slots 7 through 13
        >> + > + > + > + > + > + > +
        <<<<<<<< -
    ]

    > ++++++    Initialize whitespace flag to six (the number of different whitespace characters)

    > ----- ----        Subtract nine from slot 7
    [   Slot 7 was not equal to nine
        < -         Decrement our whitespace flag
        > [-]       Reset slot 7
    ]
    > ----- -----       Subtract ten from slot 8
    [   Slot 8 was not equal to ten
        << -        Decrement our whitespace flag
        >> [-]      Reset slot 8
    ]
    > ----- ----- -     Subtract eleven from slot 9
    [   Slot 9 was not equal to eleven
        <<< -       Decrement our whitespace flag
        >>> [-]     Reset slot 9
    ]
    > ----- ----- --    Subtract twelve from slot 10
    [   Slot 10 was not equal to twelve
        <<<< -      Decrement our whitespace flag
        >>>> [-]    Reset slot 10
    ]
    > ----- ----- ---   Subtract thirteen from slot 11
    [   Slot 11 was not equal to thirteen
        <<<<< -     Decrement our whitespace flag
        >>>>> [-]   Reset slot 11
    ]
    > ----- -----  ----- -----  ----- -----  -- Subtract thirty two from slot 12
    [   Slot 12 was not equal to thirty two
        <<<<<< -    Decrement our whitespace flag
        >>>>>> [-]  Reset slot 12
    ]

    <<<<< << +  Set our else flag to true
    >           Go to our whitespace flag
    [   Whitespace flag was true
        >>>>> >> .      Print out the last untarnished copy of the input character
        > [-] +         Set prior whitespace flag to true
        <<<<< <<<< -    Set our else flag to false
        > - Go back to whitespace flag and reset it
    ]
    <           Go to our else flag
    [   Else flag was true
        >>>>> >>>>  Go to prior whitespace flag
        [   Prior whitespace flag was true
            <<<<< <<<<<  <<<<   Go to slot 0 (start of penis)
            . > . > . > . > .   Print penis
            >>>>> >>>>> -       Go back to prior whitespace flag and set to false
        ]
        <<<<< <<<< -    Go back to else flag and reset it
    ]

    >>>>> >>> [-] <<<<< <<< Reset final copy of input character

    ,   Read another character
    +   Increment to check for EOF
]
