//
//  TSYViewController.h
//  TSYHomeworkUI
//
//  Created by Admin on 22.07.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TSYContext;
@class TSYModel;

@interface TSYViewController : UIViewController
@property (nonatomic, strong)   TSYContext  *context;
@property (nonatomic, strong)   TSYModel    *model;

@end
