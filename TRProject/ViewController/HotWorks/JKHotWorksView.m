//
//  JKHotWorksView.m
//  TRProject
//
//  Created by Tarena on 16/7/10.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "JKHotWorksView.h"

@interface JKHotWorksView ()

@end

@implementation JKHotWorksView
- (instancetype)initWithStyle:(UITableViewStyle)style{
    if (self = [super initWithStyle:UITableViewStylePlain]) {
        self.title = @"热门作品";
        self.tabBarItem.image = [UIImage imageNamed:@"tab_discount_off"];
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"tab_discount_off-1"];
    }
    return self;
}
- (JKHotWorksViewModel *)hotworksVM{
    if (!_hotworksVM) {
        _hotworksVM = [JKHotWorksViewModel new];
    }
    return _hotworksVM;
}
- (void)viewDidLoad {
    [super viewDidLoad];

    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
       [self.hotworksVM getDataWithRequestMode:VMRequestModeRefresh completionHandler:^(NSError *error) {
           [self.tableView.mj_header endRefreshing];
           if (error) {
               NSLog(@"%@", error);
           }else{
               [self.tableView reloadData];
           }
       }];
    }];
    [self.tableView.mj_header beginRefreshing];
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
       [self.hotworksVM getDataWithRequestMode:VMRequestModeMore completionHandler:^(NSError *error) {
           if (error) {
               NSLog(@"%@", error);
           }else{
               [self.tableView reloadData];
               [self.tableView.mj_footer endRefreshing];
           }
       }];
    }];
    [self.tableView registerClass:[JKHotWorksCell class] forCellReuseIdentifier:@"Cell"];
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.hotworksVM.rowNumber;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    JKHotWorksCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    cell.author.text = [self.hotworksVM authorForRow:indexPath.row];
    cell.num.text = [self.hotworksVM goodTimesForRow:indexPath.row];
    cell.workName.text = [self.hotworksVM workNameForRow:indexPath.row];
    cell.love.image = [UIImage imageNamed:@"like-num.png.base.universal.regular.off.horizontal.normal.active.onepartscale.onepart.62226.000.00."];
    [cell.iconIV sd_setImageWithURL:[self.hotworksVM iconIVForRow:indexPath.row]];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return kScreenW*self.hotworksVM.dataList[indexPath.row].exhibitWorkVo.worksHeight.integerValue/self.hotworksVM.dataList[indexPath.row].exhibitWorkVo.worksWidth.integerValue;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
@end
