//
//  GroupItemViewController.h
//  CPDeliVersion1
//
//  Created by John Battaglia on 5/20/14.
//  Copyright (c) 2014 John Battaglia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IngredientsTable.h"
#import "MenuGroups.h"
#import "IndividualItems.h"
#import "Ingredients.h"
#import "GroupItemCell.h"
#import "IndividualItemViewController.h"
#import "IngredientsGroupItem.h"
#import "IngredientsGroupItemItem.h"

@interface GroupItemViewController : UITableViewController<NSURLConnectionDelegate,NSXMLParserDelegate>
{
    NSMutableData *responseData;
}

@property (nonatomic, strong) NSMutableArray *groupItemArray;
@property (nonatomic, strong) NSMutableArray *individualItemArray;
@property (nonatomic, strong) NSMutableArray *ingredientsTableArray;
@property (nonatomic, strong) NSMutableArray *ingredientsGroupTableArray;
@property (nonatomic, strong) NSMutableArray *ingredientsGroupItemTableArray;

@property (nonatomic, strong) NSURLConnection *connection1;
@property (nonatomic, strong) NSURLConnection *connection2;
@property (nonatomic, strong) NSURLConnection *connection3;
@property (nonatomic, strong) NSURLConnection *connection4;
@property (nonatomic, strong) NSURLConnection *connection5;

#pragma mark -
#pragma mark Class Methods

- (void) retrieveData; 


@end
