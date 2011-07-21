#import "SpecHelper.h"
#import <objc/runtime.h>

static void fail(NSString *message) {
  @throw [NSException exceptionWithName:@"KWException" reason:message userInfo:nil];
}

static NSString * _parseClassOrProtocolName(NSString *propertyName,id target) {
  objc_property_t property = class_getProperty([target class], (const char *)[propertyName UTF8String]);
  
  if (!property) {
    fail([NSString stringWithFormat:@"Unable to find property '%@ on %@", propertyName, NSStringFromClass([target class])]);
  }
  
  NSString *attributes = [NSString stringWithCString: property_getAttributes(property) encoding: NSASCIIStringEncoding];  
  
  NSRange startRange = [attributes rangeOfString:@"T@\""];
  if (startRange.location == NSNotFound) {
    fail([NSString stringWithFormat:@"Unable to determine class type for property declaration: '%@'", propertyName]);
  }
  
  NSString *startOfClassName = [attributes substringFromIndex:startRange.length];
  NSRange endRange = [startOfClassName rangeOfString:@"\""];
  
  if (endRange.location == NSNotFound) {
    fail([NSString stringWithFormat:@"Unable to determine class type for property declaration: '%@'", propertyName]);        
  }
  
  return [startOfClassName substringToIndex:endRange.location];
}

id mockProperty(id target, NSString *propertyName) {
  
  NSString *className = _parseClassOrProtocolName(propertyName,target);  
  id theClass = nil;
  SEL mockSelector;
  
  if ([className hasPrefix:@"<"] && [className hasSuffix:@">"]) {
    className = [className stringByReplacingOccurrencesOfString:@"<" withString:@""];
    className = [className stringByReplacingOccurrencesOfString:@">" withString:@""];
    theClass = objc_getProtocol([className UTF8String]);
    mockSelector = @selector(mockWithName:forProtocol:);
  } else {
    theClass = NSClassFromString(className);    
    mockSelector = @selector(mockWithName:forClass:);
  }

  if(!theClass) {
    fail([NSString stringWithFormat:@"Unable get class or protocol for '%@' for property '%@'", className, propertyName]);            
  }
  
  id mock = [KWMock performSelector:mockSelector withObject:propertyName withObject:theClass];
  [target setValue:mock forKey:propertyName];  
  return mock;      
}


void mockProperties(id target, id property, ...) {
  va_list args;
  va_start(args, property);
  id arg;
  for (arg = property; arg != nil; arg = va_arg(args, id))
    mockProperty(target, arg);
}


id mockPropertyForClass(id target, NSString *propertyName, Class theClass) {
  id mock = [KWMock mockForClass:theClass];
  [target setValue:mock forKey:propertyName];
  return mock;
}