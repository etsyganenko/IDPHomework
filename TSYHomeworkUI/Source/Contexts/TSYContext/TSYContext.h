//
//  TSYContext.h
//  TSYHomeworkUI
//
//  Created by Admin on 22.07.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "TSYObservableObject.h"
#import "TSYModel.h"

@interface TSYContext : TSYObservableObject
@property (nonatomic, strong)   id    model;

+ (instancetype)contextWithModel:(id)model;

- (instancetype)initWithModel:(id)model;

- (void)execute;
- (void)cancel;

- (void)fillModelWithResult:(id)result;

@end
