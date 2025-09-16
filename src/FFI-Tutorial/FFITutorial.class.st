"
```
we put a shared variable called MagicNumber into FFITutorial instance side
even though MagicNumber is shared between classes
not a variable in an instance side ... huh ... 

Object class << FFITutorial class
	slots: {}
	
Object << #FFITutorial
	slots: {};
	sharedVariables: { #MagicNumber };
	package: 'FFI-Tutorial'
		

FFITutorial class >>  ticksSinceStart
	^ self ffiCall: #( ulong clock (  ) ) library: 'libc.so'
	
FFITutorial class >> time
	^ self ffiCall: #( ulong time (  ) ) library: 'libc.so'

FFITutorial class >> abs: n
	^ self ffiCall: #( int abs ( int n ) ) .

FFITutorial class >> initialize
 MagicNumber := -42	
	
``

book tries to generalise away difficulty finding 'libc.so' by replacing with MyLibC 
also mentions cairo so we made another one for that too
FFILibrary << MyLibC     
FFILibrary << MyLibCairo  

MyLibC >> macModuleName
MyLibC >> unixModuleName
MyLibC >> unix64ModuleName
MyLibC >> win32ModuleName
are outdated to be renamed by LibraryName
MyLibC >> macLibraryName
MyLibC >> unixLibraryName
MyLibC >> unix64LibraryName
MyLibC >> win32LibraryName


```
FFITutorial class ticksSinceStart.

```

```
^ self ffiCall: #( int time ( NULL ) ) library: '/usr/lib/x86_64-linux-gnu/libcairo.so'	
^ self ffiCall: #( ulong time ( NULL ) ) library: '/usr/lib/x86_64-linux-gnu/libcairo.so'	

```

Changelog
Created Package FFI-Tutorial class FFITutorial
Created Package Unified-FFI-Libraries class MyLibC
any hypen(s) in class name may confuse smalltalk

1 - inserted new FFITutorial new ticksSinceStart.
2 - changed 


```
f := FFITutorial new.
f ticksSinceStart.
#(f time . f time2). 
{ f time . f time2  }. 
```

""
See Classses defined in Unified-FFI-Libraries package with this XXX
defined two new classes MyLibC and MyLibCairo that 


note about using shared pools - google book  { pharo by example 8.0 }


SharedPool subclass: #FFITutorialPool
...
classVariableNames: 'MagicNumber'
...
FFITutorialPool class >> initialize [
""Set this to -42 because.. Life, the Universe, and Everything.""
MagicNumber := -42.
]
Object subclass: #FFITutorial
...
poolDictionaries: 'FFITutorialPool'
...
FFITutorial class >> absMinusFortyTwo [
^ self ffiCall: #( int abs ( int MagicNumber ) )
]
Using a shared pool does not change the normal Pharo usage of uFFI. If you
want to learn more about Pharo shared pools, we recommend you take a look
at Pharo by Example 8.0.

""




"
Class {
	#name : 'FFITutorial',
	#superclass : 'Object',
	#classVars : [
		'MagicNumber'
	],
	#category : 'FFI-Tutorial',
	#package : 'FFI-Tutorial'
}

{ #category : 'as yet unclassified' }
FFITutorial class >> abs: n [
"call c procedure - through indirection MyLibC which is defined under Unified-FFI-Libraries package ... huh"
	"^ self ffiCall: #( uint time ( NULL ) ) library: MyLibC"
 "	^ self ffiCall: #( ulong time ( NULL ) ) library: '/usr/lib/x86_64-linux-gnu/libc.so'"
	" ^ self ffiCall: #( ulong time ( NULL ) ) library: self myLibrary ."
	^ self ffiCall: #( int abs ( int n ) ) .
	


	
]

{ #category : 'as yet unclassified' }
FFITutorial class >> absMinusFortyTwo [

^ self ffiCall: #( int abs ( int MagicNumber) )
"the meaning of life and everything"


	
]

{ #category : 'as yet unclassified' }
FFITutorial class >> ffiLibrary [
 ^ MyLibC . 


	
]

{ #category : 'as yet unclassified' }
FFITutorial class >> initialize [ 
"the meaning of life and everything"
 MagicNumber := -42 . 


	
]

{ #category : 'as yet unclassified' }
FFITutorial class >> minusFortyTwo [
^ MagicNumber

	
]

{ #category : 'as yet unclassified' }
FFITutorial class >> ticksSinceStart [
"call c procedure - through indirection MyLibC which is defined under Unified-FFI-Libraries package ... huh"
"MyLibC defined in class MyLibC package Unified-FFI-Libraries , no idea why"
"on unix32 bit - MyLibC unixLibraryName "
"on unix64 bit - MyLibC unix64LibraryName "
"on mac  - MyLibC calls macLibraryName "
"on win32 bit - MyLibC calls win32LibraryName ? or should it be win64 ? "
"	^ self ffiCall: #( ulong clock (  ) ) library: self myLibrary"
	^ self ffiCall: #( ulong clock (  ) ) 
	

]

{ #category : 'as yet unclassified' }
FFITutorial class >> ticksSinceStartLinux [
	"call c clock procedure"

	| aFFITutorial |
	aFFITutorial := self new.

	^ aFFITutorial ffiCall: #( uint clock #(  ) ) library: 'libc.so.6'
]

{ #category : 'as yet unclassified' }
FFITutorial class >> ticksSinceStartMac [
	"call c clock procedure"

	| aFFITutorial |
	aFFITutorial := self new.

	^ aFFITutorial ffiCall: #( uint clock #(  ) ) library: 'libc.dylib'
]

{ #category : 'as yet unclassified' }
FFITutorial class >> ticksSinceStartWindows [
	"call c clock procedure"

	| aFFITutorial |
	aFFITutorial := self new.

	^ aFFITutorial ffiCall: #( uint clock #(  ) ) library: 'msvcrt.dll'
]

{ #category : 'as yet unclassified' }
FFITutorial class >> time [
"call c procedure - through indirection MyLibC which is defined under Unified-FFI-Libraries package ... huh"
	"^ self ffiCall: #( uint time ( NULL ) ) library: MyLibC"
 "	^ self ffiCall: #( ulong time ( NULL ) ) library: '/usr/lib/x86_64-linux-gnu/libc.so'"
	" ^ self ffiCall: #( ulong time ( NULL ) ) library: self myLibrary ."
	^ self ffiCall: #( ulong time ( NULL ) ) .
	


	
]

{ #category : 'as yet unclassified' }
FFITutorial class >> time2 [
	"call c procedure - through indirection MyLibC which is defined under Unified-FFI-Libraries package ... huh"

	"^ self ffiCall: #( uint time ( NULL ) ) library: MyLibC"

	"strangely if cairo library installed it also has time defined there also "

	| aFFITutorial |
	aFFITutorial := self new.

	^ aFFITutorial ffiCall: #( uint time #( NULL ) ) library: '/usr/lib/x86_64-linux-gnu/libcairo.so'
]
