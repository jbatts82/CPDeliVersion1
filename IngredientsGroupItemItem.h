//
//  IngredientsGroupItemItem.h
//  CPDeliVersion1
//
//  Created by John Battaglia on 7/21/14.
//  Copyright (c) 2014 John Battaglia. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IngredientsGroupItemItem : NSObject

@property (weak, nonatomic) NSNumber *ItemID;
@property (weak, nonatomic) NSString *ItemName;
@property (weak, nonatomic) NSNumber *ParentGroup;
@property (weak, nonatomic) NSNumber *Price;



#pragma mark -
#pragma mark Class Methods

//method loads fields with values
- (id) initWithItemID:(NSNumber *)iItemID
          andItemName:(NSString *)iItemName
       andParentGroup:(NSNumber *)iParentGroup
             andPrice:(NSNumber *)iPrice;

@end
