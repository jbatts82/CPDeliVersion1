//
//  IndividualItems.h
//  CPDeliVersion1
//
//  Created by UMDGuest on 5/26/14.
//  Copyright (c) 2014 John Battaglia. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IndividualItems : NSObject

@property (strong, nonatomic) NSNumber *itemID;
@property (strong, nonatomic) NSString *itemName;
@property (strong, nonatomic) NSString *itemDescription;
@property (strong, nonatomic) NSArray *ingredients;
@property (strong, nonatomic) NSString *deluxeIngredients;
@property (strong, nonatomic) NSNumber *parentGroup;
@property (strong, nonatomic) NSNumber *price;
@property (strong, nonatomic) NSArray *choiceGroups;
@property (strong, nonatomic) NSArray *mustGroups;
@property (strong, nonatomic) NSArray *excludeGroups;


#pragma mark - 
#pragma mark Class Methods

- (id)initWithItemID:(NSNumber *)iID
         andItemName:(NSString *)iName
  andItemDescription:(NSString *)iDescription
      andIngredients:(NSArray *)iIngredients
andDeluxeIngredients:(NSString *)iDeluxeIngredients
      andParentGroup:(NSNumber *)iParentGroup
            andPrice:(NSNumber *)iPrice
     andChoiceGroups:(NSArray *)iChoiceGroups
       andMustGroups:(NSArray *)iMustGroups
    andExcludeGroups:(NSArray *)iExcludeGroups;


@end
