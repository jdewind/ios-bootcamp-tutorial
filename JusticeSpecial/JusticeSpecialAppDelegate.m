#import "JusticeSpecialAppDelegate.h"
#import "JusticeSpecialObjectionModule.h"
#import "ApplicationBootstrapper.h"

@implementation JusticeSpecialAppDelegate


@synthesize window=_window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  CGSize screenSize = [UIScreen mainScreen].bounds.size;
  self.window = [[[UIWindow alloc] initWithFrame:CGRectMake(0, 0, screenSize.width, screenSize.height)] autorelease];  
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
