//
//  CartItem.m
//  CPDeliVersion1
//
//  Created by John Battaglia on 8/8/14.
//  Copyright (c) 2014 John Battaglia. All rights reserved.
//

#import "CartItem.h"

@implementation CartItem

static int cartID;

@synthesize theItem, unselectedIngredients, selectedChoices, selectedIngredients, mustChecked;

-(void)runningTotal:(float)addCost
{
    totalPrice = totalPrice + addCost;
}

-(void)getIngredients:(NSArray*)theIngredients;
{
    if(!selectedIngredients)
    {
        selectedIngredients = [[NSMutableArray alloc] init];
    }
    
    NSArray *ingredientsTable = [[NSMutableArray alloc] init];
    ingredientsTable = [IngredientsTable getIngredientsTable];
    
    for(int i = 0; i<ingredientsTable.count; i++)
    {
        for(int j = 0; j<theIngredients.count; j++)
        {
            if([[[ingredientsTable objectAtIndex:i] ingredientsID] isEqualToNumber:[theIngredients objectAtIndex:j]])
            {
                [selectedIngredients addObject:[ingredientsTable objectAtIndex:i]];
            }
        }
    }
    
}

-(void)initUnselectedAndSelected
{
    if(!selectedChoices)
    {
        selectedChoices = [[NSMutableArray alloc] init];
    }
    
    if(!unselectedIngredients)
    {
        unselectedIngredients = [[NSMutableArray alloc] init];
    }
}

-(void)initMustCheck:(NSArray*)mustGroups
{
    if(mustGroups.count > 0)
    {
        mustChecked = false;
    }
    else
    {
        mustChecked = true;
    }
    
}




@end
