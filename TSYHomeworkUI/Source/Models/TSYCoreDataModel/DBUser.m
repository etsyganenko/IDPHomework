//
//  DBUser.m
//  TSYHomeworkUI
//
//  Created by Yevgen on 8/19/15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "DBUser.h"

#import "DBFBPhotoAlbum.h"
#import "DBUser.h"

@implementation DBUser

@dynamic userID;
@dynamic firstName;
@dynamic lastName;
@dynamic fullName;
@dynamic photoAlbums;
@dynamic friends;

- (NSString *)fullName {
    return [NSString stringWithFormat:@"%@ %@", self.firstName, self.lastName];
}

@end
