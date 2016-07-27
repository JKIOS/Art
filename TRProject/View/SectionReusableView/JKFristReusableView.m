//
//  JKFristReusableView.m
//  TRProject
//
//  Created by Tarena on 16/7/6.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "JKFristReusableView.h"
#import "JKHeaderCollectionViewCell.h"
#import "JKICWebView.h"
@interface JKFristReusableView ()<iCarouselDelegate,iCarouselDataSource,UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic) NSTimer *timer;
@property (nonatomic) UIPageControl *pc;
@property (nonatomic) UICollectionViewFlowLayout *flowLayout;
@end
@implementation JKFristReusableView{
    NSTimer *_timer;
}
- (UICollectionViewFlowLayout *)flowLayout{
    if (!_flowLayout) {
        _flowLayout = [UICollectionViewFlowLayout new];
        _flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _flowLayout.minimumLineSpacing = 10;
        _flowLayout.sectionInset = UIEdgeInsetsMake(0, 10, 0, 10);
        _flowLayout.itemSize = CGSizeMake(kScreenW*122/640*185/118, kScreenW*122/640);
    }
    return _flowLayout;
}
- (UICollectionView *)heardView{
    if (!_heardView) {
        _heardView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:self.flowLayout];
        [self addSubview:_heardView];
        [_heardView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.ic.mas_bottom).equalTo(0);
            make.bottom.equalTo(self.view.mas_top).equalTo(0);
            make.right.left.equalTo(0);
        }];
        _heardView.backgroundColor = [UIColor whiteColor];
        _heardView.delegate = self;
        _heardView.dataSource = self;
        _heardView.showsHorizontalScrollIndicator = NO;
    }
    return _heardView;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.labelList.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    JKHeaderCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    [cell.imageVW sd_setImageWithURL:self.labelList[indexPath.row].labelPic2.yx_URL];
    return cell;
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [JKNetWorking getHeaderCompletionHandler:^(JKHeaderModel *model, NSError *error) {
            if (error) {
                NSLog(@"%@", error);
            }else{
                _datalist = model.data;
                
            }
        }];
        [self view];
        [self.heardView registerClass:[JKHeaderCollectionViewCell class] forCellWithReuseIdentifier:@"Cell"];
    }
    return self;
}
- (void)getDataListWith:(NSArray<Labellist *> *)labeList CompletionHandler:(void (^)())completionhandler{
    _labelList = labeList;
    !completionhandler ?: completionhandler();
}
//滚动视图
- (iCarousel *)ic{
    _ic = [[iCarousel alloc]initWithFrame:CGRectMake(0, 0, kScreenW, kScreenW*385/640)];
    _ic.delegate = self;
    _ic.dataSource = self;
    [self addSubview:_ic];
    _pc = [UIPageControl new];
    _pc.numberOfPages = self.datalist.count;
    [_ic addSubview:_pc];
    [_pc mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(4);
        make.centerX.equalTo(0);
    }];
    [_timer invalidate];
    _timer = nil;
    
    _timer = [NSTimer bk_scheduledTimerWithTimeInterval:2 block:^(NSTimer *timer) {
        [_ic scrollToItemAtIndex:_ic.currentItemIndex + 1 animated:YES];
    } repeats:YES];
    _ic.scrollSpeed = .1;
    return _ic;
}
- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view{
    if (!view) {
        view = [[UIView alloc] initWithFrame:carousel.bounds];
        UIImageView *iv = [UIImageView new];
        iv.tag = 100;
        [view addSubview:iv];
        [iv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(0);
        }];
        iv.contentMode = UIViewContentModeScaleAspectFill;
        iv.clipsToBounds = YES;
    }
    UIImageView *iv = (UIImageView *)[view viewWithTag:100];
    [iv sd_setImageWithURL:self.datalist[index].topicPic.yx_URL];
    return view;
}
- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel{
    return self.datalist.count;
}
- (CGFloat)carousel:(iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value{
    if (option == iCarouselOptionWrap) {
        value = YES;
    }
    return value;
}
- (void)carouselCurrentItemIndexDidChange:(iCarousel *)carousel{
    _pc.currentPage = carousel.currentItemIndex;
}
- (void)carousel:(iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index{
    JKICWebView *webview = [[JKICWebView alloc]initWithURL:self.datalist[index].marketingDesc.yx_URL];
    webview.hidesBottomBarWhenPushed = YES;
    [self.viewController.navigationController pushViewController:webview animated:YES];
}
- (UIView *)view{
    if (!_view) {
        _view = [UIView new];
        [self addSubview:_view];
        [_view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.left.right.equalTo(0);
            make.height.equalTo(kScreenW*122/640);
        }];
        UIImageView *imageVW = [UIImageView new];
        [_view addSubview:imageVW];
        [imageVW mas_makeConstraints:^(MASConstraintMaker *make) {
         make.center.equalTo(0);
         make.width.equalTo(150);
         make.height.equalTo(31.5);
        }];
         imageVW.image = [UIImage imageNamed:@"display-topic@2x.png.base.universal.regular.off.horizontal.normal.active.onepartscale.onepart.2474.000.00."];
    }
    return _view;
}
@end
