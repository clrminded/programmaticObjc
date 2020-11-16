#import "MapAnnotation.h"

@implementation MapAnnotation

-(id)initWithTitle:(NSString *)title andCoordinate:
   (CLLocationCoordinate2D)coordinate2d {
  
   //self.title = title;
   self.coordinate =coordinate2d;
   return self;
}

@end

