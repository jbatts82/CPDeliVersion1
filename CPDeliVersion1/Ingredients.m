//
//  Ingredients.m
//  CPDeliVersion1
//
//  Created by John Battaglia on 5/26/14.
//  Copyright (c) 2014 John Battaglia. All rights reserved.
//

#import "Ingredients.h"

@implementation Ingredients

@synthesize ingredientsID, ingredientsName, price, dayRequired, percentageBased;

- (id)initWithIngredientsID: (NSNumber *)ingIngredientsID
         andIngredientsName: (NSString *)ingIngredientsName
                   andPrice: (NSNumber *)ingPrice
             andDayRequired: (NSString *)ingDayRequired
         andPercentageBased: (NSNumber *)ingPercentageBased
{
    
    self = [super init];
    
    if(self)
    {
        ingredientsID = ingIngredientsID;
        ingredientsName = ingIngredientsName;
        price = ingPrice;
        dayRequired = ingDayRequired;
        percentageBased = ingPercentageBased;
    }

    return self;
}

@end
