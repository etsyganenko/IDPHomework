//
//  TSYTableCellMovingPath.h
//  TSYHomeworkUI
//
//  Created by Admin on 25.06.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TSYTableCellMovingPath : NSObject
@property (nonatomic, readonly)   NSInteger    sourceIndex;
@property (nonatomic, readonly)   NSInteger    destinationIndex;

+ (instancetype)movingPathWithSourceIndex:(NSInteger)sourceIndex
                         destinationIndex:(NSInteger)destinationIndex;

@end
