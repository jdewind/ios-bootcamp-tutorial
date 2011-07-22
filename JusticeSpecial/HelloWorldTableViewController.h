#import <UIKit/UIKit.h>

@class HelloWorldApplicationModel;

@interface HelloWorldTableViewController : TTTableViewController {
  HelloWorldApplicationModel *_applicationModel;
}

@property (nonatomic, retain) HelloWorldApplicationModel *applicationModel;
@end
