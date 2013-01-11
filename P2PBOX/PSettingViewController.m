//
//  PSettingViewController.m
//  P2PBOX
//
//  Created by p2pmsg on 12-12-25.
//  Copyright (c) 2012年 p2pmsg. All rights reserved.
//

#import "PSettingViewController.h"
#import "PCodeViewController.h"

@interface PSettingViewController ()

@end

@implementation PSettingViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"seting";
    UIBarButtonItem *loginBut =[[UIBarButtonItem alloc] initWithTitle:@"生成二维码" style:UIBarButtonItemStylePlain target:self action:@selector(tocode)];
    self.navigationItem.rightBarButtonItem = loginBut;
    [loginBut release];
}

- (void)tocode{
    PCodeViewController *pcode = [[PCodeViewController alloc] init];
    [self.navigationController pushViewController:pcode animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
