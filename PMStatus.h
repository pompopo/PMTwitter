//
// Created by pom on 13/05/25.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>

@class PMUser;

@interface PMStatus : NSObject

// @property (nonatomic, readonly) PMCoordinate *coordinate;

@property (nonatomic, readonly) NSDate *createdAt;

@property (nonatomic, readonly) long long currentUserRetweetId;

@property (nonatomic, readonly) NSInteger favoriteCount;

@property (nonatomic, readonly) NSString *filterLevel;

@property (nonatomic, readonly) NSArray *hashtagEntities;

@property (nonatomic, readonly) NSArray *urlEntities;

@property (nonatomic, readonly) NSArray *userMentionEntities;

@property (nonatomic, readonly) BOOL isFavorited;

@property (nonatomic, readonly) BOOL isPossiblySensitive;

@property (nonatomic, readonly) BOOL isRetweet;

@property (nonatomic, readonly) BOOL isRetweetedByMe;

@property (nonatomic, readonly) BOOL isTruncated;

@property (nonatomic, readonly) long long inReplyToStatusId;

@property (nonatomic, readonly) NSString *inReplyToScreenName;

@property (nonatomic, readonly) long long inReplyToUserId;

@property (nonatomic, readonly) NSString *lang;

//@property (nonatomic, readonly) PMPlace *place;

@property (nonatomic, readonly) NSInteger retweetCount;

@property (nonatomic, readonly) PMStatus *retweetedStatus;

@property (nonatomic, readonly) NSString *source;

@property (nonatomic, readonly) long long statusId;

@property (nonatomic, readonly) NSString *text;

@property (nonatomic, readonly) PMUser *user;

- (id)initWithDictionary:(NSDictionary *)dict;

@end