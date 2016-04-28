//
//  ViewController.m
//  MIARuntime-Example
//
//  Created by 杨鹏 on 16/4/28.
//  Copyright © 2016年 杨鹏. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>    //运行时添加的头文件
#import "Person+PersonExtention.h"
#import "Movie.h"
#import "NSObject+Item.h"

@interface ViewController ()<NSCopying, NSCopying, UIGestureRecognizerDelegate, UITextFieldDelegate>
@property (nonatomic, strong) NSArray      *ext;
@property (nonatomic, strong) NSDictionary *info;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.view setBackgroundColor:[UIColor redColor]];
    
    //获取类的成员变量，包括属性
#warning 获取类的成员变量,属性都带下划线
    NSLog(@"==============获取类的成员变量,属性都带下划线=================================");
    unsigned int count1;
    Ivar *var = class_copyIvarList([self class], &count1);
    for (int i = 0; i < count1; i++) {
        Ivar iv = var[i];
        const char *ivarName = ivar_getName(iv);
        NSLog(@"%@", [NSString stringWithUTF8String:ivarName]);
    }
    
#warning 获取类的属性,不包括成员变量
    //获取类的属性,不包括成员变量
    NSLog(@"==============获取类的属性,不包括成员变量=================================");
    unsigned int count2;
    objc_property_t *pt = class_copyPropertyList([self class], &count2);
    for (int i = 0; i < count2; i++) {
        objc_property_t pot = pt[i];
        const char *ptName = property_getName(pot);
        NSLog(@"%@", [NSString stringWithUTF8String:ptName]);
    }
    
#warning 获取类中的方法,不包括类方法
    //获取类的方法，不包括类方法
    NSLog(@"===================获取类中的方法,不包括类方法============================");
    unsigned int count3;
    Method *mt = class_copyMethodList([self class], &count3);
    for (int i = 0; i < count3; i++) {
        Method mth = mt[i];
        SEL mtName = method_getName(mth);
        NSLog(@"%@", NSStringFromSelector(mtName));
    }
    
#warning 获取类的协议
    //获取类的协议
    NSLog(@"===================获取类的协议============================");
    unsigned int count4;
    __unsafe_unretained Protocol **ptc = class_copyProtocolList([self class], &count4);
    for (int i = 0; i < count4; i++) {
        Protocol *ptco = ptc[i];
        const char *ptcName = protocol_getName(ptco);
        NSLog(@"%@", [NSString stringWithUTF8String:ptcName]);
    }
    
#warning 动态添加属性
    //关联对象(一般都是在分类中使用，动态添加属性)
    NSLog(@"===================动态添加属性============================");
    Person *ps = [[Person alloc] init];
    [ps setName:@"jacky"];
    NSLog(@"%@", ps.name);
    
#warning 动态添加方法
    //动态添加方法
    NSLog(@"===================动态添加方法===========================");
    Person *ps2 = [[Person alloc] init];
    class_addMethod(ps2.class, @selector(say:), (IMP)addMethod, "v@:@");
    if ([ps2 respondsToSelector:@selector(say:)]) {
        [ps2 performSelector:@selector(say:) withObject:@"welocome to"];
    }
    
#warning 方法交换，替换方法，方法上增加额外的功能
    //方法交换
    NSLog(@"===================方法交换，替换方法，方法上增加额外的功能===========================");
    //具体查看ViewController+swizzling
    
#warning nscoding自动归解档
    //nscoding自动归解档
    NSLog(@"===================nscoding自动归解档===========================");
    Movie *m = [Movie new];
    m.movieName = @"aaaaaaaa";
    m.movieId = @"1222331";
    m.pic_url = @"llllllllll";
    
    NSString *document  = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).lastObject;
    NSString *filePath = [document stringByAppendingString:@"/123.txt"];
    [NSKeyedArchiver archiveRootObject:m toFile:filePath];
    Movie *movie =  [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
    NSLog(@"----%@",movie);
    
#warning 字典模型转化
    //字典模型转化
    NSLog(@"===================字典模型转化===========================");
    NSDictionary *dict = @{ @"movieId":@"28678",
                            @"movieName": @"539fU8276",
                            @"pic_url": @"fsdfds"
                            };
    NSArray *addarr = @[dict ,dict, dict];
    for (NSDictionary *item in addarr) {
        Movie *movie = [Movie objectWithDict:item];
        NSLog(@"%@", movie);
    }

}

void addMethod(id self, SEL _cmd, NSString *str) {
    NSLog(@"%@", str);
}

- (void)say:(NSString *)str {
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    NSLog(@"viewWillAppear");
}
//=============================
+ (void)testyears {
    
}

+ (void)testmonths {
    
}

+ (void)testdays {
    
}

- (void)testname {
    
}

- (void)testsex {
    
}

- (void)testage {
    
}

- (void)testaddress {
    
}

- (void)testidentify {
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
