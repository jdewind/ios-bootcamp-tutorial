#import <Foundation/Foundation.h>
#import "ControllerBuilder.h"

@interface ApplicationBootstrapper : NSObject {
  UIWindow *_window;
  ControllerBuilder *_controllerBuilder;
  UINavigationController *_navController;
}

@property (nonatomic, retain) ControllerBuilder *controllerBuilder;
@property (nonatomic, retain) UIWindow *window;
@property (nonatomic, retain) UINavigationController *navController;

- (void)bootstrap;
@end
