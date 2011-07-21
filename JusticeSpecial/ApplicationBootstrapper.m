#import "ApplicationBootstrapper.h"
#import "HelloWorldTableViewController.h"

@implementation ApplicationBootstrapper
objection_register_singleton(ApplicationBootstrapper)
objection_requires(@"window", @"controllerBuilder")

@synthesize window = _window;
@synthesize controllerBuilder = _controllerBuilder;
@synthesize navController = _navController;

- (void)bootstrap {
  UITableViewController *viewController = [self.controllerBuilder 
                                           buildViewController:[HelloWorldTableViewController class] 
                                           withNib:nil];
  self.navController = [self.controllerBuilder 
                                           buildNavControllerWithRootViewController:viewController];
  [self.window addSubview:self.navController.view];
  [self.window makeKeyAndVisible];
}

- (void)dealloc {
  [_navController release];
  [_controllerBuilder release];
  [_window release];
	[super dealloc];
}

@end
