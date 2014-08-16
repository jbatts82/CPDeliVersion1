//
//  PayPalViewController.h
//  CPDeliVersion1
//
//  Created by Ahmad Altai on 7/27/14.
//  Copyright (c) 2014 John Battaglia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PayPalMobile.h"
//#import "CustomerInfo.h"

@interface PayPalViewController : UIViewController<PayPalPaymentDelegate,NSURLConnectionDelegate,NSXMLParserDelegate>

@property (nonatomic, strong) NSURLConnection *theConnection;

//@property (nonatomic, strong) CustomerInfo *custInfo;



@end