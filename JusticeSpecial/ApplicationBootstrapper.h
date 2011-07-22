#import <Foundation/Foundation.h>
#import "RoutesBuilder.h"

@interface ApplicationBootstrapper : NSObject {
  UIWindow *_window;
  TTNavigator *_navigator;
  RoutesBuilder *_routesBuilder;
}

@property (nonatomic, retain) UIWindow *window;
@property (nonatomic, retain) TTNavigator *navigator;
@property (nonatomic, retain) RoutesBuilder *routesBuilder;

- (void)bootstrap;
@end
