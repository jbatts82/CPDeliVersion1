//
//  IngredientsGroupItem.h
//  CPDeliVersion1
//
//  Created by John Battaglia on 7/21/14.
//  Copyright (c) 2014 John Battaglia. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IngredientsGroupItem : NSObject

@property (weak, nonatomic) NSNumber *GroupID;
@property (weak, nonatomic) NSString *GroupName;
@property (weak, nonatomic) NSNumber *SelectMultiple;

#pragma mark -
#pragma mark Class Methods


//method loads fields with values
- (id) initWithGroupID:(NSNumber *)iGroupID
          andGroupName:(NSString *)iGroupName
     andSelectMultiple:(NSNumber *)iSelectMultiple;

@end
