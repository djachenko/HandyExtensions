
#import <UIKit/UIKit.h>
#import "URLHelper.h"

@implementation URLHelper

+ (BOOL)openURLWithString:(NSString *)stringURL {
    
    NSURL *url = [NSURL URLWithString:stringURL];
    if (nil == url || url.scheme.length == 0) {
        url = [NSURL URLWithString:[NSString stringWithFormat:@"http://%@", stringURL]];
    }
    
    if ([[UIApplication sharedApplication] canOpenURL:url]) {
        [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:nil];
        return true;
    }
    return false;
}
@end
