//
//  TSYViewController.m
//  TSYHomeworkUI
//
//  Created by Admin on 11.06.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "TSYViewController.h"

#import "TSYView.h"

@interface TSYViewController ()

@end

@implementation TSYViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)onButtonNext:(id)sender {
    [(TSYView *)self.view nextPosition];
}

- (IBAction)onButtonRandom:(id)sender {
    [(TSYView *)self.view randomPosition];
}

@end
