//
//  GroupItemViewController.h
//  CPDeliVersion1
//
//  Created by John Battaglia on 5/20/14.
//  Copyright (c) 2014 John Battaglia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GroupItemViewController : UITableViewController<NSURLConnectionDelegate,NSXMLParserDelegate>
{
    NSMutableData *responseData;
}

@property (nonatomic, strong) NSMutableArray *groupItemArray;
@property (nonatomic, strong) NSMutableArray *individualItemArray;
@property (nonatomic, strong) NSMutableArray *ingredientsTableArray;

@property (nonatomic, strong) NSURLConnection *connection1;
@property (nonatomic, strong) NSURLConnection *connection2;
@property (nonatomic, strong) NSURLConnection *connection3;

#pragma mark -
#pragma mark Class Methods

- (void) retrieveData; //TODO might not need to be public, probably make private


@end
