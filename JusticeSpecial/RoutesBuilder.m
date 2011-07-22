#import "RoutesBuilder.h"

@implementation RoutesBuilder
objection_register_singleton(RoutesBuilder)
objection_requires(@"window")

@synthesize window = _window;

- (void)buildAll {
  TTNavigator *navigator = [TTNavigator navigator];
  navigator.window = self.window;
  navigator.persistenceMode = TTNavigatorPersistenceModeAll;
  TTURLMap *map = navigator.URLMap;

  //// Routes ////
  [map from:@"*" toViewController:[TTWebController class]];
  [map from:@"tt://hello_world" toViewController:NSClassFromString(@"HelloWorldTableViewController")];
  
  //// Resources ////

  [map from:NSClassFromString(@"Person") toURL:@"http://www.google.com/search?q=(urlName)"];
}

- (void)dealloc {  
  [_window release];
	[super dealloc];
}

@end
