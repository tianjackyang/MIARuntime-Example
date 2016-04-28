//
//  Person+PersonExtention.h
//  MIARuntime-Example
//
//  Created by 杨鹏 on 16/4/28.
//  Copyright © 2016年 杨鹏. All rights reserved.
//

#import "Person.h"
#import <objc/runtime.h>

@interface Person (PersonExtention)
//分类其实是可以添加属性的，只是不能添加成员变量，同样可以使用@property，但是只生成getter和setter并且不会自动实现
@property (copy, nonatomic) NSString *name;

-(void)saySex;

@end
