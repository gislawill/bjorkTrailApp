//
//  parasiticPlantViewController.m
//  Bjorklunden Trail Application
//
//  Created by William Gislason on 8/18/14.
//  Copyright (c) 2014 Gislawill. All rights reserved.
//

#import "parasiticPlantViewController.h"

@interface parasiticPlantViewController ()

@end

@implementation parasiticPlantViewController

@synthesize annotation = _annotation;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.label.font = [UIFont fontWithName:@"Aleo-Light" size:60];
    self.textBlock.font = [UIFont fontWithName:@"Aleo-Regular" size:22.75];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new]
                                                  forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    self.navigationController.navigationBar.translucent = YES;
    self.navigationController.view.backgroundColor = [UIColor clearColor];
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    
    UISwipeGestureRecognizer * Swiperight=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swiperight:)];
    Swiperight.direction=UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:Swiperight];
    
    UISwipeGestureRecognizer * Swipeleft=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeleft:)];
    Swipeleft.direction=UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:Swipeleft];
}

int c = 0;

-(void)swiperight:(UISwipeGestureRecognizer*)gestureRecognizer {
    if (c == 0) {
        [self.navigationController popViewControllerAnimated:YES];
    }
    if (c == 1) {
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:1];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
        self.label.center = CGPointMake( 178,  370);
        self.image.center = CGPointMake (560 , 512);
        self.textBlock.center = CGPointMake( 2400, 789);
        [UIView commitAnimations];
    }
    c--;
}

-(void)swipeleft:(UISwipeGestureRecognizer*)gestureRecognizer {
    if (c == 0) {
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:1];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
        self.label.center = CGPointMake( -400,  370);
        self.image.center = CGPointMake (150 , 512);
        self.textBlock.center = CGPointMake(498, 789);
        [UIView commitAnimations];
    } if (c == 1) {
        c--;
    }
    c++;
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    self.label.center = CGPointMake( -400,  370);
    self.image.center = CGPointMake (150, 512);
     self.textBlock.center = CGPointMake(498, 789);
    [UIView commitAnimations];
    c++;
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
