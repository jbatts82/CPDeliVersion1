//
//  CartItem.m
//  CPDeliVersion1
//
//  Created by John Battaglia on 7/15/14.
//  Copyright (c) 2014 John Battaglia. All rights reserved.
//

#import "CartItem.h"

@implementation CartItem

@synthesize item, totalPrice, unselectedIngredients, selectedChoices, selectedIngredients;

-(void)addItem:(IndividualItems *)theItem
{
    item = theItem;
}

-(void)runningTotal:(NSNumber *)addCost
{
    
}

@end
