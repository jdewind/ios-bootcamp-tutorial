#import "HelloWorldApplicationModel.h"

@implementation HelloWorldApplicationModel
objection_register(HelloWorldApplicationModel)

@synthesize controller = _controller;
@synthesize texties = _texties;

- (void)awakeFromObjection {
  self.texties = [NSArray arrayWithObjects:@"Patrick Bacon", @"SWanderson", @"GPatt", nil];
}

- (NSInteger)numberOfSections {
  return 1;
}

- (NSInteger)numberOfRowsInSection:(NSInteger)section {
  return self.texties.count;
}

- (NSString *)textForIndexPath:(NSIndexPath *)indexPath {
  return [self.texties objectAtIndex:indexPath.row];
}

- (void)dealloc {
  [_texties release];
	[super dealloc];
}

@end
