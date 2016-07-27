//
//  JKMyViewController.m
//  TRProject
//
//  Created by Tarena on 16/7/11.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "JKMyViewController.h"
#import "JKHomePageViewController.h"
#import "JKSettingViewController.h"
@interface JKMyViewController ()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *cosbuttom;

@end

@implementation JKMyViewController
- (instancetype)init{
    if (self = [super init]) {
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
        self = [storyboard instantiateViewControllerWithIdentifier:@"JKMyViewController"];

    }
    return self;
}
- (void)keyBoardWillShow:(NSNotification *)noti{
    //    NSLog(@"noti %@", noti.userInfo);
    NSTimeInterval duration = [noti.userInfo[UIKeyboardAnimationDurationUserInfoKey]doubleValue];
    UIViewAnimationOptions option = [noti.userInfo[UIKeyboardAnimationCurveUserInfoKey] intValue];
    
    CGRect endRect = [noti.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    CGFloat height = [UIScreen mainScreen].bounds.size.height - endRect.origin.y;
    [UIView animateWithDuration:duration delay:0 options:option animations:^{
        _cosbuttom.constant = height;
        //如果使用约束动画，下方代码表示让约束立即生效
        [self.view layoutIfNeeded];
    } completion:nil];
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    //当键盘frame发生改变时，触发UIKeyboardWillChangeFrameNotification方法
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyBoardWillShow:) name:UIKeyboardWillChangeFrameNotification object:nil];
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}
- (void)viewDidLoad {
//    [self.navigationController setNavigationBarHidden:YES];
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)popView:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
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
