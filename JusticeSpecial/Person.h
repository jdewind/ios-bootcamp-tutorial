#import <Foundation/Foundation.h>

@interface Person : NSObject {
  NSString *_name;
}

+ (id)personWithName:(NSString *)name;

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *urlName;
@end
