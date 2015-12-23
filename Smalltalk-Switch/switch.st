Object subclass: Switch [
  | cases indices i breaks |
  init [ "Initializes the switch object with a dictionary."
         cases := Dictionary new.
         breaks := Dictionary new.
	 indices := Array new: 100.
         cases at: 1 put: 'No default case specified.'.
         indices at: 1 put: 1.
         i := 2
]

  adddefault: a [
    cases at: 1 put: a
    "add in method for break"
  ]
  addcase: a ablock: b [
    cases at: a put: b.
    breaks at: a put: false.
    i := i + 1
  ]
  addcase: a ablock: b abreak: c [
    cases at: a put: b.
    (c = 'break') ifTrue: [ breaks at: a put: true ]
    ifFalse: [ breaks at: a put: false ]
  ]
  
  docase:lbl [
    (breaks at: lbl) whileFalse:[
    (cases includesKey: lbl) 
       ifFalse: [^cases at: 1]
       ifTrue: [ cases value: (cases at: lbl) ]
  ]
  ifTrue:[ ^'break' ]
]
  defaultcase [ ^cases at: 1 ]
  getcases [ ^cases ]
  getindices [ ^indices ]
  geti [ ^i ]
]

Switch class extend [
  new [ ^ (super new init) ]
]

a := Switch new



    ^cases at: lbl ifAbsent: self defaultcase

  addcase: a ablock: b abreak: c [
    cases at: a put: b.
(c = 'break') ifTrue: [ breaks at: a put: true ]
ifFalse: [ breaks at: a put: false ]
    breaks at: a put: true.
  ]
  
  docase:lbl [
    (breaks at: lbl) ifTrue: [
        case := aCase.
        (val includesKey: aCase) ifTrue: [
                 ^val at: case ] ifFalse: [
                 ^default ]
    ] ifFalse [
       val do 'something'
  ]
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

http://www.jarober.com/blog/blogView?showComments=true&printTitle=ST_4U_200:_A_Case_Statement_in_Smalltalk&entry=3507965964
https://www.google.com/search?q=ST+4u+case+&ie=utf-8&oe=utf-8&aq=t&rls=org.mozilla:en-US:official&client=firefox-a&channel=sb#rls=org.mozilla:en-US:official&channel=sb&q=ST+4u+case+smalltalk
https://www.gnu.org/software/smalltalk/manual/html_node/Moving-money-around.html#Moving-money-around
http://c2.com/cgi/wiki?SmalltalkCaseStatement
https://www.google.com/search?client=opera&rls=en&q=c2+smalltalk+switch+case&sourceid=opera&ie=utf-8&oe=utf-8&channel=suggest&gws_rd=ssl
