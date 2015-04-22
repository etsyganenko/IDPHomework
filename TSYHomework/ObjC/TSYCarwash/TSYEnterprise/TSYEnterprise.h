//
//  TSYEnterprise.h
//  TSYHomework
//
//  Created by Admin on 18.04.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "TSYDirector.h"
#import "TSYAccountant.h"
#import "TSYWasher.h"
#import "TSYAdministration.h"
#import "TSYCarwash.h"
#import "TSYCarwashRoom.h"
#import "TSYRoom.h"
#import "TSYCar.h"

#import "NSObject+TSYCategory.h"

@interface TSYEnterprise : NSObject
@property (nonatomic, retain) TSYAdministration *administration;
@property (nonatomic, retain) TSYCarwash        *carwash;

@property (nonatomic, retain) TSYRoom           *administrationRoom;
@property (nonatomic, retain) TSYCarwashRoom    *carwashRoom;

@property (nonatomic, retain) TSYDirector       *director;
@property (nonatomic, retain) TSYAccountant     *accountant;
@property (nonatomic, retain) TSYWasher         *washer;

+ (instancetype)enterprise;

- (void)organizeStaff;
- (void)organizeBuildings;
- (void)runCarwash:(TSYCar *)car;

@end
