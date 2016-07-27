//
//  JKHomePageViewController.m
//  TRProject
//
//  Created by Tarena on 16/7/5.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "JKHomePageViewController.h"
#import "JKHomePageViewModel.h"
#import "JKHomePageViewCell.h"
#import "JKSecondReusableView.h"
#import "JKFristReusableView.h"
#import "JKNetWorking.h"
#import "JKSencondSectionView.h"
#import "JKFristSectionView.h"
@interface JKHomePageViewController ()<UICollectionViewDelegateFlowLayout>
@property (nonatomic) JKHomePageViewModel *homepageVM;
@end

@implementation JKHomePageViewController
//section的头部
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    if (kind == UICollectionElementKindSectionHeader) {
        if (indexPath.section == 1) {
            JKSecondReusableView *secondHeader = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"SecondHeader" forIndexPath:indexPath];
            return secondHeader;
        }else{
            JKFristReusableView *fristHeader = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"FristHeader" forIndexPath:indexPath];

            [fristHeader getDataListWith:self.homepageVM.labelList CompletionHandler:^{
                [fristHeader ic];
                [fristHeader.heardView reloadData];
            }];
            return fristHeader;
        }
        
    }
    return nil;
}
- (JKHomePageViewModel *)homepageVM{
    if (!_homepageVM) {
        _homepageVM = [JKHomePageViewModel new];
    }
    return _homepageVM;
}
static NSString * const reuseIdentifier = @"Cell";
- (instancetype)init
{
    UICollectionViewFlowLayout *flowlayout = [UICollectionViewFlowLayout new];
    flowlayout.minimumLineSpacing = 0;
    flowlayout.minimumInteritemSpacing = 0;
    flowlayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
//    flowlayout.itemSize = CGSizeMake(kScreenW, kScreenW*300/750);
    self = [super initWithCollectionViewLayout:flowlayout];
    if (self) {
         self.title = @"精选";

        self.tabBarItem.image = [UIImage imageNamed:@"推荐-默认@2x.png.base.universal.regular.off.horizontal.normal.active.onepartscale.onepart.54283.000.00."];
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"推荐-焦点@2x.png.base.universal.regular.off.horizontal.normal.active.onepartscale.onepart.19656.000.00."];
    }
    return self;
}
//- (BOOL)prefersStatusBarHidden
//{
//    return YES;//隐藏为YES，显示为NO
//}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    self.collectionView.backgroundColor = [UIColor whiteColor];

    [self.collectionView registerClass:[JKSecondReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"SecondHeader"];
    [self.collectionView registerClass:[JKFristReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"FristHeader"];
   
    self.collectionView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.homepageVM getDataWithRequestMode:VMRequestModeRefresh completionHandler:^(NSError *error) {
            [self.collectionView.mj_header endRefreshing];
            if (error) {
                NSLog(@"%@", error);
            }else{
                [self.collectionView reloadData];
                if (self.homepageVM.ishasMore) {
                    [self.collectionView.mj_footer resetNoMoreData];
                }else{
                    [self.collectionView.mj_footer endRefreshingWithNoMoreData];
                }
            }
        }];
    }];
    [self.collectionView.mj_header beginRefreshing];
    self.collectionView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [self.homepageVM getDataWithRequestMode:VMRequestModeMore completionHandler:^(NSError *error) {
            if (error) {
                NSLog(@"%@", error);
            }else{
                [self.collectionView reloadData];
                if (self.homepageVM.ishasMore) {
                    [self.collectionView.mj_footer endRefreshing];
                }else{
                    [self.collectionView.mj_footer endRefreshingWithNoMoreData];
                }
                
            }
        }];
    }];
    [self.collectionView registerClass:[JKHomePageViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    self.collectionView.contentInset = UIEdgeInsetsMake(-20, 0, 0, 0);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 2;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (section == 0) {
        return self.homepageVM.fristRowNum;
    }else{
        return self.homepageVM.rowNum;}
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    JKHomePageViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    if (indexPath.section == 0) {
        [cell.imageVW sd_setImageWithURL:[self.homepageVM galleryimageVM:indexPath.row]];
        cell.name.text = [self.homepageVM galleryname:indexPath.row];
        cell.numlabel.text = [self.homepageVM gallerynumlable:indexPath.row];
    }else{
        [cell.imageVW sd_setImageWithURL:[self.homepageVM imageVM:indexPath.row]];
        cell.name.text = [self.homepageVM name:indexPath.row];
        cell.numlabel.text = [self.homepageVM numlable:indexPath.row];
    }
    return cell;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return CGSizeMake(kScreenW, kScreenW*662/640);
    }else{
        return CGSizeMake(kScreenW, kScreenW*122/640);
    }
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
       return CGSizeMake(kScreenW, kScreenW*300/750);
    }else{
        return CGSizeMake(kScreenW, kScreenW*450/750);
    }
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];

    if (indexPath.section == 1) {
        JKSencondSectionView *sencond = [[JKSencondSectionView alloc]initWithURL:self.homepageVM.imagetextlist[indexPath.row].marketingDesc.yx_URL];
        sencond.titlE = [self.homepageVM name:indexPath.row];
        sencond.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:sencond animated:YES];
        
    }else{
        JKFristSectionView *first = [JKFristSectionView new];
        first.columnId = self.homepageVM.gallery[indexPath.row].ID;
        first.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:first animated:YES];
        first.hidesBottomBarWhenPushed = NO;
    }
}
- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath{
//    NSLog(@"%ld   %ld", indexPath.row, self.homepageVM.unloadCout);
    if (indexPath.row>self.homepageVM.unloadCout-1) {
        cell.layer.transform = CATransform3DMakeScale(0.1, 0.1, 1);
        [UIView animateWithDuration:1 animations:^{
            cell.layer.transform = CATransform3DMakeScale(1, 1, 1);
        }];
    }

}

@end
