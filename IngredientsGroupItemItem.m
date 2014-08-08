//
//  IngredientsGroupItemItem.m
//  CPDeliVersion1
//
//  Created by John Battaglia on 7/21/14.
//  Copyright (c) 2014 John Battaglia. All rights reserved.
//

#import "IngredientsGroupItemItem.h"

@implementation IngredientsGroupItemItem

@synthesize ItemID, ItemName, ParentGroup, Price;

- (id) initWithItemID:(NSNumber *)iItemID
          andItemName:(NSString *)iItemName
       andParentGroup:(NSString *)iParentGroup
             andPrice:(NSNumber *)iPrice
{
    self = [super init];
    
    if(self)
    {
        ItemID = iItemID;
        ItemName = iItemName;
        ParentGroup = iParentGroup;
        Price = iPrice;
    }
    
    return self;
}

@end
