//
//  parasiticPlantViewController.h
//  Bjorklunden Trail Application
//
//  Created by William Gislason on 8/18/14.
//  Copyright (c) 2014 Gislawill. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Annotations.h"

@interface parasiticPlantViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *image;

@property (strong, nonatomic) IBOutlet UILabel *label;

@property (strong, nonatomic) IBOutlet UILabel *textBlock;

@property (weak, nonatomic) Annotations* annotation;

@end
