//
//  XHViewState.m
//  XHImageViewer
//
//  Created by 曾 宪华 on 14-2-17.
//  Copyright (c) 2014年 曾宪华 开发团队(http://iyilunba.com ) 本人QQ:543413507 本人QQ群（142557668）. All rights reserved.
//

#import "XHViewState.h"

@implementation XHViewState

+ (XHViewState *)viewStateForView:(UIView *)view {
    
    //如果字典为空 将其初始化
    static NSMutableDictionary *dict = nil;
    if(dict==nil){ dict = [NSMutableDictionary dictionary]; }
    //hash 哈希值将任意长度的二进制值映射为固定长度的较小的二进制值  这个小的二进制值成为哈希值。哈希值是一段数据段唯一且极其紧凑的数值表示形式，如果散列一段明文哪怕有一个字母改变，随后生成的哈希值都将产生不同的值
    XHViewState *state = dict[@(view.hash)];
    if(state==nil){
        state = [[self alloc] init];
        dict[@(view.hash)] = state;
    }
    return state;
}

- (void)setStateWithView:(UIView *)view {
    //In Quartz, affine transforms are represented by a 3 by 3 matrix:
    //transform:Specifies the transform applied to the receiver, relative to the center of its bounds.
    //获取相对于边界的中心点
    CGAffineTransform trans = view.transform;
    view.transform = CGAffineTransformIdentity;
    //The identity transform:A 3 by 3 identity matrix.
    self.superview = view.superview;
    self.frame     = view.frame;
    self.transform = trans;
    self.userInteratctionEnabled = view.userInteractionEnabled;
    
    view.transform = trans;
}

@end
