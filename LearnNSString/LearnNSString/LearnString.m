
//  LearnString.m
//  LearnNSString
//
//  Created by zhaochao on 14-9-26.
//  Copyright (c) 2014年 zhaochao. All rights reserved.
//

#import "LearnString.h"

@implementation NSString (Reverse)

-(NSString*)reverseString{
    assert(self);
    NSUInteger len = self.length;
    NSMutableString *reversed = [[NSMutableString alloc]initWithCapacity:len];
    while (len > 0) {
        [reversed appendFormat:@"%C", [self characterAtIndex:len-1]];
        len--;
    }
    return reversed;
}

-(NSArray*)splitByToken:(NSString *) separatorSet{
    assert(nil != separatorSet && separatorSet.length > 0);
    NSCharacterSet *sepSet = [NSCharacterSet characterSetWithCharactersInString:separatorSet];
    return [self componentsSeparatedByCharactersInSet:sepSet];
}

-(BOOL) hasSubString:(NSString *) subString{
    assert(nil != subString && subString.length > 0);
    return [self rangeOfString:subString].location != NSNotFound;
}

-(NSString*) trimAll{
    assert(self);
    NSCharacterSet *trimSet = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    NSArray * tmpArr = [self componentsSeparatedByCharactersInSet:trimSet];
    return  [tmpArr componentsJoinedByString:@""];
}
-(BOOL)hasNoCharacter{
    assert(self);
    NSString *trimed = [self trimAll];
    return 0 == trimed.length;
}
-(BOOL)isEmpty{
    assert(self);
    return 0 == self.length;
}
@end