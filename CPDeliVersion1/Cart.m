//
//  Cart.m
//  CPDeliVersion1
//
//  Created by John Battaglia on 8/8/14.
//  Copyright (c) 2014 John Battaglia. All rights reserved.
//

#import "Cart.h"

@implementation Cart

static NSMutableArray *theCart;

+(void)addItemToCart:(CartItem *)theItem
{
    [theCart addObject:theItem];
}



@end
