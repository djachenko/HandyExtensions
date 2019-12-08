
#import <Foundation/Foundation.h>


@interface NSString (Extensions)

- (BOOL)isEmpty;
- (NSString*)stringBetweenString:(NSString*)start andString:(NSString*)end;

- (NSString *)stringByAppendingInteger:(NSInteger)i;

- (BOOL)hasPrefixOrEmptyOrNil:(NSString *)prefix;
- (BOOL)hasPrefixOrEmptyOrNil:(NSString *)prefix ignoreCase:(BOOL)ignoreCase;

- (BOOL)hasPrefix:(NSString *)prefix ignoreCase:(BOOL)ignoreCase;

- (BOOL)matchWithRegexPattern:(NSString *)pattern;
- (NSString *)extractFirstOccurrenceWithRegexPattern:(NSString *)pattern;

- (NSString *)MD5;

+(BOOL)isNilOrEmptyString:(NSString*)string;

@end
