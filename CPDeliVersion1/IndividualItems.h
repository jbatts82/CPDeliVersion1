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
@property (weak, nonatomic) NSNumber *parentGroup;
@property (weak, nonatomic) NSNumber *price;
@property (weak, nonatomic) NSArray *choiceGroups;
@property (weak, nonatomic) NSArray *mustGroups;
@property (weak, nonatomic) NSArray *excludeGroups;


#pragma mark - 
#pragma mark Class Methods

- (id)initWithItemID:(NSNumber *)iID
         andItemName:(NSString *)iName
  andItemDescription:(NSString *)iDescription
      andIngredients:(NSString *)iIngredients
andDeluxeIngredients:(NSString *)iDeluxeIngredients
      andParentGroup:(NSNumber *)iParentGroup
            andPrice:(NSNumber *)iPrice
     andChoiceGroups:(NSArray *)iChoiceGroups
       andMustGroups:(NSArray *)iMustGroups
    andExcludeGroups:(NSArray *)iExcludeGroups;


@end
