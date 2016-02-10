//
//  CliffsViewController.m
//  Bjorklunden Trail Application
//
//  Created by William Gislason on 8/7/14.
//  Copyright (c) 2014 Gislawill. All rights reserved.
//

#import "CliffsViewController.h"

@interface CliffsViewController ()

@end

@implementation CliffsViewController
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
    // Do any additional setup after loading the view.
    [super viewDidLoad];
    self.label.font = [UIFont fontWithName:@"Aleo-Light" size:45];
    self.textBlock.font = [UIFont fontWithName:@"Aleo-Regular" size:23.0];
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

int b = 0;

-(void)swiperight:(UISwipeGestureRecognizer*)gestureRecognizer {
    if (b == 0) {
        [self.navigationController popViewControllerAnimated:YES];
    }
    if (b == 1) {
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:1];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
        self.label.center = CGPointMake( 196, 589 );
        self.image.center = CGPointMake( 882, 482);
        self.textBlock.center = CGPointMake( 4512, 888);
        [UIView commitAnimations];
    }
    b--;
}

-(void)swipeleft:(UISwipeGestureRecognizer*)gestureRecognizer {
    if (b == 0) {
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:1];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
        self.label.center = CGPointMake( -2188, 589);
        self.image.center = CGPointMake( 250,  482);
        self.textBlock.center = CGPointMake(384, 888);
        [UIView commitAnimations];
    } if (b == 1) {
        b--;
    }
    b++;
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    self.label.center = CGPointMake( -2188, 589);
    self.image.center = CGPointMake (250, 482);
    self.textBlock.center = CGPointMake(384, 888);
    [UIView commitAnimations];
    b++;
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
