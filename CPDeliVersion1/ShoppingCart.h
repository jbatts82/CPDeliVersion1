//
//  ShoppingCart.h
//  CPDeliVersion1
//
//  Created by John Battaglia on 7/14/14.
//  Copyright (c) 2014 John Battaglia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CartItem.h"

@interface ShoppingCart : NSObject


@property (strong, nonatomic) NSMutableArray *shoppingCart;

+ (void)addToCart:(NSObject *)item;

+ (void)displayCartItems;

//- (void)createShoppingCart;

@end
