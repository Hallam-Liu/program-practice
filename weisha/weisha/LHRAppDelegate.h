//
//  LHRAppDelegate.h
//  weisha
//
//  Created by gdlocal on 9/12/16.
//  Copyright (c) 2016 随意. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "newWindow.h"

@interface LHRAppDelegate : NSObject <NSApplicationDelegate>
{
    NSSpeechSynthesizer *_speechSynth;
    IBOutlet NSImageView *LHR_image;
    IBOutlet NSTextField *sliderValue;
    IBOutlet NSSlider    *LHR_imageMagnify;
     IBOutlet NSProgressIndicator *login;
}

@property (strong) NSMutableArray *bugs;
@property (assign) IBOutlet NSWindow *window;
- (IBAction)speak:(id)sender;
- (IBAction)stop:(id)sender;
@property (weak) IBOutlet NSTextField *textField;
- (IBAction)appear:(id)sender;
 @property (strong) IBOutlet NSSlider *magnify;
- (id)initWithTitle:(NSString*)title Image:(NSImage *)LHR_image;
//+ (instancetype)sliderWithTarget:(id)target action:(SEL)action;
-(IBAction)sliderValueChanged:(id)sender;
@end
