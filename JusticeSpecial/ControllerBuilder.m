#import "ControllerBuilder.h"

@implementation ControllerBuilder
objection_register_singleton(ControllerBuilder)

- (id)buildNavControllerWithRootViewController:(UIViewController *)controller {
  return [[[UINavigationController alloc] initWithRootViewController:controller] autorelease];
}

- (id)buildViewController:(Class)theClass withNib:(NSString *)nibName {
  return [[[theClass alloc] initWithNibName:nibName bundle:nil] autorelease];
}

- (void)dealloc {
	[super dealloc];
}

@end
