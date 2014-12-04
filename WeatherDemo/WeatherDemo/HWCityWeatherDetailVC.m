//
//  HWViewController.m
//  Test
//
//  Created by zhaochao on 14-12-2.
//  Copyright (c) 2014年 zhaochao. All rights reserved.
//

#import "HWCityWeatherDetailVC.h"
#import "HWCell.h"

#define WEATHER_URL @"http://api.map.baidu.com/telematics/v3/weather?location=%@&output=json&ak=rnm8udmHdWaHFWZTO2tuTiG8"

static NSString *REUSE_ID = @"CELL";

@interface HWCityWeatherDetailVC ()
{
    NSArray *data;
}
@end

@implementation HWCityWeatherDetailVC

-(NSURL*) urlWIthString: (NSString *) urlString
{
   return [NSURL URLWithString: [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
}

-(UIImage *) imageFromUrl:(NSString*) url
{
    UIImage *img    = nil;
    NSURL *imgUrl   = [self urlWIthString:url];
    NSData *imgData = [self dataFromURL:imgUrl];
    img             = [UIImage imageWithData:imgData];
    return img;
}

-(NSData*) dataFromURL: (NSURL*) url
{
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    return  [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
}

-(NSDictionary *) jsonFromUrl: (NSURL*)url;
{
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSError *error;
    NSData *jsonData      = [NSURLConnection sendSynchronousRequest:request
                                             returningResponse:nil
                                                         error:&error];
    if (error) {
        NSLog(@"%@", [error description]);
        return nil;
    }
    return [NSJSONSerialization JSONObjectWithData:jsonData
                                           options:NSJSONReadingMutableContainers
                                             error:nil];
}

- (void)viewDidLoad
{
    
    [super viewDidLoad];
    [self.tableView registerNib:[UINib nibWithNibName:@"Cell" bundle:nil] forCellReuseIdentifier:REUSE_ID];
    self.tableView.backgroundColor = [UIColor whiteColor];
    
    NSURL *url = [self urlWIthString:[NSString stringWithFormat:WEATHER_URL,_city]];
    NSDictionary *jsonDic = [self jsonFromUrl:url];
    data = [self findKeyValueInDic:jsonDic withKey:@"weather_data"];
    //NSLog(@"%@",data);
    self.navigationItem.title = _city;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 172.0f;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [data count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //    date = "\U5468\U516d";
    //    dayPictureUrl = "http://api.map.baidu.com/images/weather/day/zhenyu.png";
    //    nightPictureUrl = "http://api.map.baidu.com/images/weather/night/duoyun.png";
    //    temperature = "14 ~ 7\U2103";
    //    weather = "\U9635\U96e8\U8f6c\U591a\U4e91";
    //    wind = "\U5317\U98ce\U5fae\U98ce";
    
    HWCell *cell = [tableView dequeueReusableCellWithIdentifier:REUSE_ID];
    cell.title.text = data[indexPath.row][@"date"];
    cell.detail.text = data[indexPath.row][@"temperature"];
    cell.weather.text = data[indexPath.row][@"weather"];
    cell.wind.text = data[indexPath.row][@"wind"];
    cell.dayImg.image = [self imageFromUrl:data[indexPath.row][@"dayPictureUrl"]];
    cell.nightImg.image = [self imageFromUrl:data[indexPath.row][@"nightPictureUrl"]];
    return cell;
}

-(id ) findKeyValueInDic: (NSDictionary *)dic withKey: (NSString*)keyName
{
    id res = nil;
    NSArray *keys = [dic allKeys];
    for (id key in keys) {
        id values = dic[key];
        if ([key isEqualToString:keyName]) {
            res = values;
            break;
        }
        if ([values isKindOfClass:[NSArray class]]) {
            for (id arrElement in values) {
                res = [self findKeyValueInDic:arrElement withKey:keyName];
                if (res) {
                    return res;
                }
            }
        }
        if ([values isKindOfClass:[NSDictionary class]]) {
            res = [self findKeyValueInDic:values withKey:keyName];
            if (res) {
                return res;
            }
        }
        
    }
    return res;
}

@end
