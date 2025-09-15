Class {
	#name : 'MyLibCairo',
	#superclass : 'FFILibrary',
	#category : 'Unified-FFI-Libraries',
	#package : 'Unified-FFI-Libraries'
}

{ #category : 'as yet unclassified' }
MyLibCairo >> macLibraryName [
^ 'libcairo.dylib'
]

{ #category : 'as yet unclassified' }
MyLibCairo >> unix64LibraryName [
"On different flavors of Linux, the path to the library may
differ, depending on the distro and whether the system is 32- or
64-bit."
#('/usr/lib/x86_64-linux-gnu/libcairo.so' ) do: [ :path |
path asFileReference exists ifTrue: [ ^ path ] ].
self error: 'Cannot locate Cairo library. Please check that it is installed on your system.'


]

{ #category : 'as yet unclassified' }
MyLibCairo >> unixLibraryName [
^ 'libcairo.so'
]

{ #category : 'as yet unclassified' }
MyLibCairo >> win32LibraryName [
"While not poroper libc MSVCRT has the functions we need here"
^ self error: 'do not know name of windows library for cairo' .


]
