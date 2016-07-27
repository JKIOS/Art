//
//  JKFirstReusableView.m
//  TRProject
//
//  Created by HJK on 16/7/8.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "JKFirstNextReusableView.h"

@implementation JKFirstNextReusableView
- (UIImageView *)heardview{
    if (!_heardview) {
        _heardview = [UIImageView new];
        [self addSubview:_heardview];
        [_heardview mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(0);
            make.top.equalTo(20);
            make.height.width.equalTo(100);
        }];
        _heardview.layer.cornerRadius = 50;
        _heardview.clipsToBounds = YES;
        _heardview.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _heardview;
}
- (UILabel *)title{
    if (!_title) {
        _title = [UILabel new];
        [self addSubview:_title];
        [_title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(0);
            make.top.equalTo(self.heardview.mas_bottom).equalTo(10);
        }];
    }
    return _title;
}
@end
