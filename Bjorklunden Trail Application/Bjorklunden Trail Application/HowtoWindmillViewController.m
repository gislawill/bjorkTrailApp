//
//  HowtoWindmillViewController.m
//  Bjorklunden Trail Application
//
//  Created by William Gislason on 8/20/14.
//  Copyright (c) 2014 Gislawill. All rights reserved.
//

#import "HowtoWindmillViewController.h"

@interface HowtoWindmillViewController ()

@end

@implementation HowtoWindmillViewController

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
    self.textBlock.font = [UIFont fontWithName:@"Aleo-Regular" size:20];
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

int w = 0;

-(void)swiperight:(UISwipeGestureRecognizer*)gestureRecognizer {
    if (w == 0) {
        [self.navigationController popViewControllerAnimated:YES];
    }
    if (w == 1) {
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:1];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
        self.label.center = CGPointMake( 560, 129);
        self.image.center = CGPointMake( 435, 825);
        self.textBlock.center = CGPointMake( 2530, 295);
        self.Howto1.center = CGPointMake( 494, 889);
        self.Howto2.center = CGPointMake( 1290, 936);
        [UIView commitAnimations];
    }
    w--;
}

-(void)swipeleft:(UISwipeGestureRecognizer*)gestureRecognizer {
    if (w == 0) {
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:1];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
        self.label.center = CGPointMake( -560, 129);
        self.image.center = CGPointMake( 216, 825);
        self.textBlock.center = CGPointMake( 530, 295);
        self.Howto1.center = CGPointMake( -494, 889);
        self.Howto2.center = CGPointMake( 290, 936);
        self.Howto3.center = CGPointMake( 134, 152);
        [UIView commitAnimations];
    } if (w == 1) {
        w--;
    }
    w++;
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    if (w == 0) {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    self.label.center = CGPointMake( -560, 129);
    self.image.center = CGPointMake ( 216, 825);
    self.textBlock.center = CGPointMake( 530, 295);
    self.Howto1.center = CGPointMake( -494, 889);
    self.Howto2.center = CGPointMake( 290, 936);
    self.Howto3.center = CGPointMake( 134, 152);
    [UIView commitAnimations];
    w++;
    }  if (w == 1) {
        w--;
    }
    w++;
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
