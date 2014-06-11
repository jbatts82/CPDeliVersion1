//
//  MenuGroups.m
//  CPDeliVersion1
//
//  Created by UMDGuest on 5/22/14.
//  Copyright (c) 2014 John Battaglia. All rights reserved.
//

#import "MenuGroups.h"

@implementation MenuGroups

@synthesize groupID, groupItem, imageURL, theImage, individualItemsArray;

- (id)initWithGroupID: (NSNumber *)gID
         andGroupItem: (NSString *)gItem
          andImageURL: (NSString *)gURL
{
    
    self = [super init];
    
    if(self)
    {
        groupID = gID;
        groupItem = gItem;
        imageURL = gURL;
        
        //convert url string to nsurl object
        NSURL *ggImageURL = [NSURL URLWithString:imageURL];
        
        //pass nsurl object to nsdata object
        NSData *imageData = [NSData dataWithContentsOfURL:ggImageURL];
        
        //convert nsdata object to the image
        theImage = [UIImage imageWithData:imageData];
        
    }
    
    
    
    return self;
}


@end
