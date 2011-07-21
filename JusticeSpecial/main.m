#import <UIKit/UIKit.h>
#import "JusticeSpecialAppDelegate.h"

int main(int argc, char *argv[])
{
  NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
  int retVal = UIApplicationMain(argc, argv, nil, [[JusticeSpecialAppDelegate class] description]);
  [pool release];
  return retVal;
}
