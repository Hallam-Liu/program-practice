//
//  AppDelegate.m
//  scarybug
//
//  Created by macbook on 17/2/10.
//  Copyright © 2017年 macbook. All rights reserved.
//

#import "AppDelegate.h"
#include "MasterViewcontroller.h"
#import "ScaryBugDoc.h"
@interface AppDelegate ()
@property (nonatomic,strong) IBOutlet MasterViewcontroller *masterViewController;
@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    // 1. Create the master View Controller
    self.masterViewController = [[MasterViewcontroller alloc] initWithNibName:@"MasterViewcontroller" bundle:nil];
    //OSX中的窗口（NSWindow类）被创建的时候总是包含一个默认的view，叫做contentView，它自动根据窗口的尺寸调整自身大小。假如你
    //要将自己的view添加到窗口上，你总是需要使用sddSubview方法将它添加到contentView上面。
    
    // Setup sample data
    ScaryBugDoc *bug1 = [[ScaryBugDoc alloc] initWithTitle:@"Potato Bug" rating:4 thumbImage:[NSImage imageNamed:@"potatoBugThumb.jpg"] fullImage:[NSImage imageNamed:@"potatoBug.jpg"]];
    ScaryBugDoc *bug2 = [[ScaryBugDoc alloc] initWithTitle:@"House Centipede" rating:3 thumbImage:[NSImage imageNamed:@"centipedeThumb.jpg"] fullImage:[NSImage imageNamed:@"centipede.jpg"]];
    ScaryBugDoc *bug3 = [[ScaryBugDoc alloc] initWithTitle:@"Wolf Spider" rating:5 thumbImage:[NSImage imageNamed:@"wolfSpiderThumb.jpg"] fullImage:[NSImage imageNamed:@"wolfSpider.jpg"]];
    ScaryBugDoc *bug4 = [[ScaryBugDoc alloc] initWithTitle:@"Lady Bug" rating:1 thumbImage:[NSImage imageNamed:@"ladybugThumb.jpg"] fullImage:[NSImage imageNamed:@"ladybug.jpg"]];
    NSMutableArray *bugs = [NSMutableArray arrayWithObjects:bug1, bug2, bug3, bug4, nil];
    
    self.masterViewController.bugs = bugs;
    // 2. Add the view controller to the Window's content view
    [self.window.contentView addSubview:self.masterViewController.view];
    self.masterViewController.view.frame = ((NSView*)self.window.contentView).bounds;
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

@end
