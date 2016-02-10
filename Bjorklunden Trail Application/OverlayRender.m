//
//  OverlayRender.m
//  Bjorklunden Trail Application
//
//  Created by William Gislason on 7/18/14.
//  Copyright (c) 2014 Gislawill. All rights reserved.
//

#import "OverlayRender.h"

@implementation OverlayRender

- (void)drawMapRect:(MKMapRect)mapRect
          zoomScale:(MKZoomScale)zoomScale
          inContext:(CGContextRef)ctx
{
    
    UIImage *image = [UIImage imageNamed:@"OverlayBest.png"];
    
    
    MKMapRect theMapRect = [self.overlay boundingMapRect];
    CGRect theRect = [self rectForMapRect:theMapRect];
    
    UIGraphicsPushContext(ctx);
    [image drawInRect:theRect blendMode:kCGBlendModeNormal alpha:1.0];
    UIGraphicsPopContext();
    
    
    
}


@end
