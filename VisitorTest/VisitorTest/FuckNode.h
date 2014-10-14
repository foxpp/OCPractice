//
//  FuckNode.h
//  VisitorTest
//
//  Created by zhaochao on 14-10-14.
//  Copyright (c) 2014年 zhaochao. All rights reserved.
//

#import <Foundation/Foundation.h>
struct T
{
    int a;
    int b;
};
@class A;
@class B;
@class AChild;

@protocol Visitor
-(void)visitA: (A*) aNode;
-(void)visitB: (B*) bNode;
-(void)visitAChild: (AChild*) achild;
@end

@interface VisitorImp1 :NSObject <Visitor>
-(void)visitA: (A*) aNode;
-(void)visitB: (B*) bNode;
@end

@interface Node : NSObject
-(void)acceptVisitor :(id <Visitor>) visitor;
@end

@interface A : Node
{
    int test;
}
@property int a;
@property NSString* name;
-(void)acceptVisitor:(id<Visitor>)visitor;
@end

@interface B : Node
@property double d;
@property NSArray * arr;
-(void)acceptVisitor:(id<Visitor>)visitor;
@end

@interface ManyNodes : Node
@property NSString *arrname;
@property struct T a;
@property NSMutableArray *children;
-(void)acceptVisitor:(id<Visitor>)visitor;
@end

@interface AChild : A
@property NSDictionary *dic;
-(void)acceptVisitor:(id<Visitor>)visitor;
@end

