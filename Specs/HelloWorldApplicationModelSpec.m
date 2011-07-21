#import "SpecHelper.h"
#import "HelloWorldApplicationModel.h"

SPEC_BEGIN(HelloWorldApplicationModelSpec)

describe(@"HelloWorldApplicationModel", ^{
  __block HelloWorldApplicationModel *target = nil;
  __block id controller = nil;
  
  beforeEach(^{
    target = [[[HelloWorldApplicationModel alloc] init] autorelease];
    controller = mockProperty(target, @"controller");
    [target awakeFromObjection];
  });
  
  describe(@"#numberOfSections", ^{
    it(@"returns 1", ^{
      [[theValue([target numberOfSections]) should] equal:theValue(1)];
    });
  });
  
  describe(@"#numberOfRowInSection:", ^{
    it(@"returns the number of items in the texties collection", ^{
      [[theValue([target numberOfRowsInSection:0]) should] equal:theValue(3)];
    });
  });
  
  describe(@"#textForIndexPath:", ^{
    it(@"returns the text for the given index path", ^{
      [[[target textForIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]] should] equal:@"Patrick Bacon"];
      [[[target textForIndexPath:[NSIndexPath indexPathForRow:1 inSection:0]] should] equal:@"SWanderson"];
      [[[target textForIndexPath:[NSIndexPath indexPathForRow:2 inSection:0]] should] equal:@"GPatt"];
    });
  });
  
  describe(@"#userTappedCellAt:", ^{
    it(@"shows an alert with text at the index path", ^{
      [[[controller should] receive] showTextie:@"GPatt"];
      [target userTappedCellAt:[NSIndexPath indexPathForRow:2 inSection:0]];
    });
  });

});

SPEC_END