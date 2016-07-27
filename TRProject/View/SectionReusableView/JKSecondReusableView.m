//
//  JKSecondReusableView.m
//  TRProject
//
//  Created by Tarena on 16/7/6.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "JKSecondReusableView.h"

@implementation JKSecondReusableView
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self imageVW];
    }
    return self;
}
- (UIImageView *)imageVW{
    if (!_imageVW) {
        _imageVW = [UIImageView new];
        [self addSubview:_imageVW];
        [_imageVW mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(0);
            make.width.equalTo(150);
            make.height.equalTo(31.5);
        }];
        _imageVW.image = [UIImage imageNamed:@"display-imag@2x.png.base.universal.regular.off.horizontal.normal.active.onepartscale.onepart.40454.000.00."];
    }
    return _imageVW;
}
@end
