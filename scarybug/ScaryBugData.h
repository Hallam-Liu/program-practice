//
//  ScaryBugData.h
//  scarybug
//
//  Created by macbook on 17/2/10.
//  Copyright © 2017年 macbook. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ScaryBugData : NSObject

@property (strong) NSString *title;
@property (assign) float rating;

- (id)initWithTitle:(NSString*)title rating:(float)rating;

@end