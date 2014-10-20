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
    NSString *str = @"a b c test the set for nsstring a b c";
    NSString *trimed  = [str getWords];
    return 0;
}

