//
//  ViewController.h
//  Bjorklunden Trail Application
//
//  Created by William Gislason on 7/16/14.
//  Copyright (c) 2014 Gislawill. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "Annotations.h"
#import "TableForPopoverTableViewController.h"

@interface ViewController : UIViewController <MKMapViewDelegate> {
    
    CLLocationManager *locationManager;
    CLLocation *location;

}

@property (weak, nonatomic) Annotations* selectedAnnotation;

@property (strong, nonatomic) IBOutlet MKMapView *mapView;

@property (nonatomic, strong) TableForPopoverTableViewController *featureList;

@property (nonatomic, strong) UIPopoverController *featureListPopover;

-(IBAction)showListButtonTapped:(id)sender;

@property (strong, nonatomic) IBOutlet UIImageView *overWithLabels;

@property (strong, nonatomic) IBOutlet UIButton *withLabels;


@end
