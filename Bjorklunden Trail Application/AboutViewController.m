//
//  AboutViewController.m
//  Bjorklunden Trail Application
//
//  Created by William Gislason on 7/24/14.
//  Copyright (c) 2014 Gislawill. All rights reserved.
//

#import "AboutViewController.h"

@interface AboutViewController ()

@end

@implementation AboutViewController

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
    self.label1.font = [UIFont fontWithName:@"Aleo-Light" size:36];
    self.textBlock1.font = [UIFont fontWithName:@"Aleo-Regular" size:18];
    self.label2.font = [UIFont fontWithName:@"Aleo-Light" size:36];
    self.textBlock2.font = [UIFont fontWithName:@"Aleo-Regular" size:18];
    self.label3.font = [UIFont fontWithName:@"Aleo-Light" size:36];
    self.textBlock3.font = [UIFont fontWithName:@"Aleo-Regular" size:18];
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

int f = 0;

-(void)swipeleft:(UISwipeGestureRecognizer*)gestureRecognizer {
   if (f == 0) {
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:1];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
        self.image.center = CGPointMake(384, 512);
        self.label1.center = CGPointMake(-500, 282);
        self.textBlock1.center = CGPointMake( -1384, 874);
        self.label2.center = CGPointMake( 146, 115);
        self.textBlock2.center = CGPointMake( 384, 784);
        [UIView commitAnimations];
        
    } if (f == 1) {
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:1];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
        self.image.center = CGPointMake(-384, 512);
        self.label2.center = CGPointMake( -1146, 115);
        self.textBlock2.center = CGPointMake( -1560, 784);
        self.label3.center = CGPointMake( 586, 116);
        self.textBlock3.center = CGPointMake( 384, 766);
        [UIView commitAnimations];
        
    } if (f == 2) {
        f--;
    } f++;
}

-(void)swiperight:(UISwipeGestureRecognizer*)gestureRecognizer {
    if (f == 1) {
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:1];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
        self.image.center = CGPointMake(1152, 512);
        self.label1.center = CGPointMake( 272, 282);
        self.textBlock1.center = CGPointMake( 384, 874);
        self.label2.center = CGPointMake( 2146, 115);
        self.textBlock2.center = CGPointMake( 2384, 784);
        [UIView commitAnimations];
    }if (f == 2) {
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:1];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
        self.image.center = CGPointMake(384, 512);
        self.label3.center = CGPointMake( 2586, 116);
        self.textBlock3.center = CGPointMake( 2384, 766);
        self.label2.center = CGPointMake( 146, 115);
        self.textBlock2.center = CGPointMake( 384, 784);
        [UIView commitAnimations];
    }if (f == 0) {
        [self.navigationController popViewControllerAnimated:YES];
    }
     f--;
    }

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    if (f == 0) {
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:1];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
        self.image.center = CGPointMake(384, 512);
        self.label1.center = CGPointMake(-500, 282);
        self.textBlock1.center = CGPointMake( -1384, 874);
        self.label2.center = CGPointMake( 146, 143);
        self.textBlock2.center = CGPointMake( 384, 784);
        [UIView commitAnimations];
        
    } if (f == 1) {
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:1];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
        self.image.center = CGPointMake(-384, 512);
        self.label2.center = CGPointMake( -1146, 143);
        self.textBlock2.center = CGPointMake( -1560, 784);
        self.label3.center = CGPointMake( 586, 116);
        self.textBlock3.center = CGPointMake( 384, 766);
        [UIView commitAnimations];
        
    } if (f == 2) {
        f--;
    } f++;
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
