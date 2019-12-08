
#import <Foundation/Foundation.h>


@interface NSArray (Extensions)

- (id)single;
- (id)singleOrDefault;

- (NSArray *)differenceWithArray:(NSArray *)array;

+ (NSArray *)arrayWithArray:(NSArray *)array usingConverter:(id (^)(id source))converter;
+ (NSArray *)arrayWithArray:(NSArray *)array usingMultiConverter:(NSArray * (^)(id source))converter;
+ (NSArray *)arrayWithArray:(NSArray *)array usingRemove:(BOOL (^)(id source))predicate;

+ (NSArray *)arrayWithSize:(NSUInteger)size andGenerator:(id (^)(NSUInteger index))generator;

- (NSArray *)reversedArray;

- (NSArray *)forEachItem:(void(^)(id item, NSUInteger index, BOOL *needBreak))block;

- (void)each:(void (^)(id item))block;

- (NSArray *)eachNeighbors:(void(^)(id left, id right, NSUInteger index, BOOL *needBreak))block;

- (id)objectAtBlock:(BOOL(^)(id item))block;
- (NSInteger)indexByBlock:(BOOL(^)(id item))block;
- (NSArray *)objectsAtBlock:(BOOL(^)(id item))block;
- (NSArray *)convert:(id (^)(id source))converter;
- (BOOL)objectsConformsToProtocol:(Protocol *)aProtocol;
- (BOOL)objectsAreKindOfClass:(Class)aClass;
- (BOOL)all:(BOOL(^)(id item))block;

- (NSArray *)subarraysWithCapacity:(NSUInteger)capacity;

- (NSDictionary *)dictionaryKey:(id<NSCopying>(^)(id item))key value:(id(^)(id item))value;

- (id)penultimateObject;

- (NSArray *)distinct;

@property (nonatomic, readonly) BOOL empty;

@end

