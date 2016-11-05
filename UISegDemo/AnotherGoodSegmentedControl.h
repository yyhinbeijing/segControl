//
//  YYHGoodSegmentedControl.h
//  MGM
//
//  Created by 阳永辉 on 16/9/22.
//  Copyright © 2016年 yangyonghui. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^YYHGoodSegmentedControlBlock)(NSInteger index);

@interface YYHGoodSegmentedControl : UISegmentedControl

@property (nonatomic, strong) YYHGoodSegmentedControlBlock block;

- (instancetype)initWithItems:(NSArray *)items withFrame:(CGRect )frame;

@end
