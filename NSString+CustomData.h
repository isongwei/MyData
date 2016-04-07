//
//  NSString+CustomData.h
//  SWData
//
//  Created by 张松伟 on 16/3/17.
//  Copyright © 2016年 张松伟. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (CustomData)

//+(NSString *)dataWithDataString:(NSString*)dataString dateFormatter:(NSFormatter*)dateFormatter;
+(NSString *)weekWithDataString:(NSString*)dataString;
+(NSString *)dataWithDataString:(NSString*)dataString;
@end
