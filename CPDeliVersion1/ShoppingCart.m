//
//  ShoppingCart.m
//  CPDeliVersion1
//
//  Created by John Battaglia on 7/14/14.
//  Copyright (c) 2014 John Battaglia. All rights reserved.
//

#import "ShoppingCart.h"

@implementation ShoppingCart

static NSMutableArray *shoppingCart;
static NSMutableArray *tempShoppingCart; //only one type of individual object per array

+ (CartItem*)createCartItem:(IndividualItems*)theIndividualItem
{
    //create new cart item
    CartItem *aCartItem;
    aCartItem = [[CartItem alloc] init];
    
    //add inidividualItem
    aCartItem.theItem = theIndividualItem;
    
    //add default ingredients
    [aCartItem getIngredients:[theIndividualItem ingredients]];
    
    //init choice and selected groups
    
    
    return aCartItem;
}

+(void)addToTempCart:(CartItem*)cartItem
{
    bool isInArray = false;
    
    //initialize tempShoppingCart if not already done
    if(!tempShoppingCart)
    {
        tempShoppingCart = [[NSMutableArray alloc] init];
    }
    
    //check and see if item is already in temp array
    for(int i = 0; i<tempShoppingCart.count; i++)
    {
        if([[[[tempShoppingCart objectAtIndex:i] theItem] itemID] isEqualToNumber:[[cartItem theItem] itemID]])
        {
            isInArray = true;
        }
    }
    
    //if item is NOT in temp array: add it
    if(!isInArray)
    {
        [tempShoppingCart addObject:cartItem];
        NSLog(@"added item to tempCart");
    }
    else
    {
        NSLog(@"Item Is already in tempCart");
    }
    
}
+ (void)addToCart
{
    /*
    if(!shoppingCart)
    {
        shoppingCart = [[NSMutableArray alloc] init];
    }
    */
    
    //check if must items are added
    
    //modifiy
    
   // [shoppingCart addObject:item];
}

+ (void)modifyCartItem
{
    //get item for that individual object
    
}

+ (void)displayCartItems
{
   
}

+ (void)clearTheCart
{
    [shoppingCart removeAllObjects];
}





@end
