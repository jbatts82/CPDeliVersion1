//
//  IndividualItemDetailViewController.h
//  CPDeliVersion1
//
//  Created by John Battaglia on 6/12/14.
//  Copyright (c) 2014 John Battaglia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IndividualItems.h"
#import "IndividualItemViewController.h"
#import "IngredientsSelectionTableViewController.h"
#import "CartItem.h"
#import "ShoppingCart.h"

@interface IndividualItemDetailViewController : UIViewController

@property (nonatomic, strong) NSString *itemName;
@property (nonatomic, strong) NSString *itemDescription;
@property (nonatomic, strong) NSNumber *itemPrice;
@property (nonatomic, strong) IBOutlet UILabel *itemNameLabel;
@property (nonatomic, strong) IBOutlet UILabel *itemDescriptionLabel;
@property (nonatomic, strong) IBOutlet UILabel *itemPriceLabel;
@property (nonatomic, strong) IndividualItems *incomingObject;
@property (nonatomic, strong) ShoppingCart *shoppingCart;

-(IBAction)selectItem:(id)sender;
-(void)getItemObject:(IndividualItems*)theItemObject;
-(void)setLabels;
-(IBAction)addToCart:(id)sender;



-(NSMutableArray*)getIngredientsForCartItem;


@end
