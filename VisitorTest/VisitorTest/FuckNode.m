//
//  FuckNode.m
//  VisitorTest
//
//  Created by zhaochao on 14-10-14.
//  Copyright (c) 2014年 zhaochao. All rights reserved.
//

#import "FuckNode.h"


@implementation Node
-(void)acceptVisitor :(id <Visitor>) visitor
{
    NSLog(@"base node called!");
}
@end

@implementation A
@synthesize a;
@synthesize name;
-(void)acceptVisitor:(id<Visitor>)visitor
{
    [visitor visitA:self];
}
@end

@implementation B
@synthesize d;
@synthesize arr;
-(void)acceptVisitor:(id<Visitor>)visitor
{

    [visitor visitB:self];
}
@end

@implementation VisitorImp1

-(void)visitA:(A *)aNode
{
    NSLog(@"%d, name: %@", aNode.a, aNode.name);
}

-(void)visitB:(B *)bNode
{
    NSLog(@"%f", bNode.d);
    int i = 0;
    for (id e in bNode.arr) {
        NSString* some = e;
        NSLog(@"%d, %@", ++i, some);
    }
}
-(void)visitAChild: (AChild*) achild
{
    NSLog(@"a's child visit");
    NSLog(@"%d, name: %@", achild.a, achild.name);
    NSLog(@"%@", achild.dic);
}
@end

@implementation ManyNodes
@synthesize children;
@synthesize arrname;
-(id)init
{
    if (self = [super init]) {
        children = [NSMutableArray new];
        arrname = @"my name is arr";
    }
    return self;
}
-(void)acceptVisitor:(id<Visitor>)visitor
{
    NSLog(@"fucking children iterator");
    for (Node* nd in children)
    {
        [nd acceptVisitor:visitor];
    }
}
@end

@implementation AChild
@synthesize dic;
-(id)init
{
    if (self = [super init]) {
        dic = [NSDictionary new];
        dic = @{@"test": @1, @"ttt": @2};
        self.a = 11;
        self.name = @"a's child";
        test = 101;
    }
    return self;
}

-(void)acceptVisitor:(id<Visitor>)visitor
{
    [visitor visitAChild:self];
}

@end