//
//  YYHGoodSegmentedControl.m
//  MGM
//
//  Created by 阳永辉 on 16/9/22.
//  Copyright © 2016年 yangyonghui. All rights reserved.
//

#import "YYHGoodSegmentedControl.h"

@implementation YYHGoodSegmentedControl

- (instancetype)initWithItems:(NSArray *)items withFrame:(CGRect)frame{
    self = [super initWithItems:items];
    if (self) {
        //设置frame
        self.frame = frame;
        //设置基本的属性
        self.tintColor = [ColorDealingWay colorWithHexString:@"#fdd534"];
        self.backgroundColor = [UIColor whiteColor];
        self.selectedSegmentIndex = 0;
        self.layer.borderColor = [ColorDealingWay colorWithHexString:@"#7f500b"].CGColor;
        self.layer.borderWidth = 1;
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = frame.size.height / 2;
        //插入中间图片
        CGFloat centerImageHeight = 1.0f;
        CGRect newRect = CGRectMake(0.0f, 0.0f, centerImageHeight, frame.size.height);
        UIImage *insertCenterImage = [self imageWithColor:[ColorDealingWay colorWithHexString:@"#7f500b"] with:newRect];
        [self setDividerImage:insertCenterImage forLeftSegmentState:UIControlStateNormal rightSegmentState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
        //设置正常状态下的字体颜色
        NSDictionary *normalAttributes = @{NSFontAttributeName:[UIFont boldSystemFontOfSize:14],NSForegroundColorAttributeName:[ColorDealingWay colorWithHexString:@"#7f500b"]};
        [self setTitleTextAttributes:normalAttributes forState:UIControlStateNormal];
        //设置选中状态下的字体颜色
        NSDictionary *selectedAttributes = @{NSFontAttributeName:[UIFont boldSystemFontOfSize:14],NSForegroundColorAttributeName:[ColorDealingWay colorWithHexString:@"#341f01"]};
        [self setTitleTextAttributes:selectedAttributes forState:UIControlStateSelected];
        [self addTarget:self action:@selector(valueChangeAction:) forControlEvents:UIControlEventValueChanged];
    }
    return self;
}

- (void)valueChangeAction:(UISegmentedControl *)seg {
    self.block(seg.selectedSegmentIndex);
}

//根据颜色绘制图片
- (UIImage *)imageWithColor:(UIColor *)color  with:(CGRect )rect {
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end
