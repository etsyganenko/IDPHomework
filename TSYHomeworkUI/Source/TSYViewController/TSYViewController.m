//
//  TSYViewController.m
//  TSYHomeworkUI
//
//  Created by Admin on 11.06.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "TSYViewController.h"

#import "TSYView.h"

@implementation TSYViewController

@dynamic mainView;

#pragma mark -
#pragma mark Accessors

- (TSYView *)mainView {
    if ([self isViewLoaded] && [self.view isKindOfClass:[TSYView class]]) {
        return (TSYView *)self.view;
    }
    
    return nil;
}

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
    [self.mainView nextPosition];
}

- (IBAction)onButtonRandom:(id)sender {
    [self.mainView randomPosition];
}

- (IBAction)onButtonStart:(id)sender {
    [self.mainView startMoving];
}

- (IBAction)onButtonStop:(id)sender {
    [self.mainView stopMoving];
}

@end
