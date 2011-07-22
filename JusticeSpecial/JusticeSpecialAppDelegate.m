#import "JusticeSpecialAppDelegate.h"
#import "JusticeSpecialObjectionModule.h"
#import "ApplicationBootstrapper.h"

@implementation JusticeSpecialAppDelegate


@synthesize window=_window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  self.window = [[[UIWindow alloc] initWithFrame:TTScreenBounds()] autorelease];  
  ObjectionInjector *injector = [Objection createInjector:[[[JusticeSpecialObjectionModule alloc] initWithWindow:self.window] autorelease]];
  [Objection setGlobalInjector:injector];
  ApplicationBootstrapper *bootstrapper = [[Objection globalInjector] getObject:[ApplicationBootstrapper class]];
  [bootstrapper bootstrap];
  return YES;
}

- (void)dealloc
{
  [_window release];
  [super dealloc];
}

@end
