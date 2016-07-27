//
//  JKHomePageViewCell.m
//  TRProject
//
//  Created by Tarena on 16/7/5.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "JKHomePageViewCell.h"

@implementation JKHomePageViewCell
- (UIImageView *)imageVW{
    if (!_imageVW) {
        _imageVW = [UIImageView new];
        [self.contentView addSubview:_imageVW];
        [_imageVW mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(0);
        }];
    }
    return _imageVW;
}
- (UIView *)black{
    if (!_black) {
        _black = [UIView new];
        [self.imageVW addSubview:_black];
        [_black mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(0);
        }];
        _black.backgroundColor = kRGBColor(0, 0, 0, 0.4);
    }
    return _black;
}
- (UILabel *)name{
    if (!_name) {
        _name = [UILabel new];
        [self.black addSubview:_name];
        [_name mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(0);
            make.left.equalTo(8);
            make.right.equalTo(-8);
        }];
        _name.textAlignment = NSTextAlignmentCenter;
        _name.textColor = [UIColor whiteColor];
        _name.numberOfLines = 0;
        _name.font = [UIFont systemFontOfSize:16];
        
    }
    return _name;
}
- (UIImageView *)eyeVM{
    if (!_eyeVM) {
        _eyeVM = [UIImageView new];
        [self.black addSubview:_eyeVM];
        [_eyeVM mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(16);
            make.height.equalTo(11.5);
            make.top.equalTo(self.name.mas_bottom).equalTo(10);
            make.centerX.equalTo(0);
        }];
        _eyeVM.image = [UIImage imageNamed:@"display-eye@2x.png.base.universal.regular.off.horizontal.normal.active.onepartscale.onepart.11589.000.00."];
    }
    return _eyeVM;
}
- (UILabel *)numlabel{
    if (!_numlabel) {
        _numlabel = [UILabel new];
        [self.black addSubview:_numlabel];
        [_numlabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.name.mas_bottom).equalTo(10);
            make.left.equalTo(self.eyeVM.mas_right).equalTo(5);
        }];
        _numlabel.textColor = [UIColor whiteColor];
        _numlabel.font = [UIFont systemFontOfSize:11];
    }
    return _numlabel;
}
@end
