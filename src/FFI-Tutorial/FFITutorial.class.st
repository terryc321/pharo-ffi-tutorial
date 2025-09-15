"
```
FFITutorial new ticksSinceStart. #( ""63033001"")
```


Changelog
Created Package FFI-Tutorial class FFITutorial
Created Package Unified-FFI-Libraries class MyLibC
any hypen(s) in class name may confuse smalltalk



1 - inserted new FFITutorial new ticksSinceStart.
2 - changed 


"
Class {
	#name : 'FFITutorial',
	#superclass : 'Object',
	#category : 'FFI-Tutorial',
	#package : 'FFI-Tutorial'
}

{ #category : 'as yet unclassified' }
FFITutorial >> ticksSinceStart [
"call c procedure - through indirection MyLibC which is defined under Unified-FFI-Libraries package ... huh"
	^ self ffiCall: #( #uint #clock #(  ) ) library: MyLibC
	
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
