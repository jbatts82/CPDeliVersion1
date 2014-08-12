//
//  Cart.h
//  CPDeliVersion1
//
//  Created by John Battaglia on 8/8/14.
//  Copyright (c) 2014 John Battaglia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CartItem.h"

@interface Cart : NSObject


+(void)addItemToCart:(CartItem *)theItem;
+(void)clearCartItems;

@end
