//
//  HPViewController.m
//  HPAOPSignal
//
//  Created by surnamex@163.com on 04/25/2020.
//  Copyright (c) 2020 surnamex@163.com. All rights reserved.
//

#import "HPViewController.h"
#import "HPTestView.h"

@interface HPViewController ()

@end

@implementation HPViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(100, 100, 100, 100);
    btn.backgroundColor = [UIColor redColor];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    HPTestView *testView = [[HPTestView alloc] initWithFrame:CGRectMake(100, 300, 100, 100)];
    [self.view addSubview:testView];
}

- (void)btnClick:(id)sender {
    NSLog(@"%@", sender);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
