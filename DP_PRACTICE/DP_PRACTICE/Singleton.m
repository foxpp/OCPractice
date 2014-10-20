//
//  Singleton.m
//  VisitorTest
//
//  Created by zhaochao on 14-10-15.
//  Copyright (c) 2014年 zhaochao. All rights reserved.
//

#import "Singleton.h"
@interface Singleton()
@property NSString *sharedName;
@end
@implementation Singleton
+(Singleton*)sharedInstance
{
    static Singleton *singleton = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        singleton = [[Singleton alloc]init];
    });
    return singleton;
}
+(Singleton*)anotherSharedInstc
{
    static Singleton *singleton = nil;
    @synchronized(self)
    {
        if (singleton == nil) {
            singleton = [[Singleton alloc]init];
        }
    }
    return singleton;
}

-(id)init
{
    if (self = [super init]) {
        _sharedName = @"sharedname";
    }
    return self;
}
@end
