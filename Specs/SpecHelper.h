#define __SPEC_HELPER

#define HC_SHORTHAND

#define KIWI_DISABLE_MACRO_API

#import <OCHamcrest-iPhone/OCHamcrest.h>
#import "Kiwi.h"
#import <Objection-iOS/Objection.h>


id mockProperty(id target, NSString *propertyName);
id mockPropertyForClass(id target, NSString *propertyName, Class theClass);
void mockProperties(id target, id property, ...) NS_REQUIRES_NIL_TERMINATION;
