//
//  Ingredients.h
//  CPDeliVersion1
//
//  Created by John Battaglia on 5/26/14.
//  Copyright (c) 2014 John Battaglia. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Ingredients : NSObject

@property (weak, nonatomic) NSNumber *ingredientsID;
@property (weak, nonatomic) NSString *ingredientsName;
@property (weak, nonatomic) NSNumber *price;
@property (weak, nonatomic) NSString *dayRequired;
@property (weak, nonatomic) NSNumber *percentageBased;
@property (weak, nonatomic) NSArray *choiceGroups;
@property (weak, nonatomic) NSArray *mustGroups;
@property (weak, nonatomic) NSArray *excludeGroups;


#pragma mark -
#pragma mark Class Methods

- (id)initWithIngredientsID: (NSNumber *)ingIngredientsID
         andIngredientsName: (NSString *)ingIngredientsName
                   andPrice: (NSNumber *)ingPrice
             andDayRequired: (NSString *)ingDayRequired
         andPercentageBased: (NSNumber *)ingPercentageBased;

@end
