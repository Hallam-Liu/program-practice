//
//  newWindow.m
//  weisha
//
//  Created by macbook on 16/10/8.
//  Copyright © 2016年 随意. All rights reserved.
//

#import "newWindow.h"
#import "LHRAppDelegate.h"
@interface newWindow ()

@end

@implementation newWindow

- (void)windowDidLoad {
    [super windowDidLoad];
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
}
-(void)awakeFromNib{
    //[showPosition setStringValue:@"MF"];
    
}
-(IBAction)GO:(id)sender{
    LHRAppDelegate *window = (LHRAppDelegate*) [[NSApplication sharedApplication]delegate];
    [self.window close];
    //[[window.window parentWindow]makeKeyAndOrderFront:nil];
    [window.window center];
}
-(IBAction)add:(id)sender{
    arr= [[NSMutableArray alloc]init];
    // if(sender==btpress){
    NSString *str;
    str=logname.stringValue;
    [arr addObject:str];
    //NSLog(@"%@",str);
   // }
    //NSLog(@"%@",arr);
    [name addItemsWithObjectValues:arr];
}
-(IBAction)name:(id)sender{
    NSComboBoxCell *value= [[NSComboBoxCell alloc]init];
    NSString *str= value.stringValue;
    NSLog(@"%@",str);
    if ([name.stringValue isEqual:@"lhr"]){
        [showPosition setStringValue:@"MF"];
    }
}

@end
