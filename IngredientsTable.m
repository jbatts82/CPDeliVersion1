//
//  IngredientsTable.m
//  CPDeliVersion1
//
//  Created by John Battaglia on 7/19/14.
//  Copyright (c) 2014 John Battaglia. All rights reserved.
//

#import "IngredientsTable.h"

@implementation IngredientsTable

static NSMutableArray *ingredientsGroupItemsTable;
static NSMutableArray *ingredientsGroupTable;
static NSMutableArray *ingredientsTable;

+(void)loadIngredientsTable:(NSMutableArray *)theArray
{
    ingredientsTable = theArray;
}

+(void)loadIngredientsGroupTable:(NSMutableArray *)theArray
{
    ingredientsGroupTable = theArray;
}

+(void)loadIngredientsGroupItemTable:(NSMutableArray *)theArray
{
    ingredientsGroupItemsTable = theArray;
}

+(NSMutableArray *)getIngredientsTable
{
    return ingredientsTable;
}

+(NSMutableArray *)getIngredientsGroupTable
{
    return ingredientsGroupTable;
}

+(NSMutableArray *)getIngredientsGroupItemTable
{
    return ingredientsGroupItemsTable;
}

@end
