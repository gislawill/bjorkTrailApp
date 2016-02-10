//
//  CracksViewController.m
//  Bjorklunden Trail Application
//
//  Created by William Gislason on 8/7/14.
//  Copyright (c) 2014 Gislawill. All rights reserved.
//

#import "CracksViewController.h"

@interface CracksViewController ()

@end

@implementation CracksViewController

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
    self.textBlock.font = [UIFont fontWithName:@"Aleo-Regular" size:23.5];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new]
                                                  forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    self.navigationController.navigationBar.translucent = YES;
    self.navigationController.view.backgroundColor = [UIColor clearColor];
    [self.navigationController.navigationBar setTintColor:[UIColor darkGrayColor]];
    
    UISwipeGestureRecognizer * Swiperight=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swiperight:)];
    Swiperight.direction=UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:Swiperight];
    
    UISwipeGestureRecognizer * Swipeleft=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeleft:)];
    Swipeleft.direction=UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:Swipeleft];
}

int a = 0;

-(void)swiperight:(UISwipeGestureRecognizer*)gestureRecognizer {
    if (a == 0) {
        [self.navigationController popViewControllerAnimated:YES];
    }
    if (a == 1) {
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:1];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
        self.label.center = CGPointMake( 284, 962);
        self.image.center = CGPointMake( 658,  512);
        self.textBlock.center = CGPointMake( 4512, 905);
        [UIView commitAnimations];
    }
    a--;
}

-(void)swipeleft:(UISwipeGestureRecognizer*)gestureRecognizer {
    if (a == 0) {
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:1];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
        self.label.center = CGPointMake( -2188, 962);
        self.image.center = CGPointMake( 300,  512);
        self.textBlock.center = CGPointMake(384, 905);
        [UIView commitAnimations];
    } if (a == 1) {
        a--;
    }
    a++;
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    self.label.center = CGPointMake( -2000, 962);
    self.image.center = CGPointMake (300, 512);
    self.textBlock.center = CGPointMake(384, 905);
    [UIView commitAnimations];
    a++;
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
