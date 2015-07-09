//
//  TSYLoadingViewProtocol.h
//  TSYHomeworkUI
//
//  Created by Admin on 09.07.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol TSYLoadingViewProtocol <NSObject>
@property (nonatomic, assign, getter=isVisible)    BOOL        visible;

@required
- (void)show;
- (void)hide;

@end
