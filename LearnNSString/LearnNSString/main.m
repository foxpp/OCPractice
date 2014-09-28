//
//  main.c
//  LearnNSString
//
//  Created by zhaochao on 14-9-26.
//  Copyright (c) 2014年 zhaochao. All rights reserved.
//

#include <CoreFoundation/CoreFoundation.h>
#import "LearnString.h"
int main(int argc, const char * argv[])
{
    NSString *test = @"abc,中 文测试";
    NSString *reversed = [test reverseString];
    NSLog(@"after reversed : %@", reversed);
    NSArray *arr = [test splitByToken:@", "];
    NSLog(@"%@", arr);
    NSString *a[2] = { @"no , it's not sub",@"yes,it's sub"};
    BOOL isSub = [@"abcefg" hasSubString:@"aaa"];
    NSLog(@"%@", a[isSub]);
    return 0;
}

