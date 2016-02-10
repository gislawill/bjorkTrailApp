//
//  windMillViewController.m
//  Bjorklunden Trail Application
//
//  Created by William Gislason on 8/18/14.
//  Copyright (c) 2014 Gislawill. All rights reserved.
//

#import "windMillViewController.h"

@interface windMillViewController ()

@end

@implementation windMillViewController

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
    self.label.font = [UIFont fontWithName:@"Aleo-Light" size:45];
    self.textBlock.font = [UIFont fontWithName:@"Aleo-Regular" size:22];
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

int d = 0;

-(void)swiperight:(UISwipeGestureRecognizer*)gestureRecognizer {
    if (d == 0) {
        [self.navigationController popViewControllerAnimated:YES];
    }
    if (d == 1) {
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:1];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
        self.label.center = CGPointMake( 560, 129);
        self.image.center = CGPointMake( 435, 825);
        self.textBlock.center = CGPointMake( 2530, 344);
        [UIView commitAnimations];
    }
    d--;
}

-(void)swipeleft:(UISwipeGestureRecognizer*)gestureRecognizer {
    if (d == 0) {
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:1];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
        self.label.center = CGPointMake( -560, 129);
        self.image.center = CGPointMake( 216, 825);
        self.textBlock.center = CGPointMake( 517, 296);
        [UIView commitAnimations];
    } if (d == 1) {
        d--;
    }
    d++;
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    self.label.center = CGPointMake( -560, 129);
    self.image.center = CGPointMake ( 216, 825);
    self.textBlock.center = CGPointMake( 517, 296);
    [UIView commitAnimations];
    d++;
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
