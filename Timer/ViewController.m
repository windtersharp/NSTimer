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
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(180, 180, 40, 40)];
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
