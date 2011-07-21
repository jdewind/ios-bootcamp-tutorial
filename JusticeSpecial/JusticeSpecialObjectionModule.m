#import "JusticeSpecialObjectionModule.h"

@implementation JusticeSpecialObjectionModule
@synthesize window = _window;

- (id)initWithWindow:(UIWindow *)window {
  if ((self = [super init])) {
    _window = [window retain];
  }
  return self;
}

- (void)configure {
  [self bind:self.window toClass:[UIWindow class]];
}

- (void)dealloc {
  [_window release];
	[super dealloc];
}

@end
