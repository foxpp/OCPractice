//
//  ResponsiblityChain.h
//  VisitorTest
//
//  Created by zhaochao on 14-10-14.
//  Copyright (c) 2014年 zhaochao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ResponsiblityChain : NSObject
@property ResponsiblityChain *next;
-(void)HandleRequest:(int) reqNum;
@end

@interface A1 : ResponsiblityChain
-(void)HandleRequest:(int) reqNum;
@end
@interface A2 : ResponsiblityChain
-(void)HandleRequest:(int) reqNum;
@end
@interface A3 : ResponsiblityChain
-(void)HandleRequest:(int) reqNum;
@end
@interface A4 : ResponsiblityChain
-(void)HandleRequest:(int) reqNum;
@end
@interface A5 : ResponsiblityChain
-(void)HandleRequest:(int) reqNum;
@end

@interface StopChain : NSObject
-(void)HandleRequest:(int) reqNum;
@end
