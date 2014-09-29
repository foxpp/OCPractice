
//  LearnString.m
//  LearnNSString
//
//  Created by zhaochao on 14-9-26.
//  Copyright (c) 2014年 zhaochao. All rights reserved.
//
#import <CommonCrypto/CommonDigest.h>
#import "LearnString.h"

@implementation NSString (NSStringPlus)

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

- (NSString *)md5Encrypt {
    const char *original_str = [self UTF8String];
    
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(original_str, strlen(original_str), result);
    NSMutableString *hash = [NSMutableString string];
    for (int i = 0; i < 16; i++)
        [hash appendFormat:@"%02X", result[i]];
    return [hash lowercaseString];
}


- (BOOL)isValidEmail
{
    NSString *regex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTestPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [emailTestPredicate evaluateWithObject:self];
}

- (BOOL)isValidUrl
{
    NSString *regex =@"(http|https)://((\\w)*|([0-9]*)|([-|_])*)+([\\.|/]((\\w)*|([0-9]*)|([-|_])*))+";
    NSPredicate *urlTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    return [urlTest evaluateWithObject:self];
}

-(NSArray*) getWords
{
    NSPredicate *noEmpty = [NSPredicate predicateWithFormat:@"SELF != ''"];
    NSArray *arr = [self componentsSeparatedByString:@" "];
    arr = [arr filteredArrayUsingPredicate:noEmpty];
    return arr;
}

- (NSString *) transToPinYin
{
    NSMutableString *source = [self mutableCopy];
    CFStringTransform((__bridge CFMutableStringRef)source, NULL, kCFStringTransformMandarinLatin, NO);
    CFStringTransform((__bridge CFMutableStringRef)source, NULL, kCFStringTransformStripDiacritics, NO);
    return source;
}

-(BOOL)hasChinese{
    for(int i=0; i< [self length];i++){
        int a = [self characterAtIndex:i];
        if( a > 0x4e00 && a < 0x9fff)
        {
            return YES;
        }
    }
    return NO;
}

@end
