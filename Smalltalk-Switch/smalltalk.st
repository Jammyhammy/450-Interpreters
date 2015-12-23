Object subclass: Switch [
  | cases |
   init [
         cases := Dictionary new.
       ]      
]

Switch class extend [
    new [
        | s |
        s := super new.
        s init.
        ^s
    ]
    addCase: argTestBlock then: execBlock [
        |c|  
        c := cases
        c at: argTestBlock put: execBlock  
  ]    
]

a := Switch new


Switch class extend [
  init [
         cases := Dictionary new.
       ]
]      

Switch class extend [
  new [ 
  ^ (super new init) 
  ]

]

Object subclass: Switch [ 
  | myCases |  
    
    new [ 
      |s|
      s := super new.
      s init
      ^ s
    ]

]

    init [ 
      myCases := Dictionary new.
    ]

]

  addCase: aCase execBlock: aBlock [
    myCases at: aCase put: aBlock.
    ].




st> Switch new get
  addTwo:first another:second [
            ^first + second
    ]
   doCase :label :block [ 
              c := [cases] at: [label] put: [block].
          ^c ]
For switches, if it literally sees a break, then exit out of code. Do switch code until break symbol is encountered. If there is default case, it jumps there if theres nothing. Fallthru because it is just jumping to a label.

        writeCheck: amount [
            <category: 'spending'>
            | num |
            "Sanity check that we have checks left in our checkbook"
            (checksleft < 1)
                ifTrue: [ ^self error: 'Out of checks' ].
            "Make sure we've never used this check number before"
            num := checknum.
            (history includesKey: num)
                ifTrue: [ ^self error: 'Duplicate check number' ].
            "Record the check number and amount"
            history at: num put: amount.
            "Update our next checknumber, checks left, and balance"
            checknum := checknum + 1.
            checksleft := checksleft - 1.
            self spend: amount.
            ^ num
        ]
         printChecks [
             history keysAndValuesDo: [ :key :value |
                 key print.
                 ' - ' print.
                 value printNl.
             ]
         ]
     ]
