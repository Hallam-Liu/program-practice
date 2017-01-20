//
//  LHR.h
//  weisha
//
//  Created by gdlocal on 9/18/16.
//  Copyright (c) 2016 随意. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LHR : NSObject{
    IBOutlet NSTextField *date;
    IBOutlet NSTextField *user;
    NSDate *entryDate;
    NSArray *namearray;
    NSWindow *my_window_control;
}
-(IBAction)GO:(id)sender;
-(void)setEntryDate:(NSDate*)date;
-(NSDate*)entryDate;
@end
