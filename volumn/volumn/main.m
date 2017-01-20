//
//  main.m
//  volumn
//
//  Created by macbook on 16/11/18.
//  Copyright © 2016年 macbook. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Volume.h"
#import <stdio.h>
#import <Foundation/NSObject.h>
int main(void) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
    }
    id v,w;
    v=[[Volume alloc]initWithMin:0 max:10 step:2];
    w=[[Volume alloc]initWithMin:0 max:9 step:3];
    [v up];
    printf("the volume now = %d %d\n",[v Value],[w Value]);
    [v up];
    [w up];
    printf("the volume now = %d %d\n",[v Value],[w Value]);
    [v down];
    [w down];
    printf("the volume now = %d %d\n",[v Value],[w Value]);
    
    return 0;
}
