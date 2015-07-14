//
//  TSYSquareViewController.m
//  TSYHomeworkUI
//
//  Created by Admin on 11.06.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "TSYSquareViewController.h"

#import "TSYSquareView.h"

#import "TSYMacros.h"

TSYViewControllerBaseViewProperty(TSYSquareViewController, TSYSquareView, mainView)

@implementation TSYSquareViewController

#pragma mark -
#pragma mark View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewDidAppear:(BOOL)animated {
    self.navigationController.navigationBarHidden = YES;
    self.navigationController.hidesBarsOnTap = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark -
#pragma mark Interface Handling

- (IBAction)onButtonNext:(id)sender {
    [self.mainView moveToNextPosition];
    
    self.navigationController.navigationBarHidden = YES;
}

- (IBAction)onButtonRandom:(id)sender {
    [self.mainView moveToRandomPosition];
    
    self.navigationController.navigationBarHidden = YES;
}

- (IBAction)onButtonStart:(id)sender {
    [self.mainView startMoving];
    
    self.navigationController.navigationBarHidden = YES;
}

- (IBAction)onButtonStop:(id)sender {
    [self.mainView stopMoving];
    
    self.navigationController.navigationBarHidden = YES;
}

@end
