
#import "DeviceTypeManager.h"

BOOL iPhone6(){
    CGFloat screenHeight = MAX([[UIScreen mainScreen] bounds].size.height, [[UIScreen mainScreen] bounds].size.width);
    return screenHeight==667.0;
}

BOOL iPhone5(){
    CGFloat screenHeight = MAX([[UIScreen mainScreen] bounds].size.height, [[UIScreen mainScreen] bounds].size.width);
    return screenHeight==568.0;
}

BOOL iPhone4s(){
    CGFloat screenHeight = MAX([[UIScreen mainScreen] bounds].size.height, [[UIScreen mainScreen] bounds].size.width);
    return screenHeight==480.0;
}

BOOL iPhone6P(){
    CGFloat screenHeight = MAX([[UIScreen mainScreen] bounds].size.height, [[UIScreen mainScreen] bounds].size.width);
    return screenHeight==736.0;
}

BOOL iPhoneX(){
    CGFloat screenHeight = MAX([[UIScreen mainScreen] bounds].size.height, [[UIScreen mainScreen] bounds].size.width);
    return screenHeight==812.0;
}

CGFloat deviceWidth(){
    return [[UIScreen mainScreen] bounds].size.width;
}

CGFloat viewWidth() {
    if (iPad()) {
        return MAX([[UIScreen mainScreen] bounds].size.height, [[UIScreen mainScreen] bounds].size.width) - 200;
    }
    else {
        return MIN([[UIScreen mainScreen] bounds].size.height, [[UIScreen mainScreen] bounds].size.width);
    }
}

CGFloat deviceHeight() {
    if (iPad()) {
        return MIN([[UIScreen mainScreen] bounds].size.height, [[UIScreen mainScreen] bounds].size.width);
    }
    else {
        return MAX([[UIScreen mainScreen] bounds].size.height, [[UIScreen mainScreen] bounds].size.width);
    }
}

BOOL iPad() {
    return (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad);
}
    
BOOL iPadPro(){
    return (UIDevice.currentDevice.userInterfaceIdiom == UIUserInterfaceIdiomPad && UIScreen.mainScreen.nativeBounds.size.height == 2732);
}
    
BOOL iPod() {
    return [[UIDevice currentDevice].model hasPrefix:@"iPod"];
}