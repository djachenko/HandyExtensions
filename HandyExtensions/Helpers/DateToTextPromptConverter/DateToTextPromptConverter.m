#import "DateToTextPromptConverter.h"
#import "NSDate+Extensions.h"

NSString *stringRepresentationOfDate(NSDate *date) {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    formatter.locale = [NSLocale currentLocale];
    [formatter setDateFormat:@"dd MMM yyyy"];
    
    return [formatter stringFromDate:date];
}


@implementation DateToTextPromptConverter

+ (NSString *)convert:(NSDate *)date {
    NSString *text = nil;

    if (nil == date) {
        text = @"Default";
    }
    else if (NSOrderedDescending == [date compare:[NSDate date]]) {
        text = stringRepresentationOfDate(date);//calibration is done sometime in future
    }
    else if ([date isToday]) {
        text = @"Today";
    }
    else if ([date isYesterday]) {
        text = @"One day ago";
    }
    else {
        NSDate *dateWithoutTime = [date dateWithoutTime];
        NSDate *today = [NSDate todayDateWithoutTime];

        NSCalendar *gregorian = [[NSCalendar alloc]
                initWithCalendarIdentifier:NSCalendarIdentifierGregorian];

        NSCalendarUnit unitFlags = NSCalendarUnitMonth | NSCalendarUnitDay;

        NSDateComponents *components = [gregorian components:unitFlags
                                                    fromDate:dateWithoutTime
                                                      toDate:today options:0];

        NSInteger days = [components day];
        NSInteger month = [components month];

        switch (month) {
            case 0:
                switch (days / 7) {
                    case 0:
                        text = [NSString stringWithFormat:@"%li days ago", days];
                        break;
                    case 1:
                        text = @"One week ago";
                        break;
                    case 2:
                    case 3:
                    case 4:
                        text = [NSString stringWithFormat:@"%li weeks ago", days / 7];
                        break;
                    default:
                        //we shouldn't ever get here
                        text = stringRepresentationOfDate(date);
                        break;
                }

                break;
            case 1:
                text = @"Month ago";
                break;
            default:
                text = stringRepresentationOfDate(date);
                break;
        }
    }

    return text;
}

@end
