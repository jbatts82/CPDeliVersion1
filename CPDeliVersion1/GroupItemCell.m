//
//  GroupItemCell.m
//  CPDeliVersion1
//
//  Created by John Battaglia on 6/12/14.
//  Copyright (c) 2014 John Battaglia. All rights reserved.
//

#import "GroupItemCell.h"

@implementation GroupItemCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
