//
//  CartItem.h
//  CPDeliVersion1
//
//  Created by John Battaglia on 8/8/14.
//  Copyright (c) 2014 John Battaglia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IndividualItems.h"
#import "IngredientsTable.h"
#import "Ingredients.h"

@interface CartItem : NSObject
{
    float totalPrice;
}

@property (strong, nonatomic) IndividualItems *theItem;
@property (strong, nonatomic) NSMutableArray *selectedIngredients;
@property (strong, nonatomic) NSMutableArray *unselectedIngredients;
@property (strong, nonatomic) NSMutableArray *selectedChoices;
@property (assign, nonatomic) BOOL mustChecked;
@property (strong, nonatomic) NSNumber *cartID;



-(void)getIngredients:(NSMutableArray*)ingredients;
-(void)runningTotal:(float)addCost;







@end
