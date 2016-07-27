//
//  JKHotWorksCell.m
//  TRProject
//
//  Created by Tarena on 16/7/10.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "JKHotWorksCell.h"

@implementation JKHotWorksCell
//- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
//    if (self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier]) {
//        [self iconIV];
//    }
//    return self;
//}
- (UIImageView *)iconIV{
    if (!_iconIV) {
        _iconIV = [UIImageView new];
        [self.contentView addSubview:_iconIV];
        [_iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.equalTo(0);
            make.bottom.equalTo(self.vw.mas_top);
        }];
    }
    return _iconIV;
}
- (UIView *)vw{
    if (!_vw) {
        _vw = [UIView new];
        [self.contentView addSubview:_vw];
        [_vw mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.iconIV.mas_bottom);
            make.left.right.bottom.equalTo(0);
            make.height.equalTo(kScreenW*122/640);
        }];
    }
    return _vw;
}
- (UILabel *)author{
    if (!_author) {
        _author = [UILabel new];
        [self.vw addSubview:_author];
        [_author mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(20);
            make.bottom.equalTo(-10);
        }];
        _author.font = [UIFont systemFontOfSize:11];
        _author.textColor = [UIColor grayColor];
    }
    return _author;
}
- (UILabel *)workName{
    if (!_workName) {
        _workName = [UILabel new];
        [self.vw addSubview:_workName];
        [_workName mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(20);
            make.top.equalTo(20);
        }];
        _workName.font = [UIFont systemFontOfSize:14];
    }
    return _workName;
}
- (UILabel *)num{
    if (!_num) {
        _num = [UILabel new];
        [self.vw addSubview:_num];
        [_num mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(-15);
            make.right.equalTo(-30);
        }];
        _num.font = [UIFont systemFontOfSize:11];
        _num.textColor = [UIColor grayColor];
    }
    return _num;
}
- (UIImageView *)love{
    if (!_love) {
        _love = [UIImageView new];
        [self.vw addSubview:_love];
        [_love mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(-15);
            make.right.equalTo(self.num.mas_left).equalTo(-10);
            make.width.height.equalTo(14);
        }];
    }
    return _love;
}

@end
