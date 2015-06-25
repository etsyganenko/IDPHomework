//
//  TSYTableCellMovingPath.h
//  TSYHomeworkUI
//
//  Created by Admin on 25.06.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TSYTableCellMovingPath : NSObject
@property (nonatomic, readonly)   NSIndexPath   *sourceIndexPath;
@property (nonatomic, readonly)   NSIndexPath   *destinationIndexPath;

+ (instancetype)tableCellMovingPathWithSourceIndexPath:(NSIndexPath *)sourceIndexPath
                                  destinationIndexPath:(NSIndexPath *)destinationIndexPath;

@end
