
#import "SettingsManager.h"

@implementation SettingsManager

+ (SettingsManager *)sharedClient {
    static SettingsManager *_sharedClient = nil;
    static dispatch_once_t oncePredicate;

    dispatch_once(&oncePredicate, ^{
        _sharedClient = [[SettingsManager alloc] init];
    });

    return _sharedClient;
}

- (NSString *)getAppVersion{
    NSDictionary *infoDict = [[NSBundle mainBundle] infoDictionary];

    return infoDict[@"CFBundleShortVersionString"];
}

- (NSString *)getBuildVersion{
    NSDictionary *infoDict = [[NSBundle mainBundle] infoDictionary];

    return infoDict[@"CFBundleVersion"];
}

@end
