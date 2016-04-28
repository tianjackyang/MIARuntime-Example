//
//  ViewController.h
//  MIARuntime-Example
//
//  Created by 杨鹏 on 16/4/28.
//  Copyright © 2016年 杨鹏. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController{
    //成员变量
    NSInteger years;
    NSInteger months;
    NSInteger days;
}

//属性(属性是由成员变量＋setter+getter组成的)
@property (nonatomic, copy    ) NSString  *name;
@property (nonatomic, copy    ) NSString  *identify;
@property (nonatomic, copy    ) NSString  *sex;
@property (nonatomic, copy    ) NSString  *address;
@property (nonatomic, assign  ) NSInteger age;

+ (void)testyears;
+ (void)testmonths;
+ (void)testdays;
- (void)testname;
- (void)testsex;
- (void)testage;
- (void)testaddress;
- (void)testidentify;

@end

