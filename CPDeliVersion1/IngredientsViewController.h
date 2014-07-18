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


@interface IngredientsViewController : UIViewController

@property (nonatomic, strong)IndividualItems *incomingObject;

-(IBAction)addCartItemToShoppingCart:(id)sender;


@end
