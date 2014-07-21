//
//  IngredientsViewController.h
//  CPDeliVersion1
//
//  Created by John Battaglia on 7/14/14.
//  Copyright (c) 2014 John Battaglia. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "IndividualItemDetailViewController.h"
#import "ShoppingCart.h"
#import "GroupItemViewController.h"
#import "IngredientsTable.h"

@interface IngredientsViewController : UIViewController

@property (nonatomic, strong)IndividualItems *incomingObject;
@property (nonatomic, strong)NSMutableArray *ingredientsTable;
@property (nonatomic, strong)NSMutableArray *ingredientsGroupTable;
@property (nonatomic, strong)NSMutableArray *ingredientsGroupItemTable;

-(IBAction)addCartItemToShoppingCart:(id)sender;

@end
