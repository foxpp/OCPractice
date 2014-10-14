//
//  TemplateMethod.m
//  VisitorTest
//
//  Created by zhaochao on 14-10-14.
//  Copyright (c) 2014年 zhaochao. All rights reserved.
//

#import "TemplateMethod.h"

@implementation TemplateMethod
-(void)makeIt
{
    [self step1];
    [self step2];
    [self step3];
    if ([self hook]) {
        [self hookMethod];
    }
}
-(BOOL)hook
{
    return NO;
}
-(void)hookMethod
{
    
}
-(void)step1
{
    NSLog(@"种下苹果");
}

-(void)step3
{
    NSLog(@"摘下苹果");
}

-(void)step2
{
    NSLog(@"给苹果浇水");
}

@end


@implementation Apple


@end

@implementation SuperApple
-(void)step1
{
    NSLog(@"种下超级苹果");
    [self specialStep];
}
//private method
-(void)specialStep
{
    NSLog(@"添加秘方");
}

-(void)step3
{
    NSLog(@"摘下超级苹果");
}
-(BOOL)hook
{
    return NO;
}
-(void)hookMethod
{
    NSLog(@"钩子函数");
}
@end