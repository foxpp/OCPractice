//
//  LearnString.m
//  LearnNSString
//
//  Created by zhaochao on 14-9-26.
//  Copyright (c) 2014年 zhaochao. All rights reserved.
//

#import "LearnString.h"

@implementation LearnString
+(void)TestString
{
    NSString *str = @"first string中文测试";  // 这里的中文被当做单个字符对待，和C语言不同,NSString内部做了处理的,也许是unicode ?  NSString 只是基类    具体拿到的到底是何种字符串的源码无法看到  fuck
    NSUInteger len = [str length];
    for (int i = 0; i < len; ++i) {
        unichar ch = [str characterAtIndex:i];
        NSLog(@"%d : %c", i , ch);
    }
    
    unichar strBuf[100] = {};
    [str getCharacters:strBuf];
    unichar strBufForRn[100] = {};
    [str getCharacters:strBufForRn range:NSMakeRange(6, 9)];
    NSString *subStr = [NSString stringWithCharacters:strBuf length:len];
    NSLog(@"%@", subStr);
    NSLog(@"%@", [NSString stringWithCharacters:strBufForRn length:7]);
    
    
    NSString *subTest1 = [str substringFromIndex:3];// 和 [str getCharacters:strBufForRn range:NSMakeRange(3, len)]; 一样  估计内部调用了这个
    NSLog(@"%@", subTest1);
    
    NSString *subToTest = [str substringToIndex:5];// 和 [str getCharacters:strBufForRn range:NSMakeRange(0, 5)]; 一样  估计内部调用了这个
    NSLog(@"%@", subToTest);
    
}
@end
