
#import "NSArray+Extensions.h"

#pragma mark -
#pragma mark -
#pragma mark Implementation

@implementation NSArray (Extensions)

- (id)single {
	NSUInteger count = self.count;

	if (count == 1) {
		return self[0];
	}

	NSString *message = [NSString stringWithFormat:@"%s: Invalid number of elements (%lu) in array.", __func__, (unsigned long) count];

	@throw [NSException exceptionWithName:NSGenericException reason:message userInfo:nil];
}

- (id)singleOrDefault {
	NSUInteger count = self.count;

	if (count == 1) {
		return [self single];
	}

	return nil;
}

- (NSArray *)differenceWithArray:(NSArray *)array {
	NSMutableArray *result = [NSMutableArray array];

	for (id item in self) {
		if (![array containsObject:item]) {
			[result addObject:item];
		}
	}

	return result;
}

+ (NSArray *)arrayWithArray:(NSArray *)array usingConverter:(id (^)(id source))converter {
	NSMutableArray *result = [NSMutableArray arrayWithCapacity:array.count];

	for (id object in array) {
		[result addObject:converter(object)];
	}

	return result.copy;
}

+ (NSArray *)arrayWithArray:(NSArray *)array usingMultiConverter:(NSArray * (^)(id source))converter {
	NSMutableArray *result = [NSMutableArray arrayWithCapacity:array.count];

	for (id object in array) {
		[result addObjectsFromArray:converter(object)];
	}

	return result.copy;
}

+ (NSArray *)arrayWithArray:(NSArray *)array usingRemove:(BOOL (^)(id source))predicate {
	NSMutableArray *result = [NSMutableArray array];

	for (id object in array) {
		if (predicate(object)) {
			[result addObject:object];
		}
	}

	return result.copy;
}

+ (NSArray *)arrayWithSize:(NSUInteger)size andGenerator: (id (^)(NSUInteger index))generator {
	NSMutableArray *mutableArray = [NSMutableArray arrayWithCapacity:size];

	for (NSUInteger i = 0; i < size; i++) {
		[mutableArray addObject:generator(i)];
	}

	return mutableArray;
}

+ (NSArray *)arrayWithRepeating:(id)object times:(NSUInteger)count {
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:count];

    for (NSUInteger i = 0; i < count; ++i) {
        [array addObject:object];
    }

    return array;
}

- (NSArray *)reversedArray {
	if (self.count == 0) {
		return @[];
	}

	NSMutableArray *result = [NSMutableArray arrayWithCapacity:self.count];

	for (NSInteger i = self.count - 1; i >= 0; i--) {
		[result addObject:self[(NSUInteger) i]];
	}

	return result.copy;
}

- (NSArray *)forEachItem:(void(^)(id item, NSUInteger index, BOOL *needBreak))block {
	BOOL needBreak = NO;

	for (NSUInteger i = 0; i < self.count; i++) {
		block(self[i], i, &needBreak);

		if (needBreak) {
			break;
		}
	}

	return self;
}

- (void)each:(void(^)(id item))block {
	if (nil == block) {
		return;
	}

	for (id i in self) {
		block(i);
	}
}

- (NSArray *)eachNeighbors:(void(^)(id left, id right, NSUInteger index, BOOL *needBreak))block {
	BOOL needBreak = NO;

	for (NSUInteger i = 0; i < self.count; i++) {
		id left;

		if (i == 0) {
			left = nil;
		}
		else {
			left = self[i - 1];
		}

		block(left, self[i], i, &needBreak);

		if (needBreak) {
			break;
		}
	}

	return self;
}

- (id)objectAtBlock:(BOOL(^)(id item))block {

	for (id item in self) {
		if (block(item)) {
			return item;
		}
	}

	return nil;
}

- (NSInteger)indexByBlock:(BOOL(^)(id item))block {

	for (NSUInteger i = 0; i < self.count; i++) {
		if (block(self[i])) {
			return i;
		}
	}

	return -1;
}

- (NSArray *)objectsAtBlock:(BOOL(^)(id item))block {
	NSMutableArray *result = [NSMutableArray array];

	for (id item in self) {
		if (block(item)) {
			[result addObject:item];
		}
	}

	return result.copy;
}

- (NSArray *)convert:(id (^)(id source))converter {
	return [NSArray arrayWithArray:self usingConverter:converter];
}

- (BOOL)objectsConformsToProtocol:(Protocol *)aProtocol {

	for (id item in self) {
		if (![item conformsToProtocol:aProtocol]) {
			return NO;
		}
	}

	return YES;
}

- (BOOL)objectsAreKindOfClass:(Class)aClass {
	for (id item in self) {
		if (![item isKindOfClass:aClass]) {
			return NO;
		}
	}

	return YES;
}

- (BOOL)all:(BOOL(^)(id item))block {
	for (id item in self) {
		if (!block(item)) {
			return NO;
		}
	}

	return YES;
}

- (NSArray *)subarraysWithCapacity:(NSUInteger)capacity {
	NSMutableArray *result = [NSMutableArray array];

	for (NSUInteger i = 0; i <= self.count; i += capacity) {
		if (i + capacity >= self.count) {
			break;
		}

		NSMutableArray *subarray = [NSMutableArray arrayWithCapacity:capacity];

		for (NSUInteger j = i; j < i + capacity && j < self.count; j++) {
			[subarray addObject:self[j]];
		}

		[result addObject:subarray.copy];
	}

	return result.copy;
}

- (NSDictionary *)dictionaryKey:(id<NSCopying>(^)(id item))key value:(id(^)(id item))value {
	NSMutableDictionary *result = [NSMutableDictionary dictionaryWithCapacity:self.count];

	for (id object in self) {
		result[key(object)] = value(object);
	}

	return result.copy;
}

- (id)penultimateObject {
	if (self.count >= 2) {
		return self[self.count - 2];
	}

	return nil;
}

- (BOOL)empty {
    return 0 == self.count;
}

- (NSArray *)distinct {
	NSMutableArray *filteredArray = [NSMutableArray array];

	for (id item in self) {
		if ([filteredArray containsObject:item]) {
			continue;
		}

		[filteredArray addObject:item];
	}

	return filteredArray;
}

@end

