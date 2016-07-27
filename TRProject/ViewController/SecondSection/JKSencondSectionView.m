//
//  JKSencondSectionView.m
//  TRProject
//
//  Created by HJK on 16/7/6.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "JKSencondSectionView.h"

@implementation JKSencondSectionView
- (instancetype)initWithURL:(NSURL *)url
{
    self = [super init];
    if (self) {
        _url = url;
    }
    return self;
}
- (void)viewWillDisappear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}
- (void)clicked:(UIButton *)btn{
    [self.view showWarning:@"举报成功"];
}
- (void)viewDidLoad{
    [super viewDidLoad];
    UIBarButtonItem *btn = [[UIBarButtonItem alloc]initWithTitle:@"举报" style:UIBarButtonItemStyleDone target:self action:@selector(clicked:)];
    [btn setTintColor:[UIColor yellowColor]];
    self.navigationItem.rightBarButtonItem = btn;
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    UIWebView *webview = [UIWebView new];
    [self.view addSubview:webview];
    [webview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(0);
    }];
    [webview loadRequest:[NSURLRequest requestWithURL:self.url]];
    webview.scrollView.contentInset = UIEdgeInsetsMake(100, 0, 0, 0);
    UIView *vw = [[UIView alloc]initWithFrame:CGRectMake(0, -100, kScreenW, 100)];
    [webview.scrollView addSubview:vw];
    UILabel *title = [UILabel new];
    [vw addSubview:title];
    vw.backgroundColor = [UIColor whiteColor];
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(0);
        make.left.right.equalTo(0);
    }];
    title.font = [UIFont systemFontOfSize:18];
    title.numberOfLines = 0;
    title.textAlignment = NSTextAlignmentCenter;
    title.text = self.titlE;

}

@end
