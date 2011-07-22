#import "Person.h"

@implementation Person
@synthesize name = _name;
@dynamic urlName;

+ (id)personWithName:(NSString *)name {
  Person *person = [[[Person alloc] init] autorelease];
  person.name = name;
  return person;
}

- (NSString *)urlName {
  return [self.name urlEncoded];
}
- (void)dealloc {
  [_name release];
	[super dealloc];
}

@end
