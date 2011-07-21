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

- (void)showTextie:(NSString *)textie {
  UIAlertView *alert = [[[UIAlertView alloc] initWithTitle:@"Hello" message:textie delegate:nil cancelButtonTitle:nil otherButtonTitles:@"Okay", nil] autorelease];
  [alert show];
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
  self.tableView.delegate = self;
  self.tableView.dataSource = self;
  [super viewDidLoad];
}

- (void)viewDidUnload
{
  self.tableView.delegate = nil;
  self.tableView.dataSource = nil;
  [super viewDidUnload];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
  return [self.applicationModel numberOfSections];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  return [self.applicationModel numberOfRowsInSection:section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  static NSString *CellIdentifier = @"Cell";
  
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
  if (cell == nil) {
      cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
  }
  
  cell.textLabel.text = [self.applicationModel textForIndexPath:indexPath];
  return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
  [self.applicationModel userTappedCellAt:indexPath];
}

@end
