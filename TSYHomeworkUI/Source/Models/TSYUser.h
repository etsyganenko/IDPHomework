//
//  TSYUser.h
//  TSYHomeworkUI
//
//  Created by Admin on 17.06.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TSYUser : NSObject
@property (nonatomic, readonly) NSString    *fullName;
@property (nonatomic, copy)     NSString    *name;
@property (nonatomic, copy)     NSString    *surname;

@end
