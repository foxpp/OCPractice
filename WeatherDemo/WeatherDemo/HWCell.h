//
//  HWCell.h
//  Test
//
//  Created by zhaochao on 14-12-3.
//  Copyright (c) 2014年 zhaochao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HWCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *dayImg;
@property (weak, nonatomic) IBOutlet UIImageView *nightImg;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *detail;
@property (weak, nonatomic) IBOutlet UILabel *weather;
@property (weak, nonatomic) IBOutlet UILabel *wind;

@end
