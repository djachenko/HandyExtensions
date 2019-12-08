
#import "NSDictionary+Extensions.h"

@implementation NSDictionary (Extensions)

- (NSDictionary *)each:(void(^)(NSString *key, id item))block {
    for (NSString *key in self) {
        block(key, self[key]);
    }

    return self;
}

- (NSDictionary *)convertValues:(id(^)(id key, id item))block {
    NSMutableDictionary *result = [NSMutableDictionary dictionaryWithCapacity:self.count];

    for (NSString *key in self) {
        result[key] = block(key, self[key]);
    }

    return result;
}

@end
