//
//  ViewController.m
//  弹窗哈哈哈
//
//  Created by 蔡强 on 2017/4/7.
//  Copyright © 2017年 kuaijiankang. All rights reserved.
//

#import "ViewController.h"
#import "DeclareAbnormalAlertView.h"
#import "CQPointHUD.h"

@interface ViewController ()<DeclareAbnormalAlertViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // 自定义弹窗按钮
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(90, 90, 190, 30)];
    [self.view addSubview:button];
    button.backgroundColor = [UIColor redColor];
    [button setTitle:@"点击弹出弹窗" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(showAlert) forControlEvents:UIControlEventTouchDown];
    
    // 纯文本toast按钮
    UIButton *button2 = [[UIButton alloc]initWithFrame:CGRectMake(90, 150, 190, 30)];
    [self.view addSubview:button2];
    button2.backgroundColor = [UIColor blueColor];
    [button2 setTitle:@"纯文本toast" forState:UIControlStateNormal];
    [button2 addTarget:self action:@selector(showToast) forControlEvents:UIControlEventTouchUpInside];
    
    // 图文toast按钮
    UIButton *button3 = [[UIButton alloc]initWithFrame:CGRectMake(90, 210, 190, 30)];
    [self.view addSubview:button3];
    button3.backgroundColor = [UIColor orangeColor];
    [button3 setTitle:@"图文toast" forState:UIControlStateNormal];
    [button3 addTarget:self action:@selector(showImageToast) forControlEvents:UIControlEventTouchUpInside];
}

// 弹出弹窗
- (void)showAlert{
    DeclareAbnormalAlertView *alertView = [[DeclareAbnormalAlertView alloc]initWithTitle:@"这是一个标题" message:@"长亭外，古道边，一行白鹭上青天" delegate:self leftButtonTitle:@"确定" rightButtonTitle:@"取消"];
    [alertView show];
}

// 纯文本toast
- (void)showToast{
    [CQPointHUD showToastWithMessage:@"您还未达到相应积分\n无法兑换商品"];
}

// 图文toast
- (void)showImageToast{
    [CQPointHUD showToastWithMessage:@"兑换成功" image:@"sign"];
}

// 弹窗的代理方法
- (void)declareAbnormalAlertView:(DeclareAbnormalAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == AlertButtonLeft) {
        NSLog(@"点击了左边的button");
    }else{
        NSLog(@"点击了右边的button");
    }
}

@end
