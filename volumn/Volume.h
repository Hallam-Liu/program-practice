//
//  Volume.h
//  volumn
//
//  Created by macbook on 16/11/18.
//  Copyright © 2016年 macbook. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Foundation/NSObject.h>
@interface Volume : NSObject
{   int val;
    int min, max,step;
}
-(id) initWithMin:(int)a max:(int)b step:(int)c;
-(int) Value;
-(id) up;
-(id)down;
@end
