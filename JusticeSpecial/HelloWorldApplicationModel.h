#import <Foundation/Foundation.h>
#import "HelloWorldTableViewController.h"
#import "ObjectionProvider.h"

@interface HelloWorldApplicationModel : NSObject {
  HelloWorldTableViewController *_controller;
  ObjectionProvider *_objectionProvider;
  NSArray *_texties;
}

@property (nonatomic, assign) HelloWorldTableViewController *controller;
@property (nonatomic, retain) ObjectionProvider *objectionProvider;

- (void)viewDidRequestModel;
@end
