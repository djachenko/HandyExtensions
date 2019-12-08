

#import <Foundation/Foundation.h>

@interface NSDate (Extensions)

+ (NSDate *)dateWithString:(NSString *)string format:(NSString *)format;
+ (NSDate *)dateWithRFC3339String:(NSString *)string;

- (NSDate *)dateWithoutTime;

- (NSDate *)tomorrowDate;

+ (NSDate *)todayDateWithoutTime;
+ (NSDate *)tomorrowDateWithoutTime;
+ (BOOL)isTodayDate:(NSDate *)aDate;
+ (BOOL)isYesterdayDate:(NSDate *)aDate;
- (BOOL)isToday;
- (BOOL)isYesterday;;
- (NSString *)toUTCTimeString;
- (NSString *)toTimeStampString;
- (NSString *)toDateStampString;

- (NSString *)toOnlyDateApiString;

- (NSComparisonResult)compareWithoutTime:(NSDate *)other;
- (BOOL)equalWithoutTime:(NSDate *)other;

@end
