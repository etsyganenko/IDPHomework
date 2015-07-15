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

static NSString * const kImageName          = @"image";
static NSString * const kImageType          = @"jpg";
static NSString * const kNameKey            = @"nameKey";
static NSString * const kSurnameKey         = @"surnameKey";
static NSString * const kImagePathKey       = @"imagePathKey";
static NSString * const kImageURL           = @"https://d1u1p2xjjiahg3.cloudfront.net/30916648-2ea7-494f-8ceb-5aa2bb1b98b6.jpg";

@interface TSYUser ()
@property (nonatomic, strong)   TSYImageModel   *imageModel;

@property (nonatomic, readonly) NSString        *imageName;
@property (nonatomic, readonly) NSString        *imageSavingPath;
@property (nonatomic, readonly) NSURL           *imageURL;

@end

@implementation TSYUser

@dynamic fullName;
@dynamic imageName;
@dynamic imageSavingPath;
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
        self.imageModel = [TSYImageModel imageModelWithURL:self.imageURL];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (void)setImageModel:(TSYImageModel *)imageModel {
    if (_imageModel != imageModel) {
        [_imageModel removeObserver:self];
        
        _imageModel = imageModel;
        
        [_imageModel addObserver:self];
        
        [_imageModel load];
    }
}

- (NSString *)fullName {
    return [NSString stringWithFormat:@"%@ %@", self.name, self.surname];
}

- (NSString *)imageName {
    return [kImageName stringByAppendingPathExtension:kImageType];
}

- (NSString *)imageSavingPath {
    return [NSBundle pathForResource:kImageName
                              ofType:kImageType
                         inDirectory:[[NSBundle mainBundle] bundlePath]];
}

- (NSURL *)imageURL {
    return [NSURL URLWithString:kImageURL];
}

#pragma mark -
#pragma mark Public Methods

- (void)performLoading {
    [self.imageModel load];
}

#pragma mark -
#pragma mark TSYModelObserver

- (void)modelDidLoad:(TSYImageModel *)imageModel {
    dispatch_async(dispatch_get_main_queue(), ^{
        self.state = TSYModelDidLoad;
    });
}

- (void)modelDidFailLoading:(TSYImageModel *)imageModel {
    [self.imageModel load];
}

#pragma mark -
#pragma mark NSCoding

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {
//        self.image = [UIImage imageWithContentsOfFile:self.imageSavingPath];
//        self.image = [UIImage imageWithContentsOfFile:[aDecoder decodeObjectForKey:kImagePathKey]];
        self.name = [aDecoder decodeObjectForKey:kNameKey];
        self.surname = [aDecoder decodeObjectForKey:kSurnameKey];
    }
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.imageSavingPath forKey:kImagePathKey];
    [aCoder encodeObject:self.name forKey:kNameKey];
    [aCoder encodeObject:self.surname forKey:kSurnameKey];
}

@end
