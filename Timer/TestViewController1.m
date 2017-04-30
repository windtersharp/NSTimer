//
//  TestViewController1.m
//  Timer
//
//  Created by tian on 16/7/10.
//  Copyright © 2016年 windtersharp. All rights reserved.
//

#import "TestViewController1.h"
#import "TestViewController2.h"
#import "NSTimer+WTUtils.h"

@interface TestViewController1 ()

@property (nonatomic,strong) NSTimer *timer;

@end

@implementation TestViewController1

- (void)dealloc{
    
    NSLog(@"TestViewController1销毁");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"有导航的第一页";
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(0, 100, 40, 40)];
    button.backgroundColor = [UIColor orangeColor];
    [button setTitle:@"返回" forState:UIControlStateNormal];
    [self.view addSubview:button];
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchDown];
    

    UIButton *button2 = [[UIButton alloc]initWithFrame:CGRectMake(200, 200, 40, 40)];
    button2.backgroundColor = [UIColor orangeColor];
    [button2 setTitle:@"下页" forState:UIControlStateNormal];
    [self.view addSubview:button2];
    [button2 addTarget:self action:@selector(buttonClick2:) forControlEvents:UIControlEventTouchDown];
    
    //调用定时器
    NSLog(@"定时器地址%p",self.timer);

}

#pragma mark - Action

- (void)buttonClick:(UIButton *)button{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)buttonClick2:(UIButton *)button{
    TestViewController2 *VC = [[TestViewController2 alloc]init];
    [self.navigationController pushViewController:VC animated:YES];
}

- (void)log{
    NSLog(@"定时器正在运行");
}

#pragma  mark - Getter

- (NSTimer *)timer{
    if (_timer == nil) {
        __weak typeof(self)weakSelf = self;
        void(^action)(NSTimer *timer) = ^(NSTimer *timer){
            __strong typeof(self)strongSelf  = weakSelf;
            [strongSelf log];
        };
//        _timer = [NSTimer wt_scheduledTimerWithTimeInterval:1.0 target:self userInfo:nil repeats:YES block:action];
        _timer = [NSTimer wt_scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(log) userInfo:nil repeats:YES];
        
    }
    return _timer;
}




@end
