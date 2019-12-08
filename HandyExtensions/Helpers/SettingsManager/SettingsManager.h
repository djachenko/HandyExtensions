
#import <Foundation/Foundation.h>

#define SharedSettingsManager [SettingsManager sharedClient]

@interface SettingsManager : NSObject

+ (SettingsManager *)sharedClient;

- (NSString *)getAppVersion;

- (NSString *)getBuildVersion;

@end
