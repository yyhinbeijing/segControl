//
//  YYHSegmentedControl.h
//  UITableViewDemo
//
//  Created by 阳永辉 on 16/9/22.
//  Copyright © 2016年 yangyonghui. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void (^UISegmentedControlBlock)(NSInteger index);

@interface YYHSegmentedControl : UISegmentedControl
@property (nonatomic, copy) UISegmentedControlBlock block;
- (instancetype)initWithItems:(nullable NSMutableArray *)deepImageNames shallowImageNames:(NSMutableArray *)shallowImageNames;

NS_ASSUME_NONNULL_END
@end
