//
//  TSYLoginContext.h
//  TSYHomeworkUI
//
//  Created by Admin on 22.07.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "TSYContext.h"

@class TSYFBUserModel;

@interface TSYLoginContext : TSYContext
@property (nonatomic, strong)   TSYFBUserModel    *model;

+ (instancetype)logingContextWithModel:(TSYFBUserModel *)model;

@end
