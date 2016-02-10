//
//  OverlayObject.m
//  Bjorklunden Trail Application
//
//  Created by William Gislason on 7/18/14.
//  Copyright (c) 2014 Gislawill. All rights reserved.
//

#import "OverlayObject.h"

@implementation OverlayObject

@synthesize coordinate, bjorkOverlayCenterPoint, bjorkOverlayBoundingMapRect;

-(MKMapRect)boundingMapRect{
    CLLocationCoordinate2D lowerLeftCoord = CLLocationCoordinate2DMake(  45.025030 ,-87.145902);
    MKMapPoint lowerLeft = MKMapPointForCoordinate(lowerLeftCoord);
    CLLocationCoordinate2D upperRightCoord = CLLocationCoordinate2DMake( 45.045928, -87.119400);
    MKMapPoint upperRight = MKMapPointForCoordinate(upperRightCoord);
    MKMapRect mapRect = MKMapRectMake(lowerLeft.x, upperRight.y, upperRight.x - lowerLeft.x, lowerLeft.y - upperRight.y);
    
    return mapRect;
}


- (CLLocationCoordinate2D)bjorkOverlayCenterPoint
{
    CLLocationCoordinate2D coord1 = {
        45.035728,-87.1356855
    };
    
    return coord1;
}






@end