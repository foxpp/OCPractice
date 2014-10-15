//
//  Singleton.h
//  VisitorTest
//
//  Created by zhaochao on 14-10-15.
//  Copyright (c) 2014年 zhaochao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Singleton : NSObject
+(Singleton*)sharedInstance;
+(Singleton*)anotherSharedInstc;
@end
