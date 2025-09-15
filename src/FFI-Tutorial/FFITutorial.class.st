"
FFITutorial >>  ticksSinceStart
	^ self ffiCall: #( ulong clock (  ) ) library: 'libc.so'
	
FFITutorial >> time
	^ self ffiCall: #( ulong time (  ) ) library: 'libc.so'

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
FFITutorial ticksSinceStart.
FFITutorial new ticksSinceStart.
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

See Classses defined in Unified-FFI-Libraries package with this XXX
defined two new classes MyLibC and MyLibCairo that 





"
Class {
	#name : 'FFITutorial',
	#superclass : 'Object',
	#category : 'FFI-Tutorial',
	#package : 'FFI-Tutorial'
}

{ #category : 'as yet unclassified' }
FFITutorial >> ffiLibrary [
"over-riding a default method in FFILibrary class ? inside FFITutorial class ?? ... "
"^ self error: ('you tried running default FFI Library version not implemented yet')"
"over-riding default method ffiCall: "
^ MyLibC 	
	


	
]

{ #category : 'as yet unclassified' }
FFITutorial >> myLibrary [
"over-riding a default method in FFILibrary class ? inside FFITutorial class ?? ... "
^ MyLibC 
	
	


	
]

{ #category : 'as yet unclassified' }
FFITutorial >> ticksSinceStart [
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
FFITutorial >> ticksSinceStartLinux [ 
"call c clock procedure"
^ self ffiCall: #( uint clock() ) library: 'libc.so.6'




]

{ #category : 'as yet unclassified' }
FFITutorial >> ticksSinceStartMac [ 
"call c clock procedure"
^ self ffiCall: #( uint clock() ) library: 'libc.dylib'




]

{ #category : 'as yet unclassified' }
FFITutorial >> ticksSinceStartWindows [ 
"call c clock procedure"
^ self ffiCall: #( uint clock() ) library: 'msvcrt.dll'




]

{ #category : 'as yet unclassified' }
FFITutorial >> time [
"call c procedure - through indirection MyLibC which is defined under Unified-FFI-Libraries package ... huh"
	"^ self ffiCall: #( uint time ( NULL ) ) library: MyLibC"
 "	^ self ffiCall: #( ulong time ( NULL ) ) library: '/usr/lib/x86_64-linux-gnu/libc.so'"
	" ^ self ffiCall: #( ulong time ( NULL ) ) library: self myLibrary ."
	^ self ffiCall: #( ulong time ( NULL ) ) .
	


	
]

{ #category : 'as yet unclassified' }
FFITutorial >> time2 [
"call c procedure - through indirection MyLibC which is defined under Unified-FFI-Libraries package ... huh"
	"^ self ffiCall: #( uint time ( NULL ) ) library: MyLibC"
	 "strangely if cairo library installed it also has time defined there also "
	^ self ffiCall: #( uint time ( NULL ) ) library: '/usr/lib/x86_64-linux-gnu/libcairo.so'.
	
	


	
]
