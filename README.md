# swift_keylogger
A simple keylogger in swift just for fun.

I just wanted to play with swift and the most interesting project I could think of, is a simple keylogger. 

## Some notes to remember for future use
I created it as a typical cocoa project on xcode. I copy-paste code from many places, but all the code is inside the 
[AppDelegate.swift](https://github.com/johndel/swift_keylogger/blob/master/test/AppDelegate.swift). It creates two txt files
where it stored the keystrokes. If you want to save the keystrokes in a different folder / file, change and re-compile it accordingly. 
It adds timestamp on the filename because I wanted them to be different everytime I am running it. 

It also hides the initial window and making an agent app (I've achieved this by adding `LSUIElement` to `info.plist` and by adding
this line `NSApplication.sharedApplication().windows.last!.close()`). You need to allow system priviledges to make it work
(it asks for permissions the first time you will run it) and if you want to stop it, the only way is by killing it (through the console, find the pid with `ps aux | grep "test"` and kill). 
I've added the binary to the root of the project.

This is my first attempt with swift and much of the code is copy/paste so I am not sure if it is the best way to do something.
I struggled to convert it and find code that works with the current swift version.
Nevertheless it works and it is pretty straightforward what it does. It doesn't catch the keys from password fields as NSEvent doesn't allow this.

Be warned next time you want to touch my laptop.

