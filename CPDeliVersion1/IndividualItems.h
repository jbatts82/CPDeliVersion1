//
//  IndividualItems.h
//  CPDeliVersion1
//
//  Created by UMDGuest on 5/26/14.
//  Copyright (c) 2014 John Battaglia. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IndividualItems : NSObject

@property (weak, nonatomic) NSNumber *itemID;
@property (weak, nonatomic) NSString *itemName;
@property (weak, nonatomic) NSString *itemDescription;
@property (weak, nonatomic) NSString *ingredients;
@property (weak, nonatomic) NSString *deluxeIngredients;
@property (weak, nonatomic) NSString *groupName;
@property (weak, nonatomic) NSNumber *price;
@property (weak, nonatomic) NSString *additionalItems;

@end
