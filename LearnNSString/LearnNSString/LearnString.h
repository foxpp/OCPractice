//
//  LearnString.h
//  LearnNSString
//
//  Created by zhaochao on 14-9-26.
//  Copyright (c) 2014年 zhaochao. All rights reserved.
//

#import <Foundation/Foundation.h>




@interface NSString (NSStringPlus)

-(NSString*)reverseString;
-(NSArray*)splitByToken:(NSString *) separatorSet;
-(BOOL) hasSubString:(NSString *) subString;
-(NSString*) trimAll;
-(BOOL)hasNoCharacter;
-(BOOL)isEmpty;
- (BOOL)isValidEmail;
- (NSString *)md5Encrypt;
-(NSArray*)getWords;
- (NSString *) transToPinYin;
-(BOOL)hasChinese;
@end

