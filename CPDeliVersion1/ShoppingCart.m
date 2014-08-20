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
    
    //init choice groups and 
    [aCartItem initUnselectedAndSelected];
    
    //init mustChecked variable to false if a mustChecked category exists
    [aCartItem initMustCheck:[theIndividualItem mustGroups]];
    
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

+ (void)modifyTempCartItem:(NSNumber*)itemID
                 addRemove:(NSString*)addOrRemove
{
    

    
}

+ (void)displayCartItems
{
   
}

+ (void)clearTheCart
{
    [shoppingCart removeAllObjects];
}

+ (CartItem*)getTempCartItem:(NSNumber*)thisItemID
{
    CartItem *theCartItem = [[CartItem alloc]init];
    
    for(int i = 0; i<tempShoppingCart.count; i++)
    {
        if([[[[tempShoppingCart objectAtIndex:i] theItem] itemID] isEqualToNumber:thisItemID])
        {
            theCartItem = [tempShoppingCart objectAtIndex:i];
        }
    }
    
    return theCartItem;
}

+(void)addToSelectedIngredients:(NSNumber*)thisIngredientID
{
    //add to selected ingredient array and remove from unselected if there
    
    for(int i = 0; i<tempShoppingCart.count; i++)
    {
        for(int j = 0; j<[[tempShoppingCart objectAtIndex:i] selectedIngredients].count; j++)
        {
            if(![[[[[tempShoppingCart objectAtIndex:i] selectedIngredients] objectAtIndex:j] ingredientsID] isEqualToNumber:thisIngredientID])
            {
                [[[tempShoppingCart objectAtIndex:i] unselectedIngredients] addObject:[[[tempShoppingCart objectAtIndex:i] selectedIngredients] objectAtIndex:j]];
                
                [[[tempShoppingCart objectAtIndex:i] selectedIngredients] removeObjectAtIndex:j];
            }
        }
        
    }
}

@end
