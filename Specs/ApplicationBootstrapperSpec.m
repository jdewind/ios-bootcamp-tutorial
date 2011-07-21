#import "SpecHelper.h"
#import "ApplicationBootstrapper.h"

SPEC_BEGIN(ApplicationBootstrapperSpec)

describe(@"ApplicationBootstrapper", ^{
  __block ApplicationBootstrapper *target = nil;
  __block id window = nil;
  
  beforeEach(^{
    target = [[[ApplicationBootstrapper alloc] init] autorelease];    
    window = mockProperty(target, @"window");
  });
  
  describe(@"#bootstrap", ^{
    it(@"sets up the application", ^{
      [[[window should] receive] makeKeyAndVisible];
      [target bootstrap];
    });
  });
});

SPEC_END