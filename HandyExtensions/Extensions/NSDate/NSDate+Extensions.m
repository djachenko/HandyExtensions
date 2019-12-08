
#import "NSDate+Extensions.h"

@implementation NSDate (Extensions)

+ (NSDate *)dateWithString:(NSString *)string format:(NSString *)format {
	if (format == nil) {
		return [NSDate dateWithRFC3339String:string];
	}

	NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
	
	[formatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"]];
	[formatter setDateFormat:format];

	NSDate *date = nil;
	NSError *error = nil;

	[formatter getObjectValue:(&date) forString:string range:nil error:&error];

	return date;
}

+ (NSDate *)dateWithRFC3339String:(NSString *)string {
	return [NSDate dateWithString:string format:@"yyyy-MM-dd'T'HH:mm:ssZ"];
}

- (NSDate *)dateWithoutTime {
	NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
	NSDateComponents *components = [calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:self];
	NSDate *dateStart = [calendar dateFromComponents:components];

	return dateStart;
}

- (NSDate *)tomorrowDate {
	NSDateComponents *dayComponent = [[NSDateComponents alloc] init];
	dayComponent.day = 1;

	NSCalendar *theCalendar = [NSCalendar currentCalendar];
	NSDate *nextDate = [theCalendar dateByAddingComponents:dayComponent toDate:self options:0];

	return nextDate;
}

+ (NSDate *)todayDateWithoutTime {
	NSDate *date = [NSDate date];

	return [date dateWithoutTime];
}

+ (NSDate *)tomorrowDateWithoutTime {
	NSDate *tomorrowDate = [[NSDate date] tomorrowDate];

	return [tomorrowDate dateWithoutTime];
}

+ (BOOL)isTodayDate:(NSDate *)aDate {
	return [aDate equalWithoutTime:[NSDate date]];
}

+ (BOOL)isYesterdayDate:(NSDate *)aDate {
	return [aDate.tomorrowDate equalWithoutTime:[NSDate date]];
}

- (BOOL)isToday {
	return [NSDate isTodayDate:self];
}

- (BOOL)isYesterday {
	return [NSDate isYesterdayDate:self];
}

- (NSString *)toUTCTimeString {
	NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
	
	[dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
	[dateFormatter setTimeZone:[NSTimeZone timeZoneWithName:@"UTC"]];

	NSString *dateString = [dateFormatter stringFromDate:self];

	return dateString;
}

- (NSString *)toTimeStampString {
	NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
	
	[dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
	[dateFormatter setTimeZone:[NSTimeZone timeZoneWithName:@"GMT"]];
	[dateFormatter setLocale:[NSLocale localeWithLocaleIdentifier:@"en_US_POSIX"]];

	NSString *result = [dateFormatter stringFromDate:self];

	return result;
}

- (NSString*)toDateStampString {
	NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
	[dateFormatter setDateFormat:@"yyyy-MM-dd"];

	NSString *result = [dateFormatter stringFromDate:self];

	return result;
}

- (NSString*)toOnlyDateApiString {
	NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];

	[dateFormatter setDateFormat:@"yyyy-MM-dd'T'00:00:00'Z'"];
	[dateFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"]];

	NSString *result = [dateFormatter stringFromDate:self];

	return result;
}

- (NSComparisonResult)compareWithoutTime:(NSDate *)other {
	NSDate *selfTrimmed = [self dateWithoutTime];
	NSDate *otherTrimmed = [other dateWithoutTime];

	return [selfTrimmed compare:otherTrimmed];
}

- (BOOL)equalWithoutTime:(NSDate *)other {
	return [self compareWithoutTime:other] == NSOrderedSame;
}

@end
