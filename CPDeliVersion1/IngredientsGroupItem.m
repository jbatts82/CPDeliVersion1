//
//  IngredientsGroupItem.m
//  CPDeliVersion1
//
//  Created by John Battaglia on 7/21/14.
//  Copyright (c) 2014 John Battaglia. All rights reserved.
//

#import "IngredientsGroupItem.h"

@implementation IngredientsGroupItem

@synthesize GroupID, GroupName, SelectMultiple;

- (id) initWithGroupID:(NSNumber *)iGroupID
          andGroupName:(NSString *)iGroupName
     andSelectMultiple:(NSNumber *)iSelectMultiple
{
    self = [super init];
    
    if(self)
    {
        GroupID = iGroupID;
        GroupName = iGroupName;
        SelectMultiple = iSelectMultiple;
    }
    
    return self;
}
@end
