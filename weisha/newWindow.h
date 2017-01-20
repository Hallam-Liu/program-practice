//
//  newWindow.h
//  weisha
//
//  Created by macbook on 16/10/8.
//  Copyright © 2016年 随意. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <Cocoa/Cocoa.h>
@interface newWindow : NSWindowController{
    IBOutlet NSTimer *time;
    IBOutlet NSProgress *progress;
    IBOutlet NSTextField *showPosition;
    IBOutlet NSComboBox *name;
    IBOutlet NSTextField *showAbility;
    IBOutlet NSTextField *logname;
    IBOutlet NSButton *btpress;
    NSMutableArray *arr;
    
}
@property (strong) newWindow *newswindow;

-(IBAction)GO:(id)sender;
-(IBAction)name:(id)sender;
-(IBAction)add:(id)sender;
@end
