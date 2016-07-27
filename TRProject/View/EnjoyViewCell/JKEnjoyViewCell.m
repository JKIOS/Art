//
//  JKEnjoyViewCell.m
//  TRProject
//
//  Created by HJK on 16/7/10.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "JKEnjoyViewCell.h"

@implementation JKEnjoyViewCell
- (UIImageView *)iconIV{
    if (!_iconIV) {
        _iconIV= [UIImageView new];
        [self.contentView addSubview:_iconIV];
        [_iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(kScreenW/2);
            make.bottom.equalTo(0);
            make.height.equalTo(kScreenW/2*450/750);
            make.left.equalTo(10);
        }];
    }
    return _iconIV;
}
- (UILabel *)title{
    if (!_title) {
        _title = [UILabel new];
        [self.contentView addSubview:_title];
        [_title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.iconIV.mas_top);
            make.left.equalTo(self.iconIV.mas_right).equalTo(10);
            make.right.equalTo(-5);
        }];
        _title.font = [UIFont systemFontOfSize:14];
        _title.numberOfLines = 0;
    }
    return _title;
}
- (UILabel *)viewNum{
    if (!_viewNum) {
        _viewNum = [UILabel new];
        [self.contentView addSubview:_viewNum];
        [_viewNum mas_makeConstraints:^(MASConstraintMaker *make) {
           make.left.equalTo(self.iconIV.mas_right).equalTo(10);
            make.bottom.equalTo(-5);
        }];
        _viewNum.font = [UIFont systemFontOfSize:12];
        _viewNum.textColor = [UIColor grayColor];
    }
    return _viewNum;
}
- (UILabel *)author{
    if (!_author) {
        _author = [UILabel new];
        [self.contentView addSubview:_author];
        [_author mas_makeConstraints:^(MASConstraintMaker *make) {
           make.left.equalTo(self.iconIV.mas_right).equalTo(10);
            make.bottom.equalTo(self.viewNum.mas_top).equalTo(-5);
        }];
        _author.font = [UIFont systemFontOfSize:12];
        _author.textColor = [UIColor grayColor];
    }
    return _author;
}
@end
