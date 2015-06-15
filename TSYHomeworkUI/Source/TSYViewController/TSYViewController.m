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
    [(TSYView *)self.view nextPosition];
}

- (IBAction)onButtonRandom:(id)sender {
    [(TSYView *)self.view randomPosition];
}

- (IBAction)onButtonStart:(id)sender {
    [(TSYView *)self.view startMoving];
}

- (IBAction)onButtonStop:(id)sender {
    [(TSYView *)self.view stopMoving];
}

@end
