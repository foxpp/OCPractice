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

int main(int argc, const char * argv[])
{
    TestTemplateMethod();
    return 0;
}

