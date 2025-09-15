Class {
	#name : 'MyLibC',
	#superclass : 'FFILibrary',
	#category : 'Unified-FFI-Libraries',
	#package : 'Unified-FFI-Libraries'
}

{ #category : 'as yet unclassified' }
MyLibC >> macLibraryName [
^ 'libc.dylib'
]

{ #category : 'as yet unclassified' }
MyLibC >> unixLibraryName [
^ 'libc.so.6'
]

{ #category : 'as yet unclassified' }
MyLibC >> win32LibraryName [
"While not poroper libc MSVCRT has the functions we need here"
^ 'mscvcrt.dll'


]
