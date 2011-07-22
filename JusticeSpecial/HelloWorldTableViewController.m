#import "HelloWorldTableViewController.h"
#import "HelloWorldApplicationModel.h"

@implementation HelloWorldTableViewController
@synthesize applicationModel = _applicationModel;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
  if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
    self.title = @"Hello World";
    self.applicationModel = [[Objection globalInjector] getObject:[HelloWorldApplicationModel class]];
    self.applicationModel.controller = self;
  }
  return self;
}

#pragma mark - Methods

- (void)createModel {
  [self.applicationModel viewDidRequestModel];
}

- (void)dealloc
{   
  self.applicationModel.controller = nil;
  [_applicationModel release];
  [super dealloc];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
  [super viewDidLoad];
}

- (void)viewDidUnload
{
  [super viewDidUnload];
}


#pragma mark - UIViewController

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
@end
