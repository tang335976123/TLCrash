//
//  TLCrash.h
//  Pods
//
//  Created by Tangjiling on 2020/5/15.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

//日志打印
#define NSLog(...)

#define PKLog(frmt,...) [Log logWithLine:__LINE__ method:[NSString stringWithFormat:@"%s", __FUNCTION__] time:[NSDate date] format:[NSString stringWithFormat:frmt, ## __VA_ARGS__]]


@interface TLCrash : NSObject

/// 初始化Crash 记录闪退问题
+(void)collectCrash;

+(NSUncaughtExceptionHandler *)getHandler;

+(void)takeException:(NSException *)exception;

+ (void)setFileLogOnOrOff:(BOOL)on;
+ (void)logWithLine:(NSUInteger)line
             method:(NSString *)methodName
               time:(NSDate *)timeStr
             format:(NSString *)format;

@end

NS_ASSUME_NONNULL_END
