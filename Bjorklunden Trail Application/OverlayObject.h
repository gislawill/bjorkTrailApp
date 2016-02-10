//
//  OverlayObject.h
//  Bjorklunden Trail Application
//
//  Created by William Gislason on 7/18/14.
//  Copyright (c) 2014 Gislawill. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface OverlayObject : NSObject <MKOverlay>

@property (nonatomic, assign) CLLocationCoordinate2D bjorkOverlayCenterPoint;

@property (nonatomic) MKMapRect bjorkOverlayBoundingMapRect;

@property (nonatomic) BOOL canReplaceMapContent;

@end
