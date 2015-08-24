//
//  TSYViewController.h
//  TSYHomeworkUI
//
//  Created by Admin on 22.07.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "TSYModel.h"

@class TSYContext;
@class TSYView;

@interface TSYViewController : UIViewController <TSYModelObserver>
@property (nonatomic, strong)       TSYContext          *context;
@property (nonatomic, strong)       id                  model;

- (void)logout;

@end
