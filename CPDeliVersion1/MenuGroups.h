//
//  MenuGroups.h
//  CPDeliVersion1
//
//  Created by John Battaglia on 5/22/14.
//  Copyright (c) 2014 John Battaglia. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MenuGroups : NSObject

@property (strong, nonatomic) NSNumber *groupID;
@property (strong, nonatomic) NSString *groupItem;
@property (strong, nonatomic) NSString *imageURL;
@property (strong, nonatomic) UIImage *theImage;
@property (strong, nonatomic) NSMutableArray *individualItemsArray;



#pragma mark - 
#pragma mark Class Methods

- (id)initWithGroupID: (NSNumber *)gID
         andGroupItem: (NSString *)gItem
          andImageURL: (NSString *)gURL;



@end
