//
//  TSYUser.m
//  TSYHomeworkUI
//
//  Created by Admin on 17.06.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "TSYUser.h"

#import "NSString+TSYRandomName.h"
#import "NSFileManager+TSYCategory.h"

static NSString * const kImageName          = @"image.jpg";
static NSString * const kNameKey            = @"nameKey";
static NSString * const kSurnameKey         = @"surnameKey";
static NSString * const kImagePathKey       = @"imagePathKey";

@interface TSYUser ()
@property (nonatomic, strong)   NSString    *imageName;
@property (nonatomic, strong)   NSString    *savingDirectory;
@property (nonatomic, strong)   NSString    *savingPath;

@end

@implementation TSYUser

@dynamic fullName;
@dynamic imageName;
@dynamic savingDirectory;
@dynamic savingPath;

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

- (NSString *)imageName {
    return kImageName;
}

- (NSString *)savingDirectory {
    return [NSFileManager documentDirectoryPath];
}

- (NSString *)savingPath {
    return [self.savingDirectory stringByAppendingPathComponent:self.imageName];
}

#pragma mark -
#pragma mark NSCoding

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        self.image = [UIImage imageWithContentsOfFile:self.savingPath];
//        self.image = [UIImage imageNamed:kImageName];
        self.name = [aDecoder decodeObjectForKey:kNameKey];
        self.surname = [aDecoder decodeObjectForKey:kSurnameKey];
    }
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.savingPath forKey:kImagePathKey];
    [aCoder encodeObject:self.name forKey:kNameKey];
    [aCoder encodeObject:self.surname forKey:kSurnameKey];
}

@end
