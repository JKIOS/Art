//
//  JKEnjoyViewController.m
//  TRProject
//
//  Created by HJK on 16/7/10.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "JKEnjoyViewController.h"
#import "JKFirstSectionWebView.h"
@implementation JKEnjoyViewController
- (instancetype)initWithStyle:(UITableViewStyle)style WithType:(EnjoyType)type{
    if (self = [super initWithStyle:UITableViewStylePlain]) {
        _type = type;
    }
    return self;
}
- (JKEnjoyViewModel *)enjoyVM{
    if (!_enjoyVM) {
        _enjoyVM = [[JKEnjoyViewModel alloc]initWithType:self.type];
    }
    return _enjoyVM;
}
- (void)viewDidLoad{
    [super viewDidLoad];
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
       [self.enjoyVM getDataWithRequestMode:VMRequestModeRefresh completionHandler:^(NSError *error) {
           [self.tableView.mj_header endRefreshing];
           if (error) {
               NSLog(@"%@", error);
           }else{
               [self.tableView reloadData];
               if (self.enjoyVM.isHasMore) {
                   [self.tableView.mj_footer resetNoMoreData];
               }else{
                   [self.tableView.mj_footer endRefreshingWithNoMoreData];
               }
           }
       }];
    }];
    [self.tableView.mj_header beginRefreshing];
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [self.enjoyVM getDataWithRequestMode:VMRequestModeMore completionHandler:^(NSError *error) {
            if (error) {
                NSLog(@"%@", error);
            }else{
                [self.tableView reloadData];
                if (self.enjoyVM.isHasMore) {
                    [self.tableView.mj_footer endRefreshing];
                }else{
                    [self.tableView.mj_footer endRefreshingWithNoMoreData];
                }
            }
        }];
    }];
    [self.tableView registerClass:[JKEnjoyViewCell class] forCellReuseIdentifier:@"Cell"];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.enjoyVM.rowNumber;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    JKEnjoyViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    [cell.iconIV sd_setImageWithURL:[self.enjoyVM iconIVForRow:indexPath.row]];
    cell.author.text = [self.enjoyVM authorForRow:indexPath.row];
    cell.title.text = [self.enjoyVM titleForRow:indexPath.row];
    cell.viewNum.text = [self.enjoyVM numForRow:indexPath.row];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return kScreenW*218/640;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    JKFirstSectionWebView *webView = [[JKFirstSectionWebView alloc]initWithURL:self.enjoyVM.dataList[indexPath.row].marketingDesc.yx_URL];
    webView.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:webView animated:YES];
    webView.hidesBottomBarWhenPushed = NO;
}
@end
