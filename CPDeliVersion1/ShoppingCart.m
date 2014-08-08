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

+ (void)addToCart:(CartItem *)item
{
    // static NSMutableArray *shoppingCart;
    //take input object and add it to ther shopping cart array
    
    if(!shoppingCart)
    {
        shoppingCart = [[NSMutableArray alloc] init];
    }
    
    [shoppingCart addObject:item];
}

+ (void)displayCartItems
{
   
}

/*
- (void)createShoppingCart
{
    ShoppingCart *theShoppingCart;
    theShoppingCart = [[ShoppingCart alloc] init];
}

*/

@end
