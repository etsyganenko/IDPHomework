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

- (void)didMoveToParentViewController:(UIViewController *)parent {
    [parent.navigationController setNavigationBarHidden:YES];
}

#pragma mark -
#pragma mark Interface Handling

- (IBAction)onButtonNext:(id)sender {
    [self.mainView moveToNextPosition];
    self.navigationController.navigationBarHidden = YES;
}

- (IBAction)onButtonRandom:(id)sender {
    [self.mainView moveToRandomPosition];
}

- (IBAction)onButtonStart:(id)sender {
    [self.mainView startMoving];
}

- (IBAction)onButtonStop:(id)sender {
    [self.mainView stopMoving];
}

@end
