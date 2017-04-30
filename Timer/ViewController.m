//
//  ViewController.m
//  Timer
//
//  Created by tian on 16/7/10.
//  Copyright © 2016年 windtersharp. All rights reserved.
//

#import "ViewController.h"
#import "TestViewController1.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(10, 10, 40, 40)];
    [button setTitle:@"点击" forState:UIControlStateNormal];
    button.backgroundColor = [UIColor purpleColor];
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:button];
}


- (void)buttonClick:(UIButton *)button{
    
    TestViewController1 *VC = [[TestViewController1 alloc]init];
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:VC];
    
    [self presentViewController:nav animated:YES completion:nil];
    
    
}

//- (BOOL)shouldAutorotate{
//    NSLog(@"支持旋转");
//    return YES;
//}
//
//- (UIInterfaceOrientationMask)supportedInterfaceOrientations{
//    
//    NSLog(@"方向");
//    return UIInterfaceOrientationMaskPortrait|UIInterfaceOrientationMaskLandscapeRight;
//}
//
//- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation{
//    NSLog(@"present 时选择的方向");
//    return UIInterfaceOrientationPortrait;
//    
//}
//
//
////设置样式
//- (UIStatusBarStyle)preferredStatusBarStyle {
//    return UIStatusBarStyleDefault;
//}
//
////设置是否隐藏
//- (BOOL)prefersStatusBarHidden {
//    return NO;
//}
//
////设置隐藏动画
//- (UIStatusBarAnimation)preferredStatusBarUpdateAnimation {
//    return UIStatusBarAnimationNone;
//}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
