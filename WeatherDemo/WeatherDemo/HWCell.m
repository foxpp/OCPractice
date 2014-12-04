//
//  HWCell.m
//  Test
//
//  Created by zhaochao on 14-12-3.
//  Copyright (c) 2014年 zhaochao. All rights reserved.
//

#import "HWCell.h"

@implementation HWCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
