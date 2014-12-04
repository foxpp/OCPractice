//
//  HWCityController.m
//  Test
//
//  Created by zhaochao on 14-12-3.
//  Copyright (c) 2014年 zhaochao. All rights reserved.
//

#import "HWCityController.h"
#import "HWCityWeatherDetailVC.h"

@interface HWCityController ()
{
    NSArray *_citys;
}
@end

@implementation HWCityController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        
    }
    return self;
}

-(NSMutableArray *)getCitysFromPlist:(NSString *)plist
{
    NSMutableArray *citys = [[NSMutableArray alloc]init];
    NSArray *plistArr = [[NSArray alloc] initWithContentsOfFile: [ [NSBundle mainBundle] pathForResource:plist ofType:@"plist"]];
    for (NSDictionary* dic in plistArr) {
        NSString *city = dic[@"state"];
        if ([city rangeOfString:@"省"].length
            || [city rangeOfString:@"自治区"].length) {
            NSArray *localCitys = dic[@"cities"];
            for (NSDictionary *subDic in localCitys) {
                [citys addObject:subDic[@"city"]];
            }
        }
        else{
            [citys addObject:city];
        }
    }
    return  citys;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    _citys = [self getCitysFromPlist:@"citys"];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    HWCityWeatherDetailVC *des = segue.destinationViewController;
    des.city = sender;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    [self performSegueWithIdentifier:@"GoWeather" sender:cell.textLabel.text];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_citys count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier ];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
    }
    cell.textLabel.text = _citys[indexPath.row];
    return cell;
}

@end
