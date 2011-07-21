#import "SpecHelper.h"
#import "JusticeSpecialObjectionModule.h"

SPEC_BEGIN(JusticeSpecialObjectionModuleSpec)

describe(@"JusticeSpecialObjectionModule", ^{
  __block JusticeSpecialObjectionModule *target = nil;
  __block UIWindow *window = nil;
  
  beforeEach(^{
    window = [[[UIWindow alloc] initWithFrame:CGRectZero] autorelease];
    target = [[[JusticeSpecialObjectionModule alloc] initWithWindow:window] autorelease];
    [target configure];
  });
  
  it(@"configures external objection dependencies", ^{
    NSDictionary *bindings = target.bindings;
    
    [[theValue(bindings.count) should] equal:theValue(1)];
    
    [[[[bindings objectForKey:@"UIWindow"] extractObject] should] equal:window];
  });
});

SPEC_END