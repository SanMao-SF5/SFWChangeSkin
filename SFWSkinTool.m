//
//  SFWSkinTool.m
//  换肤
//
//  Created by 沈方武 on 15/7/28.
//  Copyright (c) 2015年 沈方武. All rights reserved.
//

#import "SFWSkinTool.h"

@implementation SFWSkinTool

// 定义静态属性保存设置好的颜色
static NSString *_skinColor;

// 定义一个常量保存key值（由于宏可能在内存有多份，且加载速度慢）
NSString *const skinColor = @"skinColor";

#pragma mark - 当前类或者当前类的子类第一次使用的时候调用
+ (void)initialize{

    // 程序加载完应先从偏好设置取值，如果偏好设置没有值，再设置默认值
    _skinColor = [[NSUserDefaults standardUserDefaults] objectForKey:skinColor];
    
    if (!_skinColor) {
        
        _skinColor = @"blue";
    }
}

#pragma mark - 把用户设置的颜色保存到偏好设置方便下次打开启用
+(void)SkinWithColor:(NSString *)color{

    _skinColor = color;
    
    // 保存到偏好设置
    [[NSUserDefaults standardUserDefaults] setObject:color forKey:skinColor];
    // 立即保存
    [[NSUserDefaults standardUserDefaults] synchronize];
}

#pragma mark - 根据用户传递的图片名称生成image返回给用户
+ (UIImage *)imgaeWithName:(NSString *)imageName{
    
    NSString *name = [NSString stringWithFormat:@"%@_%@",_skinColor,imageName];
    
    return [UIImage imageNamed:name];
}

@end
