#import <Foundation/Foundation.h>
#import "HelloWorldTableViewController.h"

@interface HelloWorldApplicationModel : NSObject {
  HelloWorldTableViewController *_controller;
  NSArray *_texties;
}

- (NSInteger)numberOfSections;
- (NSInteger)numberOfRowsInSection:(NSInteger)section;
- (NSString *)textForIndexPath:(NSIndexPath *)indexPath;

@property (nonatomic, assign) HelloWorldTableViewController *controller;
@property (nonatomic, retain) NSArray *texties;

@end
