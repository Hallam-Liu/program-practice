//
//  LHR.m
//  weisha
//
//  Created by gdlocal on 9/18/16.
//  Copyright (c) 2016 随意. All rights reserved.
//

#import "LHR.h"
#import "newWindow.h"



@implementation LHR
-(void)setEntryDate:(NSDate *)date{
    entryDate = date;
}
-(NSDate*)entryDate
{return entryDate;
    NSLog(@"%@",entryDate);
}
-(NSString *)description
{    NSDate* now=[[NSDate alloc]init];
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setTimeStyle:(NSDateFormatterNoStyle)];
    [df setDateStyle:(NSDateFormatterMediumStyle)];
    NSString *result;
    result = [[NSString alloc] initWithFormat:@"%@-->%@",
    [df stringFromDate:entryDate],now];
    return result;
}
-(void)awakeFromNib{
     NSDate* now=[[NSDate alloc]init];
    NSMutableArray *array;
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *weekComponents =
    [[NSDateComponents alloc] init];
    array = [[NSMutableArray alloc] init];
    //[array addObject:now];
    int i;
    for (i = 0; i < 3; i++) {
        [weekComponents setWeek:i];
        // Create a date/time object that is ‘i’ weeks from now
        NSDate *iWeeksFromNow;
        iWeeksFromNow = [cal dateByAddingComponents:weekComponents
                                             toDate:now
                                            options:0];
        // Create a new instance of LotteryEntry
        LHR *newEntry = [[LHR alloc] init];
        [newEntry setEntryDate:iWeeksFromNow];
        // Add the LotteryEntry object to the array
        [array addObject:newEntry];
    }
    namearray = [[NSArray alloc] initWithObjects:@"centipede",@"potatoBug",@"wolfspider",@"lady bug", nil];
    [array addObject:namearray];
    [date  setStringValue:array];
    }
-(IBAction)GO:(id)sender{
    
    
    NSAlert *alert = [[NSAlert alloc] init];
    
    [alert addButtonWithTitle:@"OK"];
    
    [alert addButtonWithTitle:@"Cancel"];
    
    [alert setMessageText:@"Delete the record?"];
    
    [alert setInformativeText:@"Deleted records cannot be restored."];
    
    [alert setAlertStyle:NSWarningAlertStyle];
    
    [alert runModal];
    
}
@end
