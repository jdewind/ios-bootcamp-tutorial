#import <Foundation/Foundation.h>

@interface ControllerBuilder : NSObject {

}

- (id)buildNavControllerWithRootViewController:(UIViewController *)controller;
- (id)buildViewController:(Class)theClass withNib:(NSString *)nibName;
@end
