#import "HelloWorldDataSource.h"
#import "MACollectionUtilities.h"
#import "Person.h"

@implementation HelloWorldDataSource
objection_register(HelloWorldDataSource)

@synthesize people = _people;

- (void)awakeFromObjection {
  self.people = ARRAY(
                      [Person personWithName:@"Bacon"],
                      [Person personWithName:@"GPatt"],
                      [Person personWithName:@"SWanderson"],
                      [Person personWithName:@"Croz"]
                      );
}

- (void)tableViewDidLoadModel:(UITableView *)tableView {
  NSLog(@"value: %@", [[self.people objectAtIndex:0] URLValue]);
  self.items = [[MAP(self.people, [TTTableTextItem itemWithText:[obj name] URL:[obj URLValue]]) mutableCopy] autorelease];
}

- (void)dealloc {
  [_people release];
	[super dealloc];
}

@end
