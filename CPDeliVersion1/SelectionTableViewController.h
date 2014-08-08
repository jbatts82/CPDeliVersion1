//
//  SelectionTableViewController.h
//  CPDeliVersion1
//
//  Created by John Battaglia on 7/31/14.
//  Copyright (c) 2014 John Battaglia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IngredientsTable.h"
#import "IngredientsSelectionTableViewController.h"
#import "SelectionCell.h"
#import "Choices.h"


@interface SelectionTableViewController : UITableViewController

@property (nonatomic, strong)Choices *anotherIncomingObject;

@property (nonatomic, strong)NSMutableArray *ingredientsTable;
@property (nonatomic, strong)NSMutableArray *ingredientsGroupTable;
@property (nonatomic, strong)NSMutableArray *ingredientsGroupItemTable;
@property (nonatomic,retain) NSIndexPath *oldIndexPath;

@end
