//
//  TSYUser.m
//  TSYHomeworkUI
//
//  Created by Admin on 17.06.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "TSYUser.h"

#import "NSString+TSYRandomName.h"

static NSString * const kImageName      = @"image.jpg";
static NSString * const kNameKey        = @"nameKey";
static NSString * const kSurnameKey     = @"surnameKey";
static NSString * const kImageKey       = @"imageKey";

@implementation TSYUser

@dynamic fullName;

#pragma mark -
#pragma mark Class Methods

+ (instancetype)user {
    return [TSYUser new];
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)init {
    self = [super init];
    if (self) {
        self.name = [NSString randomName];
        self.surname = [NSString randomName];
        self.image = [UIImage imageNamed:kImageName];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (NSString *)fullName {
    return [NSString stringWithFormat:@"%@ %@", self.name, self.surname];
}

#pragma mark -
#pragma mark NSCoding

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        NSString *imagePath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                                    NSUserDomainMask,
                                                                    NO)
                                firstObject] stringByAppendingPathComponent:kImageName];
        
        self.image = [UIImage imageWithContentsOfFile:imagePath];
        
        self.name = [aDecoder decodeObjectForKey:kNameKey];
        self.surname = [aDecoder decodeObjectForKey:kSurnameKey];
    }
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    NSString *imagePath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                               NSUserDomainMask,
                                                                NO)
                           firstObject] stringByAppendingPathComponent:kImageName];
    
    [aCoder encodeObject:imagePath forKey:kImageKey];
    
    [aCoder encodeObject:self.name forKey:kNameKey];
    [aCoder encodeObject:self.surname forKey:kSurnameKey];
}

@end
