//
//  nurseStumpViewController.h
//  Bjorklunden Trail Application
//
//  Created by William Gislason on 7/22/14.
//  Copyright (c) 2014 Gislawill. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Mapkit/MapKit.h>
#import "Annotations.h"

@interface nurseStumpViewController : UIViewController

@property (strong, nonatomic) UISwipeGestureRecognizer * recognizer;

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event;

@property (strong, nonatomic) UINavigationBar* navigationBar;

@property (weak, nonatomic) IBOutlet UIImageView *image;

@property (strong, nonatomic) IBOutlet UILabel *label;

@property (strong, nonatomic) IBOutlet UILabel *textBlock;

@property (strong) Annotations *annotation;

@end
