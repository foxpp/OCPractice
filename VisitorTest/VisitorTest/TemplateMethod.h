//
//  TemplateMethod.h
//  VisitorTest
//
//  Created by zhaochao on 14-10-14.
//  Copyright (c) 2014年 zhaochao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TemplateMethod : NSObject
-(void)makeIt;

//steps  , must override by subclass
-(void)step1;
-(void)step2;
-(void)step3;
-(BOOL)hook;
-(void)hookMethod;
@end


@interface Apple : TemplateMethod
-(void)step1;
-(void)step2;
-(void)step3;
@end

@interface SuperApple : TemplateMethod

-(void)step1;
-(void)step2;
-(void)step3;

@end