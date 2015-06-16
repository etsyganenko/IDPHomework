//
//  TSYViewController.m
//  TSYHomeworkUI
//
//  Created by Admin on 11.06.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "TSYViewController.h"

#import "TSYView.h"

#import "TSYMacros.h"

@implementation TSYViewController

@dynamic mainView;

#pragma mark -
#pragma mark Accessors

TSYBaseViewPropertyGetter(TSYView, mainView)

#pragma mark -
#pragma mark View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark -
#pragma mark Interface Handling

- (IBAction)onButtonNext:(id)sender {
    [self.mainView moveToNextPosition];
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
