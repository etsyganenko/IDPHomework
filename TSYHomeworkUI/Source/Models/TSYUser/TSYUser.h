//
//  TSYUser.h
//  TSYHomeworkUI
//
//  Created by Admin on 17.06.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface TSYUser : NSObject
@property (nonatomic, readonly) NSString    *fullName;
@property (nonatomic, copy)     NSString    *name;
@property (nonatomic, copy)     NSString    *surname;
@property (nonatomic, strong)   UIImage     *image;

// returns user with random name and surname
+ (instancetype)user;

@end
