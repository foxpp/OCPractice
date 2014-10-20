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
-(void)HandleIt:(int)reqNum;
@end

@interface A1 : ResponsiblityChain
@end
@interface A2 : ResponsiblityChain
@end
@interface A3 : ResponsiblityChain
@end
@interface A4 : ResponsiblityChain
@end
@interface A5 : ResponsiblityChain
@end

