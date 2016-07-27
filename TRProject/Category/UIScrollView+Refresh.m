//
//  UIScrollView+Refresh.m
//  Day08_Beauty
//
//  Created by tarena on 16/2/4.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "UIScrollView+Refresh.h"

@implementation UIScrollView (Refresh)
/** 添加头部刷新 */
- (void)addHeaderRefresh:(MJRefreshComponentRefreshingBlock)block{
    self.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        !block ?: block();
    }];
}
/** 添加脚部自动刷新 */
- (void)addAutoFooterRefresh:(MJRefreshComponentRefreshingBlock)block{
    self.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        !block ?: block();
    }];
}
/** 添加脚步返回刷新 */
- (void)addBackFooterRefresh:(MJRefreshComponentRefreshingBlock)block{
    self.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        !block ?: block();
    }];
    
}
/** 结束头部刷新 */
- (void)endHeaderRefresh{
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.mj_header endRefreshing];
    });
    
}
/** 结束脚部刷新 */
- (void)endFooterRefresh{
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.mj_footer endRefreshing];
    });
    
}
/** 开始头部刷新 */
- (void)beginHeaderRefresh{
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.mj_header beginRefreshing];
    });
    
}
/** 开始脚部刷新 */
- (void)beginFooterRefresh{
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.mj_footer beginRefreshing];
    });
    
}

/** 停止脚步刷新,并标注没有更多数据 */

- (void)endFooterRefreshWithNoMoreData{
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.mj_footer endRefreshingWithNoMoreData];
    });
}
@end












