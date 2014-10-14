//
//  ResponsiblityChain.m
//  VisitorTest
//
//  Created by zhaochao on 14-10-14.
//  Copyright (c) 2014年 zhaochao. All rights reserved.
//

#import "ResponsiblityChain.h"

@implementation ResponsiblityChain
@synthesize next;
-(id)init
{
    if (self = [super init]) {
        next = nil;
    }
    return self;
}

-(void)HandleIt:(int)reqNum
{
    if (reqNum <= 100) {
        [self HandleRequest:reqNum];
    }
    else
    {
        NSLog(@"no one can't handle this %d", reqNum);
    }
    if (nil != next) {
        [self.next HandleIt:reqNum];
    }
}

-(void)HandleRequest:(int)reqNum
{
    [NSException raise:NSInternalInconsistencyException format:@"you must override this :  %@ method", NSStringFromSelector(_cmd)];
}
@end


@implementation A1

-(void)HandleRequest:(int) reqNum
{
    if (reqNum < 10) {
        NSLog(@"A1 is the handler , the req num is : %d", reqNum);
    }
}

@end

@implementation A2

-(void)HandleRequest:(int) reqNum
{
    if (reqNum >= 10 && reqNum < 20) {
        NSLog(@"A2 is the handler , the req num is : %d", reqNum);
    }
}

@end

@implementation A3

-(void)HandleRequest:(int) reqNum
{
    if (reqNum >= 20 && reqNum < 30) {
        NSLog(@"A3 is the handler , the req num is : %d", reqNum);
    }
}

@end

@implementation A4

-(void)HandleRequest:(int) reqNum
{
    if (reqNum >= 30 && reqNum < 40) {
        NSLog(@"A4 is the handler , the req num is : %d", reqNum);
    }
}

@end
@implementation A5

-(void)HandleRequest:(int) reqNum
{
    if (reqNum >= 40 && reqNum < 50) {
        NSLog(@"A is the handler , the req num is : %d", reqNum);
    }
}

@end


