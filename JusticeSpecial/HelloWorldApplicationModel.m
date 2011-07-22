#import "HelloWorldApplicationModel.h"
#import "HelloWorldDataSource.h"

@implementation HelloWorldApplicationModel
objection_register(HelloWorldApplicationModel)
objection_requires(@"objectionProvider")

@synthesize controller = _controller;
@synthesize objectionProvider = _objectionProvider;

- (void)viewDidRequestModel {
  self.controller.dataSource = [self.objectionProvider provide:[HelloWorldDataSource class]];
}

- (void)dealloc {
  [_objectionProvider release];
  [_texties release];
	[super dealloc];
}

@end
