//
//  TestGroupViewController.h
//  CPDeliVersion1
//
//  Created by John Battaglia on 8/7/14.
//  Copyright (c) 2014 John Battaglia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TestGroupViewController : UIViewController <NSURLConnectionDelegate,NSXMLParserDelegate>

@property (nonatomic, strong) IBOutlet UILabel *nameLabel;

@property (strong, nonatomic) IBOutlet UITextField *firstNameText;
@property (strong, nonatomic) IBOutlet UITextField *lastNameText;
@property (nonatomic, strong) NSURLConnection *theConnection;


-(IBAction)buttonClick:(id)sender;


@end
