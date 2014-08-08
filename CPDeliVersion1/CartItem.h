//
//  CartItem.h
//  CPDeliVersion1
//
//  Created by John Battaglia on 8/8/14.
//  Copyright (c) 2014 John Battaglia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IndividualItems.h"

@interface CartItem : NSObject

@property (strong, nonatomic) IndividualItems *item;
@property (strong, nonatomic) NSNumber *totalPrice;
@property (strong, nonatomic) NSMutableArray *selectedIngredients;
@property (strong, nonatomic) NSMutableArray *unselectedIngredients;
@property (strong, nonatomic) NSMutableArray *selectedChoices;


-(void)addItem:(IndividualItems *)theItem;
-(void)runningTotal:(NSNumber *)addCost;

@end
