
#import <Foundation/Foundation.h>

@interface NSDictionary (Extensions)

- (NSDictionary *)each:(void(^)(NSString *key, id item))block;
- (NSDictionary *)convertValues:(id(^)(id key, id item))block;

@end
