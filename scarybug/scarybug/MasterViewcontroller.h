//
//  MasterViewcontroller.h
//  scarybug
//
//  Created by macbook on 17/2/10.
//  Copyright © 2017年 macbook. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface MasterViewcontroller : NSViewController
@property (strong) NSMutableArray *bugs;
-(IBAction)addRows:(id)sender;
-(IBAction)removeRows:(id)sender;
-(IBAction)change:(id)sender;
@end
