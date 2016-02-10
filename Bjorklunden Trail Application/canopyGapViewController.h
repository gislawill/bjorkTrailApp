//
//  canopyGapViewController.h
//  Bjorklunden Trail Application
//
//  Created by William Gislason on 7/22/14.
//  Copyright (c) 2014 Gislawill. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Mapkit/MapKit.h>
#import "Annotations.h"

@interface canopyGapViewController : UIViewController


@property (strong, nonatomic) IBOutlet UILabel *textBlock;
@property (strong, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) Annotations* annotation;

@end
