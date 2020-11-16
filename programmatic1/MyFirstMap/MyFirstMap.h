//
//  MyFirstMap.h
//  ObjCoreSkills
//
//  Created by liudachris on 5/2/20.
//  Copyright © 2020 clrminded. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MyFirstMap : UIViewController  <MKMapViewDelegate>

@property (retain, nonatomic) MKMapView *mapView;

@end

NS_ASSUME_NONNULL_END

