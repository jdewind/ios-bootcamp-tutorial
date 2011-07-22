#import <Foundation/Foundation.h>

@interface HelloWorldDataSource : TTListDataSource {
  NSArray *_people;
}

@property (nonatomic, retain) NSArray *people;
@end
