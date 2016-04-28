//
//  Person.m
//  MIARuntime-Example
//
//  Created by 杨鹏 on 16/4/28.
//  Copyright © 2016年 杨鹏. All rights reserved.
//

#import "Person.h"
@interface Person ()
//扩展中可以添加属性和方法
@end

@implementation Person
//编译器期间，让编译器自动生成getter/setter方法。当有自定义的存或取方法时，自定义会屏蔽自动生成该方法
@synthesize age = _age;

-(void)run{
    NSLog(@"%s",__func__);
}

@end
