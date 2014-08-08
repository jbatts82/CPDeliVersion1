//
//  IngredientsSelectionTableViewController.h
//  CPDeliVersion1
//
//  Created by John Battaglia on 7/22/14.
//  Copyright (c) 2014 John Battaglia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IndividualItemDetailViewController.h"
#import "ShoppingCart.h"
#import "GroupItemViewController.h"
#import "IngredientsTable.h"
#import "IngredientsSelectionCell.h"
#import "SelectionTableViewController.h"

@interface IngredientsSelectionTableViewController : UITableViewController

@property (nonatomic, strong)IndividualItems *theIncomingObject;
@property (nonatomic, strong)NSMutableArray *ingredientsTable;
@property (nonatomic, strong)NSMutableArray *ingredientsGroupTable;
@property (nonatomic, strong)NSMutableArray *ingredientsGroupItemTable;

@end
