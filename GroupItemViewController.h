//
//  GroupItemViewController.h
//  CPDeliVersion1
//
//  Created by John Battaglia on 5/20/14.
//  Copyright (c) 2014 John Battaglia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GroupItemViewController : UITableViewController<NSURLConnectionDelegate,NSXMLParserDelegate>



#pragma mark -
#pragma mark Class Methods
- (void) retrieveData;


@end
