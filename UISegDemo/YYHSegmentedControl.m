//
//  YYHSegmentedControl.m
//  UITableViewDemo
//
//  Created by 阳永辉 on 16/9/22.
//  Copyright © 2016年 netposa. All rights reserved.
//

#import "YYHSegmentedControl.h"
@interface YYHSegmentedControl()

@property (nonatomic, strong) NSMutableArray *deepImageNameArr;
@property (nonatomic, strong) NSMutableArray *shallowImageNameArr;

@end

@implementation YYHSegmentedControl

- (instancetype)initWithItems:(NSMutableArray *)deepImageNames shallowImageNames:(NSMutableArray *)shallowImageNames {
    self.deepImageNameArr = deepImageNames;
    self.shallowImageNameArr = shallowImageNames;
    self.tintColor = [UIColor whiteColor];
    self = [super initWithItems:[self dealNameItemsToImagesArr:[self getShouldDealImageNameArr:deepImageNames otherArr:shallowImageNames]]];
    if (self) {
        self.selectedSegmentIndex = 0;
        [self addTarget:self action:@selector(valueChange:) forControlEvents:UIControlEventValueChanged];
    }
    return self;
}

- (void)valueChange:(UISegmentedControl *)seg {
    for (int j = 0; j < self.deepImageNameArr.count; j++) {
        if (j == seg.selectedSegmentIndex) {
            [self setImage:[self dealImageNameToImage:self.deepImageNameArr[seg.selectedSegmentIndex]] forSegmentAtIndex:seg.selectedSegmentIndex];
        }else {
            [self setImage:[self dealImageNameToImage:self.shallowImageNameArr[j]] forSegmentAtIndex:j];
        }
    }
    self.block(seg.selectedSegmentIndex);
}

- (NSMutableArray *)getShouldDealImageNameArr:(NSMutableArray *)firstArr  otherArr:(NSMutableArray *)secondArr {
    NSMutableArray *arr = [NSMutableArray array];
    [arr addObject:firstArr[0]];
    for (int i = 1; i<secondArr.count; i++) {
        [arr addObject:secondArr[i]];
    }
    return arr;
}

- (NSMutableArray *)dealNameItemsToImagesArr:(NSMutableArray *)imageNames {
    NSMutableArray *arr = [NSMutableArray array];
    for (int i = 0; i < imageNames.count; i++) {
        UIImage *image = [[UIImage imageNamed:imageNames[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        [arr addObject:image];
    }
    return arr;
}

- (UIImage *)dealImageNameToImage:(NSString *)imageName {
    UIImage *image = [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    return image;
}

@end
