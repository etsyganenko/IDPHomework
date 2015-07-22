//
//  TSYUser.m
//  TSYHomeworkUI
//
//  Created by Admin on 17.06.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "TSYUser.h"

#import "TSYImageModel.h"
#import "NSString+TSYRandomName.h"
#import "NSFileManager+TSYCategory.h"

static NSString * const kNameKey            = @"nameKey";
static NSString * const kSurnameKey         = @"surnameKey";
static NSString * const kImageURL           = @"https://d1u1p2xjjiahg3.cloudfront.net/30916648-2ea7-494f-8ceb-5aa2bb1b98b6.jpg";

@interface TSYUser ()
@property (nonatomic, readonly) NSURL   *imageURL;

@end

@implementation TSYUser

@dynamic fullName;
@dynamic imageModel;
@dynamic imageURL;

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
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (NSString *)fullName {
    return [NSString stringWithFormat:@"%@ %@", self.name, self.surname];
}

- (NSURL *)imageURL {
    return [NSURL URLWithString:kImageURL];
}

- (TSYImageModel *)imageModel {
    return [TSYImageModel imageModelWithURL:self.imageURL];
}

#pragma mark -
#pragma mark NSCoding

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        self.name = [aDecoder decodeObjectForKey:kNameKey];
        self.surname = [aDecoder decodeObjectForKey:kSurnameKey];
    }
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.name forKey:kNameKey];
    [aCoder encodeObject:self.surname forKey:kSurnameKey];
}

@end
