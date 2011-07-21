#import "SpecHelper.h"
#import "ApplicationBootstrapper.h"
#import "HelloWorldTableViewController.h"

SPEC_BEGIN(ApplicationBootstrapperSpec)

describe(@"ApplicationBootstrapper", ^{
  __block ApplicationBootstrapper *target = nil;
  __block id window = nil;
  __block id controllerBuilder = nil;
  
  beforeEach(^{
    target = [[[ApplicationBootstrapper alloc] init] autorelease];    
    window = mockProperty(target, @"window");
    controllerBuilder = mockProperty(target, @"controllerBuilder");
  });
  
  describe(@"#bootstrap", ^{
    __block id navController = nil;
    __block id viewController = nil;
    
    beforeEach(^{
      navController = [UINavigationController mock];
      viewController = [UIViewController mock];
      
      [[navController stubAndReturn:@"the view"] view];
    });
    
    it(@"sets up the application", ^{
      [[controllerBuilder stubAndReturn:viewController] buildViewController:[HelloWorldTableViewController class] withNib:nil];
      [[controllerBuilder stubAndReturn:navController] buildNavControllerWithRootViewController:viewController];
      [[[window should] receive] addSubview:(id)@"the view"];
      [[[window should] receive] makeKeyAndVisible];
      [target bootstrap];
    });
  });
});

SPEC_END