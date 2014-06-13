//
//  IndividualItemViewController.h
//  CPDeliVersion1
//
//  Created by John Battaglia on 6/12/14.
//  Copyright (c) 2014 John Battaglia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MenuGroups.h"

@interface IndividualItemViewController : UITableViewController

@property (nonatomic, strong) NSMutableArray *theItemArray;

@property (nonatomic, strong) MenuGroups *theGroupObject;

-(void)getItem:(MenuGroups*)theObject;

@end
