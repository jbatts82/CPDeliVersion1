//
//  CustomerInfo.h
//  CPDeliVersion1
//
//  Created by UMDGuest on 8/7/14.
//  Copyright (c) 2014 John Battaglia. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CustomerInfo : NSObject

@property (strong, nonatomic) NSString *accountID;
@property (strong, nonatomic) NSString *firstName;
@property (strong, nonatomic) NSString *lastName;
@property (strong, nonatomic) NSString *email;
@property (strong, nonatomic) NSString *password;
@property (strong, nonatomic) NSString *street;
@property (strong, nonatomic) NSString *city;
@property (strong, nonatomic) NSString *state;
@property (strong, nonatomic) NSString *zip;
@property (strong, nonatomic) NSString *phoneNumber;
@property (strong, nonatomic) NSString *custJSONString;
@property (strong, nonatomic) NSData *custJSONData;


-(void)convertToJSON;

-(NSString *)getTheJSONString;

-(NSData *)getTheJSONData;

@end
