//
//  JKICWebView.m
//  TRProject
//
//  Created by Tarena on 16/7/9.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "JKICWebView.h"

@interface JKICWebView ()

@end

@implementation JKICWebView

- (instancetype)initWithURL:(NSURL *)url{
    if (self = [super init]) {
        _url = url;
    }
    return self;
}
- (void)viewWillDisappear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    UIWebView *web = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, kScreenW, kScreenH)];
    [self.view addSubview:web];
    [web loadRequest:[NSURLRequest requestWithURL:self.url]];
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
