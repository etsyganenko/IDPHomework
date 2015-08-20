//
//  DBUser.m
//  TSYHomeworkUI
//
//  Created by Yevgen on 8/19/15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "TSYFBUser.h"

#import "ActiveRecordKit.h"
#import "TSYFBPhotoAlbum.h"
#import "TSYFBUser.h"
#import "TSYFacebookConstants.h"

@interface TSYFBUser ()
@property (nonatomic, strong)   NSString                *imageURLString;
@property (nonatomic, strong)   NSMutableOrderedSet     *mutableFriends;

- (void)fillWithDictionary:(NSDictionary *)friendDictionary;
- (void)addNewFriendsUpdateExistingFriendsWithArray:(NSArray *)newFriends;
- (void)removeMissingFriendsWithArray:(NSArray *)newFriends;

@end

@interface TSYFBUser (CoreDataGeneratedAccessors)

- (void)addPhotoAlbumsObject:(TSYFBPhotoAlbum *)value;
- (void)removePhotoAlbumsObject:(TSYFBPhotoAlbum *)value;

- (void)addPhotoAlbums:(NSSet *)values;
- (void)removePhotoAlbums:(NSSet *)values;

- (void)addFriendsObject:(TSYFBUser *)value;
- (void)removeFriendsObject:(TSYFBUser *)value;

- (void)addFriends:(NSSet *)values;
- (void)removeFriends:(NSSet *)values;

@end

@implementation TSYFBUser

@dynamic firstName;
@dynamic lastName;
@dynamic fullName;
@dynamic photoAlbums;
@dynamic friends;
@dynamic mutableFriends;
@dynamic imageURLString;

#pragma mark -
#pragma mark Accessors

- (NSString *)fullName {
    return [NSString stringWithFormat:@"%@ %@", self.firstName, self.lastName];
}

- (NSURL *)imageUrl {
    return [NSURL URLWithString:self.imageURLString];
}

- (void)setImageUrl:(NSURL *)imageUrl {
    self.imageURLString = [imageUrl absoluteString];
}

- (NSOrderedSet *)friends {
//    return [self.mutableFriends copy];
    return [NSOrderedSet orderedSetWithOrderedSet:self.mutableFriends];
}

#pragma mark -
#pragma mark Public Methods

- (void)addPhotoAlbum:(TSYFBPhotoAlbum *)photoAlbum {
    [self addPhotoAlbumsObject:photoAlbum];
}

- (void)removePhotoAlbum:(TSYFBPhotoAlbum *)photoAlbum {
    [self removePhotoAlbumsObject:photoAlbum];
}

- (void)addFriend:(TSYFBUser *)friend {
    [self addFriendsObject:friend];
}

- (void)removeFriend:(TSYFBUser *)friend {
    [self removeFriendsObject:friend];
}

- (void)updateFriendsWithArray:(NSArray *)newFriends {    
    [self addNewFriendsUpdateExistingFriendsWithArray:newFriends];
    
    [self removeMissingFriendsWithArray:newFriends];
    
    [self saveManagedObject];
}

#pragma mark -
#pragma mark Private Methods

- (void)fillWithDictionary:(NSDictionary *)friendDictionary {
    self.ID = friendDictionary[kIDKey];
    self.firstName = friendDictionary[kFirstNameKey];
    self.lastName = friendDictionary[kLastNameKey];
    self.imageUrl = [NSURL URLWithString:friendDictionary[kPictureKey][kDataKey][kURLKey]];
}

- (void)addNewFriendsUpdateExistingFriendsWithArray:(NSArray *)newFriends {
    for (NSDictionary *friendDictionary in newFriends) {
        NSString *friendID = friendDictionary[kIDKey];
        
        TSYFBUser *friend = [TSYFBUser objectWithID:friendID];
        if (!friend) {
            friend = [TSYFBUser managedObject];
        }
        
        [friend fillWithDictionary:friendDictionary];
        
        if (![self.friends containsObject:friend]) {
            [self.mutableFriends addObject:friend];
        }
    }
}

- (void)removeMissingFriendsWithArray:(NSArray *)newFriends {
    NSOrderedSet *currentFriends = self.friends;
    NSMutableOrderedSet *mutableCurrentFriends = [NSMutableOrderedSet orderedSetWithOrderedSet:currentFriends];
    
    for (TSYFBUser *friend in currentFriends) {
        NSString *friendID = friend.ID;
        BOOL friendFound = NO;
        
        for (NSDictionary *friendDictionary in newFriends) {
            NSString *userID = friendDictionary[kIDKey];
            if ([friendID isEqualToString:userID]) {
                friendFound = YES;
            }
        }
        
        if (!friendFound) {
            [mutableCurrentFriends removeObject:friend];
        }
    }
    
    self.mutableFriends = [NSMutableOrderedSet orderedSetWithOrderedSet:mutableCurrentFriends];
}

@end
