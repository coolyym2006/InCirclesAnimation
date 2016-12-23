//
//  ViewController.m
//  InCirclesAnimation
//
//  Created by coolyym on 2016/12/23.
//  Copyright © 2016年 sooyie. All rights reserved.
//

#import "ViewController.h"
#import "YYMView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [YYMView showView];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(10 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [YYMView dismiss];
        
    });

    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
