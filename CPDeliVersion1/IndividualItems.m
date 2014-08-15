//
//  IndividualItems.m
//  CPDeliVersion1
//
//  Created by John Battaglia on 5/26/14.
//  Copyright (c) 2014 John Battaglia. All rights reserved.
//

#import "IndividualItems.h"

@implementation IndividualItems

@synthesize itemID, itemName, itemDescription, ingredients, deluxeIngredients, parentGroup, price, choiceGroups, mustGroups, excludeGroups;

- (id)initWithItemID:(NSNumber *)iID
         andItemName:(NSString *)iName
  andItemDescription:(NSString *)iDescription
      andIngredients:(NSArray *)iIngredients
andDeluxeIngredients:(NSString *)iDeluxeIngredients
      andParentGroup:(NSNumber *)iParentGroup
            andPrice:(NSNumber *)iPrice
     andChoiceGroups:(NSArray *)iChoiceGroups
       andMustGroups:(NSArray *)iMustGroups
    andExcludeGroups:(NSArray *)iExcludeGroups
{
    self = [super init];
    
    if(self)
    {
        itemID = iID;
        itemName = iName;
        itemDescription = iDescription;
        ingredients = iIngredients;
        deluxeIngredients = iDeluxeIngredients;
        parentGroup = iParentGroup;
        price = iPrice;
        choiceGroups = iChoiceGroups;
        mustGroups = iMustGroups;
        excludeGroups = iExcludeGroups;
    }
    
    return self;
}

@end
