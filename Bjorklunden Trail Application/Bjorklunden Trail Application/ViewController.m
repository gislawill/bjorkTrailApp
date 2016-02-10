//
//  ViewController.m
//  Bjorklunden Trail Application
//
//  Created by William Gislason on 7/16/14.
//  Copyright (c) 2014 Gislawill. All rights reserved.
//

#import "ViewController.h"
#import "Annotations.h"
#import "nurseStumpViewController.h"
#import "canopyGapViewController.h"
#import "cedarsOnRocksViewController.h"
#import "OverlayObject.h"
#import "OverlayRender.h"
#import "TableForPopoverTableViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new]
                                                  forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    self.navigationController.navigationBar.translucent = YES;
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
   	locationManager = [[CLLocationManager alloc] init];
    [locationManager startUpdatingLocation];
    _mapView.showsUserLocation = YES;
    _mapView.delegate = self;
    
    //Setting the Visable Region
    CLLocationCoordinate2D center = CLLocationCoordinate2DMake(45.034679, -87.133851);
    MKCoordinateRegion adjustedRegion = [_mapView regionThatFits:MKCoordinateRegionMakeWithDistance(center, 2000, 1900)];
    [self.mapView setRegion: adjustedRegion animated:YES];
    
    //Add Overlay
    OverlayObject *mapOverlay = [[OverlayObject alloc] init];
    mapOverlay.canReplaceMapContent = YES;
    [_mapView addOverlay:mapOverlay];
    
    //Add each annotation 
    CLLocationCoordinate2D nurseStumpCoord = CLLocationCoordinate2DMake(    45.037552122, -87.129657771);
    Annotations *nurseStump = [[Annotations alloc] initWithTitle:@"Nurse Stump" Location:nurseStumpCoord];
    [self.mapView addAnnotation:nurseStump];
    
    CLLocationCoordinate2D canopyGapCoord = CLLocationCoordinate2DMake(     45.032135223, -87.131379542);
    Annotations *canopyGap = [[Annotations alloc] initWithTitle:@"Canopy Gap" Location:canopyGapCoord];
    [self.mapView addAnnotation:canopyGap];
    
    CLLocationCoordinate2D cedarsOnRocksCoord = CLLocationCoordinate2DMake( 45.034889742, -87.131200554);
    Annotations *cedarsOnRocks = [[Annotations alloc] initWithTitle:@"Cedars and Rocks" Location:cedarsOnRocksCoord];
    [self.mapView addAnnotation:cedarsOnRocks];
    
    CLLocationCoordinate2D cracksInRocksCoord = CLLocationCoordinate2DMake( 45.038381514, -87.131654267);
    Annotations *cracksInRocks = [[Annotations alloc] initWithTitle:@"A Broken Ground" Location:cracksInRocksCoord];
    [self.mapView addAnnotation:cracksInRocks];
    
    CLLocationCoordinate2D rocksOnLakeCoord = CLLocationCoordinate2DMake(   45.034260564,  -87.130606625);
    Annotations *rocksOnLake = [[Annotations alloc] initWithTitle:@"Björklunden's Shoreline" Location:rocksOnLakeCoord];
    [self.mapView addAnnotation:rocksOnLake];
    
    CLLocationCoordinate2D ancientShorelineCoord = CLLocationCoordinate2DMake(45.033889742, -87.131181554);
    Annotations *ancientShoreline = [[Annotations alloc] initWithTitle:@"Ancient Shoreline" Location:ancientShorelineCoord];
    [self.mapView addAnnotation:ancientShoreline];
    
    CLLocationCoordinate2D parasiticPlantsCoord = CLLocationCoordinate2DMake(45.036414578, -87.130561856);
    Annotations *parasiticPlants = [[Annotations alloc] initWithTitle:@"Parasitic Plants" Location:parasiticPlantsCoord];
    [self.mapView addAnnotation:parasiticPlants];
    
    CLLocationCoordinate2D burlCoord = CLLocationCoordinate2DMake(45.029390244, -87.136892366);
    Annotations *burl = [[Annotations alloc] initWithTitle:@"A Tree's Blister" Location:burlCoord];
    [self.mapView addAnnotation:burl];
    
    CLLocationCoordinate2D windmillCoord = CLLocationCoordinate2DMake(45.037211553, -87.1340722);
    Annotations *windmill = [[Annotations alloc] initWithTitle:@"Björk's Windmill" Location:windmillCoord];
    [self.mapView addAnnotation:windmill];
    
    CLLocationCoordinate2D juniperShrublandCoord = CLLocationCoordinate2DMake(45.033645526, -87.136493674);
    Annotations *juniperShrubland = [[Annotations alloc] initWithTitle:@"Juniper Shrubland" Location:juniperShrublandCoord];
    [self.mapView addAnnotation:juniperShrubland];

    CLLocationCoordinate2D quarryCoord = CLLocationCoordinate2DMake(45.033545526, -87.138493674);
    Annotations *quarry = [[Annotations alloc] initWithTitle:@"Quarry" Location:quarryCoord];
    [self.mapView addAnnotation:quarry];
    
    CLLocationCoordinate2D forestSwitchCoord = CLLocationCoordinate2DMake(45.029742852, -87.132714228);
    Annotations *forestSwitch = [[Annotations alloc] initWithTitle:@"Switch in Forest" Location:forestSwitchCoord];
    [self.mapView addAnnotation:forestSwitch];
    
    [_withLabels addTarget:self action:@selector(holdDown:) forControlEvents:UIControlEventTouchDown];
    [_withLabels addTarget:self action:@selector(holdRelease:) forControlEvents:UIControlEventTouchUpInside];
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation {
    static NSString *identifier = @"Annotation";
    if ([annotation isKindOfClass:[Annotations class]]) {
        
        MKPinAnnotationView *annotationView = (MKPinAnnotationView *) [mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
        if (annotationView == nil) {
            annotationView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:identifier];
            annotationView.enabled = YES;
            annotationView.canShowCallout = YES;
            annotationView.image = [UIImage imageNamed:@"annotationMarkerDraft2.png"];
            annotationView.centerOffset = CGPointMake( 0, -30);
            annotationView.calloutOffset = CGPointMake( 0, -3);
            annotationView.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        } else {
            annotationView.annotation = annotation;
        }
        
        return annotationView;
    }
    
    return nil;
}


-(void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control{
    //Check if the annotation is of our annotation class
    if ([view.annotation isKindOfClass:[Annotations class]]) {
        _selectedAnnotation = view.annotation;
        //Add new segues here
        if ([[_selectedAnnotation title] isEqualToString:@"Nurse Stump"]) {
            [self performSegueWithIdentifier:@"Nurse Stump" sender:self];
        }
        if ([[_selectedAnnotation title] isEqualToString:@"Canopy Gap"]) {
            [self performSegueWithIdentifier:@"Canopy Gap" sender:self];
        }
        if ([[_selectedAnnotation title] isEqualToString:@"Cedars and Rocks"]) {
            [self performSegueWithIdentifier:@"Cedars and Rocks" sender:self];
        }
        if ([[_selectedAnnotation title] isEqualToString:@"A Broken Ground"]) {
            [self performSegueWithIdentifier:@"A Broken Ground" sender:self];
        }
        if ([[_selectedAnnotation title] isEqualToString:@"Björklunden's Shoreline"]) {
            [self performSegueWithIdentifier:@"Björklunden's Shoreline" sender:self];
        }
        if ([[_selectedAnnotation title] isEqualToString:@"Ancient Shoreline"]) {
            [self performSegueWithIdentifier:@"Ancient Shoreline" sender:self];
        }
        if ([[_selectedAnnotation title] isEqualToString:@"Parasitic Plants"]) {
            [self performSegueWithIdentifier:@"Parasitic Plants" sender:self];
        }
        if ([[_selectedAnnotation title] isEqualToString:@"A Tree's Blister"]) {
            [self performSegueWithIdentifier:@"A Tree's Blister" sender:self];
        }
        if ([[_selectedAnnotation title] isEqualToString:@"Björk's Windmill"]) {
            [self performSegueWithIdentifier:@"Björk's Windmill" sender:self];
        }
        if ([[_selectedAnnotation title] isEqualToString:@"Juniper Shrubland"]) {
            [self performSegueWithIdentifier:@"Juniper Shrubland" sender:self];
        }
        if ([[_selectedAnnotation title] isEqualToString:@"Quarry"]) {
            [self performSegueWithIdentifier:@"Quarry" sender:self];
        }
        if ([[_selectedAnnotation title] isEqualToString:@"Switch in Forest"]) {
            [self performSegueWithIdentifier:@"Switch in Forest" sender:self];
        }
    }
}

/*
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Check that the segue is our showPinDetails-segue (Do not need to change segue id)
    if ([segue.identifier isEqualToString:@"detailsPlease"]) {
            canopyGapViewController *detail = [segue destinationViewController];
            detail.annotation = _selectedAnnotation;
    }
}
*/

- (MKOverlayRenderer *)mapView:(MKMapView *)mapView rendererForOverlay:(id<MKOverlay>)overlay {
    
    OverlayRender *mapOverlay = [[OverlayRender alloc] initWithOverlay:overlay];
    return mapOverlay;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - IBActions
-(IBAction)showListButtonTapped:(id)sender
{
    if (_featureList == nil) {
        //Create the ColorPickerViewController.
        _featureList = [[TableForPopoverTableViewController alloc] initWithStyle:UITableViewStylePlain];
        
        //Set this VC as the delegate.
        _featureList.delegate = self;
    }
    
    if (_featureListPopover == nil) {
        //The color picker popover is not showing. Show it.
        _featureListPopover = [[UIPopoverController alloc] initWithContentViewController:_featureList];
        [_featureListPopover presentPopoverFromBarButtonItem:(UIBarButtonItem *)sender
                                    permittedArrowDirections:UIPopoverArrowDirectionUp animated:YES];
    } else {
        //The color picker popover is showing. Hide it.
        [_featureListPopover dismissPopoverAnimated:YES];
        _featureListPopover = nil;
    }
}


-(void)selectedFeature:(NSString *)feature
{
    if ([feature  isEqual: @"Nurse Stump"]) {
        [self performSegueWithIdentifier:@"Nurse Stump" sender:self];
    }
    if ([feature isEqualToString:@"Canopy Gap"]) {
        [self performSegueWithIdentifier:@"Canopy Gap" sender:self];
    }
    if ([feature isEqualToString:@"Cedars and Rocks"]) {
        [self performSegueWithIdentifier:@"Cedars and Rocks" sender:self];
    }
    if ([feature isEqualToString:@"A Broken Ground"]) {
        [self performSegueWithIdentifier:@"A Broken Ground" sender:self];
    }
    if ([feature isEqualToString:@"Björklunden's Shoreline"]) {
        [self performSegueWithIdentifier:@"Björklunden's Shoreline" sender:self];
    }
    if ([feature isEqualToString:@"Ancient Shoreline"]) {
        [self performSegueWithIdentifier:@"Ancient Shoreline" sender:self];
    }
    if ([feature isEqualToString:@"Parasitic Plants"]) {
        [self performSegueWithIdentifier:@"Parasitic Plants" sender:self];
    }
    if ([feature isEqualToString:@"A Tree's Blister"]) {
        [self performSegueWithIdentifier:@"A Tree's Blister" sender:self];
    }
    if ([feature isEqualToString:@"Björk's Windmill"]) {
        [self performSegueWithIdentifier:@"Björk's Windmill" sender:self];
    }
    if ([feature isEqualToString:@"Juniper Shrubland"]) {
        [self performSegueWithIdentifier:@"Juniper Shrubland" sender:self];
    }
    if ([feature isEqualToString:@"Quarry"]) {
        [self performSegueWithIdentifier:@"Quarry" sender:self];
    }
    if ([feature isEqualToString:@"Switch in Forest"]) {
        [self performSegueWithIdentifier:@"Switch in Forest" sender:self];
    }

    //Dismiss the popover if it's showing.
    if (_featureListPopover) {
        [_featureListPopover dismissPopoverAnimated:YES];
        _featureListPopover = nil;
    }
}


-(void)holdDown:(id)sender {
    _overWithLabels.alpha = 1.0;
}
-(void)holdRelease:(id)sender {
    _overWithLabels.alpha = 0;
}
    


@end

