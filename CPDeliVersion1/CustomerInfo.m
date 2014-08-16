//
//  CustomerInfo.m
//  CPDeliVersion1
//
//  Created by UMDGuest on 8/7/14.
//  Copyright (c) 2014 John Battaglia. All rights reserved.
//

#import "CustomerInfo.h"

@implementation CustomerInfo
@synthesize custJSONString, custJSONData;

-(void)convertToJSON;
{
    // Did manual creation of JSON string. Could use serialization if necessary, but result is given as NSData and not NSString as required from web service
    custJSONString = [NSString stringWithFormat:@"{\"accountID\":%@,\"firstName\":%@,\"lastName\":%@,\"email\":%@,\"password\":%@,\"street\":%@,\"city\":%@,\"state\":%@,\"zip\":%@,\"phoneNumber\":%@}",_accountID, _firstName, _lastName, _email, _password, _street, _city, _state, _zip, _phoneNumber];
    
    // create JSON data using serialization object. Ouput is of NSData type instead of NSString
    // both string and data are available by calling appropriate non-conflicting methods
     NSDictionary *custDictionary = [[NSDictionary alloc] initWithObjectsAndKeys:
                                    @"accontID", _accountID,
                                    @"firstName", _firstName,
                                    @"lastName", _lastName,
                                    @"email", _email,
                                    @"password", _password,
                                    nil];
    custJSONData = [NSJSONSerialization dataWithJSONObject:custDictionary options:0 error:nil];
}

-(NSString *)getTheJSONString;
{
    
    return custJSONString;
}

-(NSData *)getTheJSONData;
{
    
    return custJSONData;
}

@end
