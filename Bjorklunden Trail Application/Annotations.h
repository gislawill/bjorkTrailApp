//
//  Annotations.h
//  Bjorklunden Trail Application
//
//  Created by William Gislason on 7/16/14.
//  Copyright (c) 2014 Gislawill. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface Annotations : NSObject <MKAnnotation>

@property(nonatomic, readonly) CLLocationCoordinate2D coordinate;

@property(copy, nonatomic) NSString *title;

@property(copy, nonatomic) NSString *annotationTitle;

-(id)initWithTitle:(NSString*)newTitle Location:(CLLocationCoordinate2D)location;

-(MKAnnotationView *)annotationView;


@end