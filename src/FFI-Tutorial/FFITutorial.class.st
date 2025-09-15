Class {
	#name : 'FFITutorial',
	#superclass : 'Object',
	#category : 'FFI-Tutorial',
	#package : 'FFI-Tutorial'
}

{ #category : 'as yet unclassified' }
FFITutorial >> ticksSinceStart [ 
"call c clock procedure"
"^ self ffiCall: #( uint clock() ) library: 'libc.so.6'"
^ self ffiCall: #( uint clock() ) library: MyLibC





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
