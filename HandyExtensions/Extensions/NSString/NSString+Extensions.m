
#import "NSString+Extensions.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (Extensions)

+(BOOL)isNilOrEmptyString:(NSString*)string {
	return nil == string || string.isEmpty;
}

- (BOOL)isEmpty {
	NSString *tempString = [self stringByReplacingOccurrencesOfString:@" " withString:@""];

	if ([tempString length] != 0) {
		return NO;
	}
	else {
		return YES;
	}
}

-(NSString*)stringBetweenString:(NSString*)start andString:(NSString*)end {
	NSRange startRange = [self rangeOfString:start];

	if (startRange.location == NSNotFound) {
		return nil;
	}
	
	NSRange targetRange;
	
	targetRange.location = startRange.location + startRange.length;
	targetRange.length = [self length] - targetRange.location;
	
	NSRange endRange = [self rangeOfString:end options:0 range:targetRange];

	if (endRange.location == NSNotFound) {
		return nil;
	}
	
	targetRange.length = endRange.location - targetRange.location;
	
	return [self substringWithRange:targetRange];

}

- (NSString *)stringByAppendingInteger:(NSInteger)i {
	return [NSString stringWithFormat:@"%@%li", self, i];
}

- (BOOL)hasPrefixOrEmptyOrNil:(NSString *)prefix {
	return [self hasPrefixOrEmptyOrNil:prefix ignoreCase:NO];
}

- (BOOL)hasPrefixOrEmptyOrNil:(NSString *)prefix ignoreCase:(BOOL)ignoreCase {
	assert([prefix isKindOfClass:NSString.class]);

	if ([NSString isNilOrEmptyString:prefix]) {
		return YES;
	}

	return [self hasPrefix:prefix ignoreCase:ignoreCase];
}

- (BOOL)hasPrefix:(NSString *)prefix ignoreCase:(BOOL)ignoreCase {
	if (ignoreCase) {
		NSString *lowercaseSelf = [self.copy lowercaseString];
		NSString *lowercasePrefix = [prefix lowercaseString];

		return [lowercaseSelf hasPrefix:lowercasePrefix];
	}
	else {
		return [self hasPrefix:prefix];
	}
}

- (BOOL)matchWithRegexPattern:(NSString *)pattern {
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:pattern
                                                                           options:0 
																			 error:NULL];
    
    NSRange textRange = NSMakeRange(0, self.length);
    /*NSTextCheckingResult *match =*/ [regex firstMatchInString:self options:0 range:textRange];
    NSRange matchRange = [regex rangeOfFirstMatchInString:self options:0 range:textRange];

    BOOL res = (matchRange.location != NSNotFound);
    
    return res;
}

- (NSString *)extractFirstOccurrenceWithRegexPattern:(NSString *)pattern {
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:pattern
                                                                           options:0 
																			 error:NULL];
    
    NSTextCheckingResult *match = [regex firstMatchInString:self options:0 range:NSMakeRange(0, [self length])];
    
    if (match != nil) {
        NSString *s1 = [self substringWithRange:[match rangeAtIndex:1]];
        return s1;
    }

    return nil;
}

- (NSString*)MD5 {
	// Create pointer to the string as UTF8
	const char *ptr = [self UTF8String];

	// Create byte array of unsigned chars
	unsigned char md5Buffer[CC_MD5_DIGEST_LENGTH];

	// Create 16 byte MD5 hash value, store in buffer
	CC_MD5(ptr, (uint32_t) strlen(ptr), md5Buffer);

	// Convert MD5 value in the buffer to NSString of hex values
	NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
	
	for (int i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
		[output appendFormat:@"%02x", md5Buffer[i]];
	}

	return output;
}

@end
