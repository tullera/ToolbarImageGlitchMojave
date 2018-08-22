//
//  ToolbarImageGlitchAppDelegate.m
//  ToolbarImageGlitch
//
//  Created by Aaron Tuller on 8/22/18.
//  Copyright 2018 __MyCompanyName__. All rights reserved.
//

#import "ToolbarImageGlitchAppDelegate.h"

static NSString * const	DashboardToolbarIdentifier 		= @"Dashboard Toolbar Identifier";
static NSString * const	ChoosePrinterDashboardToolbarItemIdentifier = @"Choose Printer Dashboard Item Identifier";
static NSString * const	WebStoreToolbarItemIdentifier = @"WebStoreToolbarItemIdentifier";


@implementation ToolbarImageGlitchAppDelegate

@synthesize window;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
	[self setupToolbar];
}

-(IBAction)showWebStores:(id)sender
{
	// no op
}

- (void) setupToolbar {
    // Create a new toolbar instance, and attach it to our document window
    NSToolbar *toolbar = nil;
	
	toolbar = [[[NSToolbar alloc] initWithIdentifier: DashboardToolbarIdentifier] autorelease];
	
	[toolbar setAllowsUserCustomization: YES];
    [toolbar setAutosavesConfiguration: YES];
	
    [toolbar setDisplayMode: NSToolbarDisplayModeIconAndLabel];
	
	// We are the delegate
    [toolbar setDelegate: self];
	
	[self.window setToolbar: toolbar];
}

- (NSToolbarItem *) toolbar: (NSToolbar *)toolbar itemForItemIdentifier: (NSString *) itemIdent willBeInsertedIntoToolbar:(BOOL) willBeInserted {

	NSToolbarItem *toolbarItem = [[[NSToolbarItem alloc] initWithItemIdentifier: itemIdent] autorelease];
	
	if ([itemIdent isEqual: ChoosePrinterDashboardToolbarItemIdentifier]) { 
        [toolbarItem setLabel: @"Printer Setup"];
        [toolbarItem setPaletteLabel:@"Printer Setup"];       
        [toolbarItem setToolTip: @"Setup the type of printer you'll be using."];
        [toolbarItem setImage: [NSImage imageNamed: NSImageNameAdvanced]];
        
        //need action stuff here.
        [toolbarItem setEnabled: YES];
        [toolbarItem setTarget: nil];
        [toolbarItem setAction: @selector(showWebStores:)];
	} else if ([itemIdent isEqual: WebStoreToolbarItemIdentifier]) { 
		[toolbarItem setLabel: @"Web Stores"];
		[toolbarItem setPaletteLabel: @"Web Stores"];       
		[toolbarItem setToolTip: @"View orders from your web stores."];
		NSButton *button = [[[NSButton alloc] initWithFrame:NSMakeRect(0,0,32,32)] autorelease];
		[button setBordered:NO];
		[button setButtonType:NSMomentaryChangeButton];
		[button setImage:[NSImage imageNamed: @"buysupplies-nobrand"]];
		[toolbarItem setView: button];
		
		//need action stuff here.
		[toolbarItem setEnabled: YES];
		[toolbarItem setTarget: nil];
		[toolbarItem setAction: @selector(showWebStores:)];
	} else {
		// itemIdent refered to a toolbar item that is not provide or supported by us or cocoa 
		// Returning nil will inform the toolbar this kind of item is not supported 
		toolbarItem = nil;
    }
    return toolbarItem;
}

- (NSArray *) toolbarDefaultItemIdentifiers: (NSToolbar *) toolbar {
    // Required delegate method:  Returns the ordered list of items to be shown in the toolbar by default    
    // If during the toolbar's initialization, no overriding values are found in the user defaults, or if the
    // user chooses to revert to the default items this set will be used
	NSArray *itemArray = [NSArray arrayWithObjects:
						  ChoosePrinterDashboardToolbarItemIdentifier, WebStoreToolbarItemIdentifier,
						  NSToolbarCustomizeToolbarItemIdentifier,
						  NSToolbarFlexibleSpaceItemIdentifier, NSToolbarSpaceItemIdentifier, NSToolbarSeparatorItemIdentifier,
						  nil];
	
	return itemArray;
}

- (NSArray *) toolbarAllowedItemIdentifiers: (NSToolbar *) toolbar {
    // Required delegate method:  Returns the list of all allowed items by identifier.  By default, the toolbar 
    // does not assume any items are allowed, even the separator.  So, every allowed item must be explicitly listed   
    // The set of allowed items is used to construct the customization palette
	
	
		NSArray *itemArray = [NSArray arrayWithObjects:
							  ChoosePrinterDashboardToolbarItemIdentifier, WebStoreToolbarItemIdentifier,
							  NSToolbarCustomizeToolbarItemIdentifier,
							  NSToolbarFlexibleSpaceItemIdentifier, NSToolbarSpaceItemIdentifier, NSToolbarSeparatorItemIdentifier,
							  nil];
		
		return itemArray;
}

- (BOOL) validateToolbarItem: (NSToolbarItem *) toolbarItem {
	return YES;
}


@end
