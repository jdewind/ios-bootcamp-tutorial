//
//  HelloWorldTableViewController.h
//  JusticeSpecial
//
//  Created by Justin DeWind on 7/21/11.
//  Copyright 2011 Atomic Object. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HelloWorldApplicationModel;

@interface HelloWorldTableViewController : UITableViewController {
  HelloWorldApplicationModel *_applicationModel;
}

@property (nonatomic, retain) HelloWorldApplicationModel *applicationModel;
@end
