//
//  ShoppingCart.m
//  CPDeliVersion1
//
//  Created by John Battaglia on 7/14/14.
//  Copyright (c) 2014 John Battaglia. All rights reserved.
//

#import "ShoppingCart.h"

@implementation ShoppingCart

-(void)addToCart:(NSObject *)item
{
    //take input object and add it to ther shopping cart array
    [self.shoppingCart addObject:item];
}

@end
