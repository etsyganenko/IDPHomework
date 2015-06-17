//
//  TSYUser.m
//  TSYHomeworkUI
//
//  Created by Admin on 17.06.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "TSYUser.h"

@implementation TSYUser

+ (instancetype)initWithName:(NSString *)name
                     surname:(NSString *)surname
{
    return [[TSYUser alloc] initWithName:name
                                          surname:surname];
}

- (instancetype)initWithName:(NSString *)name
                     surname:(NSString *)surname
{
    self = [super init];
    if (self) {
        self.name = name;
        self.surname = surname;
    }
    
    return self;
}

- (void)dealloc {
    self.name = nil;
    self.surname = nil;
    
    [super dealloc];
}

- (NSString *)fullName {
    return [NSString stringWithFormat:@"%@ %@", self.name, self.surname];
}

@end
