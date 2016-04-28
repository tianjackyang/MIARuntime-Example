//
//  Movie.h
//  MIARuntime-Example
//
//  Created by 杨鹏 on 16/4/28.
//  Copyright © 2016年 杨鹏. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Movie : NSObject <NSCoding>
@property (nonatomic, copy) NSString *movieId;
@property (nonatomic, copy) NSString *movieName;
@property (nonatomic, copy) NSString *pic_url;
@end
