//
//  main.m
//  AnimationBuilder
//
//  Created by WeeTom on 14-5-23.
//  Copyright (c) 2014年 ___migndao___. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AppDelegate.h"

void outdate(void)
{
    NSDate *date = [NSDate date];
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    NSInteger interval = [zone secondsFromGMTForDate: date];
    NSDate *localeDate = [date  dateByAddingTimeInterval: interval];
    NSLog(@"enddate=%@",localeDate);
    
    NSTimeInterval perdaySeconds = 60*24*60;
    date = [NSDate dateWithTimeIntervalSinceNow:perdaySeconds];
    NSLog(@"data:%@",date);
    
    NSDateComponents *com = [[NSCalendar currentCalendar] components:NSCalendarCalendarUnit fromDate:date];
    NSLog(@"com%@",[[NSCalendar currentCalendar] dateFromComponents:com]);
}

int main(int argc, char * argv[])
{
    outdate();
    @autoreleasepool {
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
    
}

