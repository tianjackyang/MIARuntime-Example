//
//  Person+PersonExtention.m
//  MIARuntime-Example
//
//  Created by 杨鹏 on 16/4/28.
//  Copyright © 2016年 杨鹏. All rights reserved.
//

#import "Person+PersonExtention.h"
static char *PersonNameKey = "PersonNameKey";

@implementation Person (PersonExtention)
@dynamic name; //告诉编译器，不自动生成getter/setter方法，避免编译期间产生警告然后由自己实现存取方法

#warning 关联对象，给对象添加属性
//动态添加属性
-(void)setName:(NSString *)name{
    objc_setAssociatedObject(self, PersonNameKey, name, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

-(NSString *)name {
    return objc_getAssociatedObject(self, PersonNameKey);
}

-(void)saySex {
    
}

@end
