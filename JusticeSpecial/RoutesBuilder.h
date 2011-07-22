#import <Foundation/Foundation.h>

@interface RoutesBuilder : NSObject {
  UIWindow *_window;
}

@property (nonatomic, retain) UIWindow *window;

- (void)buildAll;
@end
