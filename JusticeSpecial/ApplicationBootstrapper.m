#import "ApplicationBootstrapper.h"
#import "HelloWorldTableViewController.h"

@implementation ApplicationBootstrapper
objection_register_singleton(ApplicationBootstrapper)
objection_requires(@"window", @"routesBuilder", @"navigator")

@synthesize window = _window;
@synthesize navigator = _navigator;
@synthesize routesBuilder = _routesBuilder;

- (void)bootstrap {
  [self.routesBuilder buildAll];
  if (![self.navigator restoreViewControllers]) {
    [self.navigator openURLs:@"tt://hello_world", nil];
  }
  [self.window makeKeyAndVisible];
}

- (void)dealloc {
  [_navigator release];
  [_routesBuilder release];
  [_window release];
	[super dealloc];
}

@end
