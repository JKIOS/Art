//
//  JKFristSectionView.m
//  TRProject
//
//  Created by Tarena on 16/7/7.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "JKFristSectionView.h"
#import "JKHomePageViewCell.h"
#import "JKFirstSectionViewModel.h"
#import "JKFirstNextReusableView.h"
#import "JKFirstSectionWebView.h"
@interface JKFristSectionView ()<UICollectionViewDelegateFlowLayout>
@property (nonatomic) JKFirstSectionViewModel *firstVM;
@end

@implementation JKFristSectionView
BOOL selected;
static NSString * const reuseIdentifier = @"Cell";
- (instancetype)init{
    UICollectionViewFlowLayout *flowlayout = [UICollectionViewFlowLayout new];
    flowlayout.minimumLineSpacing = 0;
    flowlayout.minimumInteritemSpacing = 0;
    flowlayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
    if (self = [super initWithCollectionViewLayout:flowlayout]) {
        
    }
    return self;
}
- (JKFirstSectionViewModel *)firstVM{
    if (!_firstVM) {
        _firstVM = [[JKFirstSectionViewModel alloc]initWithColumnId:self.columnId];
    }
    return _firstVM;
}
- (void)viewWillDisappear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    if (kind == UICollectionElementKindSectionHeader) {
        JKFirstNextReusableView *firstView=[collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"FirstHeader" forIndexPath:indexPath];
        [firstView.heardview sd_setImageWithURL:self.firstVM.firstModel.data.galleryPic.yx_URL];
        firstView.title.text = [@(self.firstVM.firstModel.data.collectionNum).stringValue stringByAppendingString:@"人收藏"];
        return firstView;
    }
    return nil;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(kScreenW, kScreenW*450/750);
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self.collectionView registerClass:[JKHomePageViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    [self.collectionView registerClass:[JKFirstNextReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"FirstHeader"];
    self.collectionView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
       [self.firstVM getDataWithRequestMode:VMRequestModeRefresh completionHandler:^(NSError *error) {
           [self.collectionView.mj_header endRefreshing];
           if (error) {
               NSLog(@"%@",error);
           }else{
               [self.collectionView reloadData];
               if (self.firstVM.isHasMore) {
                   [self.collectionView.mj_footer resetNoMoreData];
               }else{
                   [self.collectionView.mj_footer endRefreshingWithNoMoreData];
               }
           }
       }];
    }];
    [self.collectionView.mj_header beginRefreshing];
    self.collectionView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
       [self.firstVM getDataWithRequestMode:VMRequestModeMore completionHandler:^(NSError *error) {
           if (error) {
               NSLog(@"%@", error);
           }else{
               [self.collectionView reloadData];
               if (self.firstVM.isHasMore) {
                   [self.collectionView.mj_footer endRefreshing];
               }else{
                   [self.collectionView.mj_footer endRefreshingWithNoMoreData];
               }
               
           }
       }];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.firstVM.rowNumber;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    JKHomePageViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    [cell.imageVW sd_setImageWithURL:[self.firstVM imageVM:indexPath.row]];
    cell.name.text = [self.firstVM name:indexPath.row];
    cell.numlabel.text = [self.firstVM numlable:indexPath.row];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    return CGSizeMake(kScreenW, kScreenW*360/640);
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    JKFirstSectionWebView *webView = [[JKFirstSectionWebView alloc]initWithURL:self.firstVM.topics[indexPath.row].marketingDesc.yx_URL];
    webView.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:webView animated:YES];
}

@end
