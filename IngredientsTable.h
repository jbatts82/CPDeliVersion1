//
//  IngredientsTable.h
//  CPDeliVersion1
//
//  Created by John Battaglia on 7/19/14.
//  Copyright (c) 2014 John Battaglia. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IngredientsTable : NSObject

+(void)loadIngredientsTable:(NSMutableArray *)theArray;
+(void)loadIngredientsGroupTable:(NSMutableArray *)theArray;
+(void)loadIngredientsGroupItemTable:(NSMutableArray *)theArray;

+(NSMutableArray *)getIngredientsTable;
+(NSMutableArray *)getIngredientsGroupTable;
+(NSMutableArray *)getIngredientsGroupItemTable;

@end
