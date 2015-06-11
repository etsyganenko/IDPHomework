//
//  TSYView.m
//  TSYHomeworkUI
//
//  Created by Admin on 11.06.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "TSYView.h"

@implementation TSYView

- (void)nextPosition {
    self.square.backgroundColor = [UIColor yellowColor];
}

- (void)randomPosition {
    self.square.backgroundColor = [UIColor greenColor];
}

@end
