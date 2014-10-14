//
//  main.c
//  VisitorTest
//
//  Created by zhaochao on 14-10-14.
//  Copyright (c) 2014年 zhaochao. All rights reserved.
//

#include <CoreFoundation/CoreFoundation.h>
#import "FuckNode.h"
#import "TemplateMethod.h"
#import "ResponsiblityChain.h"
void TestVisitor()
{
    VisitorImp1 *vistor = [VisitorImp1 new];
    A* anode = [A new];
    anode.a = 1;
    anode.name = @"testset";
    [anode acceptVisitor: vistor];
    
    B* bnode = [B new];
    bnode.d = 10.1f;
    bnode.arr = @[@"jack", @"slow", @"fuck"];
    [bnode acceptVisitor:vistor];
    
    ManyNodes *nodes = [ManyNodes new];
    [nodes.children addObject:anode];
    [nodes.children addObject:bnode];
    [nodes.children addObject:[AChild new]];
    [nodes acceptVisitor:vistor];
}

void TestTemplateMethod()
{
    TemplateMethod *tmp = [SuperApple new];
    [tmp makeIt];
}

void TestChain()
{
    ResponsiblityChain *a1 = [A1 new];
    ResponsiblityChain *a2 = [A2 new];
    ResponsiblityChain *a3 = [A3 new];
    a1.next = a2;
    a2.next = a3;
    [a1 HandleIt:300];
}

int main(int argc, const char * argv[])
{
    TestChain();
    return 0;
}

