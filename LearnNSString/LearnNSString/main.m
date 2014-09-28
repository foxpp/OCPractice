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
    NSString *whiteSpaceStr = @"  asdas\n\t d  asd  asda    asdas \n\tasfasdfs";
    whiteSpaceStr = [whiteSpaceStr trimAll];
    NSString *emptyStr = @"  \n\t";
    BOOL isEm = [emptyStr hasNoCharacter];
    NSString *test11 = @"aaa";
    BOOL isEmT = [test11 isEmpty];
   // NSString *cp = [test11 mutableCopy];
    NSMutableString *src11 = [[NSMutableString alloc] initWithFormat:@"sfsdfsdf"];
    NSMutableString *cp = [src11 copy];
    return 0;
}

