//
//  MyFirstMap.m
//  ObjCoreSkills
//
//  Created by liudachris on 5/2/20.
//  Copyright © 2020 clrminded. All rights reserved.
//

#import "MyFirstMap.h"
#import "MapAnnotation.h"

@interface MyFirstMap ()


@end

@implementation MyFirstMap

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self configMap];
   
}
-(void) configMap
{
    _mapView = [[MKMapView alloc]init];
    //CGRectMake(10, 100, 300, 300)];
    _mapView.delegate = self;
    _mapView.centerCoordinate = CLLocationCoordinate2DMake(37.32, -122.03);
    _mapView.mapType = MKMapTypeHybrid;
    CLLocationCoordinate2D location;
    location.latitude = (double) 37.332768;
    location.longitude = (double) -122.030039;
    _mapView.zoomEnabled = YES;
    
    // Add the annotation to our map view
    MapAnnotation *newAnnotation = [[MapAnnotation alloc]
    initWithTitle:@"Apple Head quaters" andCoordinate:location];
    [_mapView addAnnotation:newAnnotation];
    //CLLocationCoordinate2D location2;
    //location2.latitude = (double) 37.35239;
    //location2.longitude = (double) -122.025919;
    //MapAnnotation *newAnnotation2 = [[MapAnnotation alloc]
    //initWithTitle:@"Test annotation" andCoordinate:location2];
    //[_mapView addAnnotation:newAnnotation2];
    [self.view addSubview:_mapView];
    
    [self mapConstraints];
}
-(void) mapConstraints
{
    _mapView.translatesAutoresizingMaskIntoConstraints = NO;
    [_mapView.topAnchor constraintEqualToAnchor: self.view.safeAreaLayoutGuide.topAnchor constant: 0].active = YES;
    [_mapView.bottomAnchor constraintEqualToAnchor: self.view.safeAreaLayoutGuide.bottomAnchor constant: 0].active = YES;
    [_mapView.leadingAnchor constraintEqualToAnchor: self.view.safeAreaLayoutGuide.leadingAnchor constant: 0].active = YES;
    [_mapView.trailingAnchor constraintEqualToAnchor: self.view.safeAreaLayoutGuide.trailingAnchor constant: 0].active = YES;
}

   // When a map annotation point is added, zoom to it (1500 range)
   - (void)mapView:(MKMapView *)mv didAddAnnotationViews:(NSArray *)views {
      MKAnnotationView *annotationView = [views objectAtIndex:0];
      id <MKAnnotation> mp = [annotationView annotation];
      MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance
      ([mp coordinate], 1500, 1500);
      [mv setRegion:region animated:YES];
      [mv selectAnnotation:mp animated:YES];
   }


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
