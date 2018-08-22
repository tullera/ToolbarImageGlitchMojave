//
//  ToolbarImageGlitchAppDelegate.h
//  ToolbarImageGlitch
//
//  Created by Aaron Tuller on 8/22/18.
//  Copyright 2018 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface ToolbarImageGlitchAppDelegate : NSObject <NSApplicationDelegate, NSToolbarDelegate> {
    NSWindow *window;
}

@property (assign) IBOutlet NSWindow *window;

- (void) setupToolbar;

@end
