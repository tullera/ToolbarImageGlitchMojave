# ToolbarImageGlitchMojave
sample project for toolbar not drawing correctly when built with 10.6 SDK on Mojave

Our existing release version is built with Xcode 3.2.6 using the 10.6 SDK. I noticed a drawing glitch in the toolbar in Mojave (18A371a) when using the existing release binary. I whittled it down to this reproducible project which builds with both Xcode 3.2.6 and Xcode 10.

Here is our toolbar item (a simple NSButton with an image set) not faded correctly, this screenshot is from the 10.6 build:\
![10.6 background](build%20with%2010.6%20SDK%20background.png)

Here it is correct from the 10.14 build of the same source:\
![10.14 background](build%20with%2010.14%20SDK%20background.png)

There's another glitch with the separator line when the window is active. When built with 10.6:\
![10.6 forground](build%20with%2010.6%20SDK%20foreground.png)

vs 10.14 SDK, again, same exact project:\
![10.14 forground](build%20with%2010.14%20SDK%20foreground.png)
