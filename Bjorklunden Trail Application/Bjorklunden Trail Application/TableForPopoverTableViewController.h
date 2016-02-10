//
//  TableForPopoverTableViewController.h
//  Bjorklunden Trail Application
//
//  Created by William Gislason on 7/31/14.
//  Copyright (c) 2014 Gislawill. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Annotations.h"

@protocol TableForPopoverDelegate <NSObject>
-(void)selectedFeature:(NSString *)feature;
@end

@interface TableForPopoverTableViewController : UITableViewController

@property (nonatomic, strong) NSMutableArray *featureNames;
@property (nonatomic, weak) id<TableForPopoverDelegate> delegate;

@end
