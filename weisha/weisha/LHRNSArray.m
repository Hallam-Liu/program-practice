//
//  LHRNSArray.m
//  weisha
//
//  Created by gdlocal on 9/21/16.
//  Copyright (c) 2016 随意. All rights reserved.
//

#import "LHRNSArray.h"

@implementation LHRNSArray
NSArray *namearray =nil;
- (void)initialize {
    if(!namearray)
        namearray = [[NSArray alloc] initWithObjects:@"centipede",@"potatoBug",@"wolfspider",@"lady bug", nil];
    
}
- (id)init {
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (void)awakeFromNib
{
    NSDictionary *stringValue = [[NSDictionary alloc]initWithObjectsAndKeys:@"LHR",[NSNumber numberWithInt:0],
                                                                            @"one",[NSNumber numberWithInt:1],
                                                                            @"two",[NSNumber numberWithInt:2],
                                                                            @"two",[NSNumber numberWithInt:3],
                                                                            @"two",[NSNumber numberWithInt:4],
                                                                            @"two",[NSNumber numberWithInt:5],
                                                                            @"two",[NSNumber numberWithInt:6],
                                                                            @"two",[NSNumber numberWithInt:7],
                                                                            @"two",[NSNumber numberWithInt:8],
                                                                            @"two",[NSNumber numberWithInt:9],
                                                                            @"two",[NSNumber numberWithInt:10],
                                                                            @"two",[NSNumber numberWithInt:11],
                                                                            @"two",[NSNumber numberWithInt:12],
                                                                            @"two",[NSNumber numberWithInt:14],
                                                                            @"two",[NSNumber numberWithInt:13],
                                                                            nil];
    NSMutableDictionary *mutable =[[NSMutableDictionary alloc]init];
    [mutable setObject:@"what" forKey:@"3"];
    [mutable setObject:@"pung" forKey:@"4"];
    [mutable setObject:@"kun" forKey:@"5"];
    [mutable setObject:@"seung" forKey:@"6"];
    NSMutableArray *arr =[[NSMutableArray alloc]initWithCapacity:7];
    for (NSString *s in[stringValue allValues]){
        [arr addObject: s];
    }
    for (NSString *j in [mutable allValues]){
        [arr addObject:j];
    }
   // [[[dictionaryValue textStorage] mutableString] appendString:arr];
    for(NSString *i in arr){
    [[[dictionaryValue textStorage] mutableString] appendString:i];
    [[[dictionaryValue textStorage] mutableString] appendString:@"\n"];
        //[dictionaryValue setValue:i];
    }
}
/*- (NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row{
     NSTableCellView *cellView = [tableView makeViewWithIdentifier:tableColumn.identifier owner:self];

    if( [tableColumn.identifier isEqualToString:@"bugsName"] ){
        LHRNSArray *cellView = [namearray objectAtIndex:row];
       
        return cellView;
    }
    
    return cellView;
}
 */

//NSArray *namearray =[[NSArray alloc]initWithObjects:@"centipede",@"potatoBug",@"wolfspider",@"lady bug", nil];
@end
