//
//  ScaryBugData.m
//  scarybug
//
//  Created by macbook on 17/2/10.
//  Copyright © 2017年 macbook. All rights reserved.
//

#import "ScaryBugData.h"

@implementation ScaryBugData

- (id)initWithTitle:(NSString*)title rating:(float)rating {
    if ((self = [super init])) {
        self.title = title;
        self.rating = rating;
    }
    return self;
}

@end