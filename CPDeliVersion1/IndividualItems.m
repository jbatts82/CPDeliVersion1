//
//  IndividualItems.m
//  CPDeliVersion1
//
//  Created by UMDGuest on 5/26/14.
//  Copyright (c) 2014 John Battaglia. All rights reserved.
//

#import "IndividualItems.h"

@implementation IndividualItems

@synthesize itemID, itemName, itemDescription, ingredients, deluxeIngredients, groupName, price, additionalItems;


- (id)initWithItemID:(NSNumber *)iID
         andItemName:(NSString *)iName
  andItemDescription:(NSString *)iDescription
      andIngredients:(NSString *)iIngredients
andDeluxeIngredients:(NSString *)iDeluxeIngredients
        andGroupName:(NSString *)iGroupName
            andPrice:(NSNumber *)iPrice
  andAdditionalItems:(NSString *)iAdditionalItems
{
    self = [super init];
    
    if(self)
    {
        itemID = iID;
        itemName = iName;
        itemDescription = iDescription;
        ingredients = iIngredients;
        deluxeIngredients = iDeluxeIngredients;
        groupName = iGroupName;
        price = iPrice;
        additionalItems = iAdditionalItems;
    }
    
    return self;
}

@end
