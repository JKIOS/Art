//
//  JKFirstSectionWebView.m
//  TRProject
//
//  Created by Tarena on 16/7/8.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "JKFirstSectionWebView.h"

@interface JKFirstSectionWebView ()
@property (nonatomic) UIWebView *web;
@end

@implementation JKFirstSectionWebView
- (instancetype)initWithURL:(NSURL *)url{
    if (self = [super init]) {
        _url = url;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    UIBarButtonItem *btn = [[UIBarButtonItem alloc]initWithTitle:@"举报" style:UIBarButtonItemStyleDone target:self action:@selector(clicked:)];
    [btn setTintColor:[UIColor yellowColor]];
    self.navigationItem.rightBarButtonItem = btn;
    [self web];
}
- (void)clicked:(UIButton *)btn{
    [self.view showWarning:@"举报成功"];
}
- (UIWebView *)web{
    if (!_web) {
        _web = [UIWebView new];
        [self.view addSubview:_web];
        [_web mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(0);
        }];
        [_web loadRequest:[NSURLRequest requestWithURL:self.url]];
    }
    return _web;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
