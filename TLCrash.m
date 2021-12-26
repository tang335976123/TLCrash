//
//  TLCrash.m
//  Pods
//
//  Created by Tangjiling on 2020/5/15.
//

#import "TLCrash.h"
static BOOL _fileLogOnOrOff;

NSString *applicationDocumentsDirectory(){
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
}

void UncaughtExceptionHeandler(NSException *exception){
    NSArray *arr = [exception callStackSymbols];
    NSString * reason = [exception reason];
    NSString * name = [exception name];
    NSString * url = [NSString stringWithFormat:@"========异常错误报告========\nname:%@\nreason:\n%@\ncallStackSymbols:\n%@",name,reason,[arr componentsJoinedByString:@"\n"]];
    NSString * path = [applicationDocumentsDirectory() stringByAppendingPathComponent:@"Exception.txt"];
    [url writeToFile:path atomically:YES encoding:NSUTF8StringEncoding error:nil];
    
    NSString *urlStr = [NSString stringWithFormat:@"mailto:wy@91goal.com?subject=客户端bug报告&body=很抱歉应用出现故障,感谢您的配合!发送这封邮件可协助我们改善此应用<br>"
                        "错误详情:<br>%@<br>--------------<br>%@<br>---------------------<br>%@",
                        name,reason,[arr componentsJoinedByString:@"<br>"]];
    
    NSURL *url2 = [NSURL URLWithString:[urlStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    [[UIApplication sharedApplication] openURL:url2];
}


@implementation TLCrash

-(NSString *)applicationDocumentsDirectory
{
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
}

+(void)collectCrash
{
    NSSetUncaughtExceptionHandler(&UncaughtExceptionHeandler);
}

+(NSUncaughtExceptionHandler *)getHandler
{
    return NSGetUncaughtExceptionHandler();
}

+(void)takeException:(NSException *)exception
{
    NSArray * arr = [exception callStackSymbols];
    NSString * reason = [exception reason];
    NSString * name = [exception name];
    NSString * url = [NSString stringWithFormat:@"========异常错误报告========\nname:%@\nreason:\n%@\ncallStackSymbols:\n%@",name,reason,[arr componentsJoinedByString:@"\n"]];
    NSString * path = [applicationDocumentsDirectory() stringByAppendingPathComponent:@"Exception.txt"];
    [url writeToFile:path atomically:YES encoding:NSUTF8StringEncoding error:nil];

    NSLog(@"%s:%d %@", __FUNCTION__, __LINE__, url);
    
}




+ (void)setFileLogOnOrOff:(BOOL)on {
    _fileLogOnOrOff = on;
}

+ (void)logWithLine:(NSUInteger)line
             method:(NSString *)methodName
               time:(NSDate *)timeStr
             format:(NSString *)format {
    
#if DEBUG
    // 日志时间格式化, 不用看
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday |
    NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond | NSCalendarUnitNanosecond;
    NSDateComponents *comps  = [calendar components:unitFlags fromDate:[NSDate date]];
    NSString *time = [NSString stringWithFormat:@"%ld/%ld,%ld:%ld:%ld:%@", (long)comps.month, (long)comps.day, (long)comps.hour, (long)comps.minute, (long)comps.second, [[NSString stringWithFormat:@"%ld", (long)comps.nanosecond] substringToIndex:2]];
    
    // debug 直接输出
    fprintf(stderr,"[%s]%s %tu行: ● %s.\n", [time UTF8String],[methodName UTF8String],line,[format UTF8String]);
#else
    // release && 文件Log开 写入文件
    if (_fileLogOnOrOff) {
      
      // 日志时间格式化, 不用看
        NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
        NSInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday |
        NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond | NSCalendarUnitNanosecond;
        NSDateComponents *comps  = [calendar components:unitFlags fromDate:[NSDate date]];
        NSString *time = [NSString stringWithFormat:@"%ld/%ld,%ld:%ld:%ld:%@", (long)comps.month, (long)comps.day, (long)comps.hour, (long)comps.minute, (long)comps.second, [[NSString stringWithFormat:@"%ld", (long)comps.nanosecond] substringToIndex:2]];

      // 写入文件
        NSString *logStr = [NSString stringWithFormat:@"[%@]%@ %tu行: ● %@.\n", time, methodName,line,format];
        [self writeLogWithString:logStr];
    }
#endif
}

+ (void)writeLogWithString:(NSString *)content
{
    NSString *filePath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES).firstObject stringByAppendingPathComponent:@"my_log.text"];
    NSError *error = nil;
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if(![fileManager fileExistsAtPath:filePath]) //如果不存在
    {
        [content writeToFile:filePath atomically:YES encoding:NSUTF8StringEncoding error:&error];
        if (error) {
            NSLog(@"文件写入失败 errorInfo: %@", error.domain);
        }
    }
    NSFileHandle *fileHandle = [NSFileHandle fileHandleForUpdatingAtPath:filePath];
    [fileHandle seekToEndOfFile];
    NSData* stringData  = [content dataUsingEncoding:NSUTF8StringEncoding];
    [fileHandle writeData:stringData]; // 追加
    [fileHandle synchronizeFile];
    [fileHandle closeFile];
}


@end
