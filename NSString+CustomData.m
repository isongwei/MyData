//
//  NSString+CustomData.m
//  SWData
//
//  Created by 张松伟 on 16/3/17.
//  Copyright © 2016年 张松伟. All rights reserved.
//

#import "NSString+CustomData.h"

@implementation NSString (CustomData)


+(NSString *)dataWithDataString:(NSString*)dataString dateFormatter:(NSString *)dateFormatter{
    
    NSDate *current = [NSDate date];
    NSDate *Customda = [NSDate dateWithTimeIntervalSince1970:dataString.integerValue];
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"yyyy";
    if ([[fmt stringFromDate:current] isEqualToString:[fmt stringFromDate:Customda]]) {

  
        
        
        /**************************************************/
        fmt.dateFormat = @"yyyy-MM-dd";
        if ([[fmt stringFromDate:current] isEqualToString:[fmt stringFromDate:Customda]]) {
            NSLog(@"今天");

            
            
            
            
            
            fmt.dateFormat = @"HH";
            int h = (int)([fmt stringFromDate:current].integerValue -[fmt stringFromDate:Customda].integerValue);
                if (h) {

                    
                    
                    
                    
                    
                    return [NSString stringWithFormat:@"今天%zd小时前", h];
                }else{
                    //大于一分钟还是大于半分钟还是大于几秒钟, 这个根据自己喜好再加判断就行
            fmt.dateFormat = @"mm";
            int m = (int)([fmt stringFromDate:current].integerValue -[fmt stringFromDate:Customda].integerValue);
                if (m >= 10) {
                    
                    
                    
                    
                    
                    
                    return [NSString stringWithFormat:@"今天%zd分钟前", m];
                } else {
                    
                    return @"刚刚";
                }
                }
        }
        /**************************************************/
        fmt.dateFormat = @"yyyyMMdd";
        if ([fmt stringFromDate:current].floatValue ==[fmt stringFromDate:[NSDate dateWithTimeIntervalSince1970:dataString.integerValue]].floatValue +1) {
            NSLog(@"昨天");
            fmt.dateFormat = @"HH:mm:ss";
            return [NSString stringWithFormat:@"昨天%@",[fmt stringFromDate:[NSDate dateWithTimeIntervalSince1970:dataString.integerValue]]];

            
        }
        
        
        
        
        
    }
    if (!dateFormatter) {
        fmt.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    }else{
        fmt.dateFormat = dateFormatter;
    }
    
    return [fmt stringFromDate:[NSDate dateWithTimeIntervalSince1970:dataString.integerValue]];
}
+(NSString *)dataWithDataString:(NSString*)dataString{
    return  [self dataWithDataString:dataString dateFormatter:nil];
}

+(NSString *)weekWithDataString:(NSString*)dataString{

    NSString *weekDayStr = nil;
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    NSString *str = [NSDate dateWithTimeIntervalSince1970:dataString.integerValue].description;
    if (str.length >= 10) {
        NSString *nowString = [str substringToIndex:10];
        NSArray *array = [nowString componentsSeparatedByString:@"-"];
        
        if (array.count == 0) {
            array = [nowString componentsSeparatedByString:@"/"];
        }
        if (array.count >= 3) {
            int year = (int)[[array objectAtIndex:0] integerValue];
            int month = (int)[[array objectAtIndex:1] integerValue];
            int day = (int)[[array objectAtIndex:2] integerValue];
            [comps setYear:year];
            [comps setMonth:month];
            [comps setDay:day];
        }
    }
    
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSGregorianCalendar];
    NSDate *date = [gregorian dateFromComponents:comps];
    NSDateComponents *weekdayComponents = [gregorian components:NSWeekdayCalendarUnit fromDate:date];
    int week = (int)[weekdayComponents weekday];

    switch (week) {
        case 1:
            weekDayStr = @"星期日";
            break;
        case 2:
            weekDayStr = @"星期一";
            break;
        case 3:
            weekDayStr = @"星期二";
            break;
        case 4:
            weekDayStr = @"星期三";
            break;
        case 5:
            weekDayStr = @"星期四";
            break;
        case 6:
            weekDayStr = @"星期五";
            break;
        case 7:
            weekDayStr = @"星期六";
            break;
        default:
            weekDayStr = @"";  
            break;  
    }  
    return weekDayStr;

}
// zyn_timeWithString:_createTime
//                       andOriginalDateFormat:dateFormat
//                          andYesterdayFormat:@"昨天 HH:mm"
//                               andYearFormat:@"MM-dd HH:mm"];

@end
