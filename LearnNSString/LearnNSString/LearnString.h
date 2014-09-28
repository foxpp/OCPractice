//
//  LearnString.h
//  LearnNSString
//
//  Created by zhaochao on 14-9-26.
//  Copyright (c) 2014年 zhaochao. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSString (Reverse)
//+(NSString*) reverseString: (NSString *)src;
-(NSString*)reverseString;
-(NSArray*)splitByToken:(NSString *) separatorSet;
-(BOOL) hasSubString:(NSString *) subString;
@end
