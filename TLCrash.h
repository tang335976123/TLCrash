//
//  TLCrash.h
//  Pods
//
//  Created by Tangjiling on 2020/5/15.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface TLCrash : NSObject

+(void)collectCrash;

+(NSUncaughtExceptionHandler *)getHandler;

+(void)takeException:(NSException *)exception;

@end

NS_ASSUME_NONNULL_END
