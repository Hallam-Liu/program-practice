//
//  LHRAppDelegate.m
//  weisha
//
//  Created by gdlocal on 9/12/16.
//  Copyright (c) 2016 随意. All rights reserved.
//

#import "LHRAppDelegate.h"
#import "newWindow.h"
@interface LHRAppDelegate()
@property (strong) newWindow *newswindow;
@end

@implementation LHRAppDelegate
@synthesize window = _window;
//- (id)initWithTitle:(NSString*)title Image:(NSImage *)LHR_image {
//    if ((self = [super init])) {
//        self.title = title;
//        self.LHR_image = LHR_image;
//    }
//}
//-(void)initNSImageView{
//    [LHR_image setImage:[NSImage imageNamed:@"potatoBug.jpg"]];
//}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification{
//    _window = [[LHRAppDelegate alloc] initWithWindowNibName:@"LHRAppDelegate"];
//    
//    //让显示的位置居于屏幕的中心
//    [[_windowwindow] center];
//    //前置显示窗口
//    [_window.window orderFront:nil];
//    NSSlider*LHR_imageMagnify = [[NSSlider alloc]init];
//    [LHR_imageMagnify setAllowsTickMarkValuesOnly:YES];
//    [LHR_imageMagnify setMinValue:1];
//    [LHR_imageMagnify setMaxValue:6];
//    [LHR_imageMagnify setNumberOfTickMarks:(NSInteger)1];
//    [LHR_imageMagnify setTickMarkPosition:(NSTickMarkPosition)2];
//    [LHR_imageMagnify setFloatValue:2];
   // Insert code here to initialize your application
}
-(void) awakeFromNib{
[LHR_image setImage:[NSImage imageNamed:@"potatoBug.jpg"]];

}

- (IBAction)appear:(id)sender{
    login= [[NSProgressIndicator alloc]init];
    
    _newswindow = [[newWindow alloc]initWithWindowNibName:@"newWindow"];
    [_newswindow.window orderFront:nil];
    [self.window orderOut:nil];
}
- (IBAction)textField:(id)sender {
}
- (IBAction)speak:(id)sender {
    
    //[image setImage:[NSImage imageNamed:@"potatoBug.jpg"]];
    
    NSString *string = [_textField stringValue];
    // Is the string zero-length?
    if ([string length] == 0) {
        NSLog(@"string from %@ is of zero-length", _textField);
        return; }
    [_speechSynth startSpeakingString:string];
    NSLog(@"Have started to say: %@", string);
}
- (IBAction)stop:(id)sender
{
    NSLog(@"stopping");
    [_speechSynth stopSpeaking];
}

- (BOOL)allowsTickMarkValuesOnly{
    return YES;
}
- (void)LHR_imageMagnifyInit {
//    NSSlider*LHR_imageMagnify = [[NSSlider alloc]init];
//    [LHR_imageMagnify setAllowsTickMarkValuesOnly:YES];
//    [LHR_imageMagnify setMinValue:1];
//    [LHR_imageMagnify setMaxValue:6];
//    [LHR_imageMagnify setNumberOfTickMarks:(NSInteger)1];
//    [LHR_imageMagnify setTickMarkPosition:(NSTickMarkPosition)2];
//    [LHR_imageMagnify setFloatValue:2];
//     LHR_ImageMagnify.minimumValue = 0;//最小值
//     LHR_ImageMagnify.maximumValue = 25;//最大值
}
-(IBAction)sliderValueChanged:(id)sender{
   double imageSize= LHR_imageMagnify.doubleValue;
    sliderValue.stringValue= [NSString stringWithFormat:@"%f",imageSize];
    int i= imageSize;
    NSLog(@"%D",i);
    if(i>=90){[LHR_image setImage:[NSImage imageNamed:@"potatoBug.jpg"]];}
    else if (i<90&&i>=80){[LHR_image setImage:[NSImage imageNamed:@"11.png"]];}
    else if (i<80&&i>=70){[LHR_image setImage:[NSImage imageNamed:@"12.png"]];}
    else if (i<70&&i>=60){[LHR_image setImage:[NSImage imageNamed:@"13.png"]];}
    else if (i<60&&i>=50){[LHR_image setImage:[NSImage imageNamed:@"14.png"]];}
    else if (i<50&&i>=40){[LHR_image setImage:[NSImage imageNamed:@"15.png"]];}
}

- (void)LHR_ImageMagnifyAction:(id)sender
{
   
    // UISlider *slider = (UISlider *)sender;
    //[_glow setText:[NSString stringWithFormat:@"%i", (int)[_faderSlider value]]];
}

;
-(BOOL)applicationShouldHandleReopen:(NSApplication *)theApplication hasVisibleWindows:(BOOL)flag{
    NSLog(@"%hhd",flag);
    [_window makeKeyAndOrderFront:nil];
    return YES;
}
- (BOOL)applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)sender
{
    return YES;
}
- (BOOL) application:(NSApplication *)sender openFile:(NSString *)filename
{
    /*
     * XXX : mpetit : connect this to the UI, and load only if no test is running
     */
    return NO;
}
@end
