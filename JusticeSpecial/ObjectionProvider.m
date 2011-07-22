#import "ObjectionProvider.h"

@implementation ObjectionProvider
objection_register_singleton(ObjectionProvider)

- (id)provide:(id)protocolOrClass {
  return [[Objection globalInjector] getObject:protocolOrClass];
}

- (void)dealloc {
	[super dealloc];
}

@end
