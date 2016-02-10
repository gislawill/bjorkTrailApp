//
//  burlViewController.m
//  Bjorklunden Trail Application
//
//  Created by William Gislason on 8/18/14.
//  Copyright (c) 2014 Gislawill. All rights reserved.
//

#import "burlViewController.h"

@interface burlViewController ()

@end

@implementation burlViewController

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
    
    UISwipeGestureRecognizer * Swipeup=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeup:)];
    Swipeup.direction=UISwipeGestureRecognizerDirectionUp;
    [self.view addGestureRecognizer:Swipeup];
    
    UISwipeGestureRecognizer * Swipedown=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipedown:)];
    Swipedown.direction=UISwipeGestureRecognizerDirectionUp;
    [self.view addGestureRecognizer:Swipedown];
}


-(void)swiperight:(UISwipeGestureRecognizer*)gestureRecognizer {
        [self.navigationController popViewControllerAnimated:YES];
}


-(void)swipedown:(UISwipeGestureRecognizer*)gestureRecognizer{
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:1];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
        self.label.center = CGPointMake( 512, 942);
        self.image.center = CGPointMake( 190,  148);
        self.textBlock.center = CGPointMake(598, -1051);
        [UIView commitAnimations];
    }

-(void)swipeup:(UISwipeGestureRecognizer*)gestureRecognizer{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    self.label.center = CGPointMake( 512, 2222);
    self.image.center = CGPointMake( 190,  712);
    self.textBlock.center = CGPointMake(598, 789);
    [UIView commitAnimations];
}


-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    self.label.center = CGPointMake( 512, 2222);
    self.image.center = CGPointMake (190, 712);
    self.textBlock.center = CGPointMake(598, 789);
    [UIView commitAnimations];
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
