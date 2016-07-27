//
//  JKHeaderCollectionViewCell.m
//  TRProject
//
//  Created by Tarena on 16/7/8.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "JKHeaderCollectionViewCell.h"

@implementation JKHeaderCollectionViewCell
- (UIImageView *)imageVW{
    if (!_imageVW) {
        _imageVW = [UIImageView new];
        [self.contentView addSubview:_imageVW];
        [_imageVW mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(0);
        }];
        _imageVW.layer.cornerRadius = 5;
        _imageVW.clipsToBounds = YES;
    }
    return _imageVW;
}
@end
