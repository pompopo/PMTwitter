//
// Created by pom on 13/05/25.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>
@class PMStatus;

@interface PMUser : NSObject
@property (nonatomic, readonly) NSDate *createdAt;

@property (nonatomic, readonly) NSInteger favouritesCount;

@property (nonatomic, readonly) NSInteger followersCount;

@property (nonatomic, readonly) NSInteger friendsCount;

@property (nonatomic, readonly) NSArray *descriptionEntities;

@property (nonatomic, readonly) BOOL isContributorsEnabled;

@property (nonatomic, readonly) BOOL isDefaultProfile;

@property (nonatomic, readonly) BOOL isDefaultProfileImage;

@property (nonatomic, readonly) BOOL isFollowRequestSent;

@property (nonatomic, readonly) BOOL isGeoEnabled;

@property (nonatomic, readonly) BOOL isProfileBackgroundTiled;

@property (nonatomic, readonly) BOOL isProfileUseBackgroundImage;

@property (nonatomic, readonly) BOOL isProtected;

@property (nonatomic, readonly) BOOL isShowAllInlineMedia;

@property (nonatomic, readonly) BOOL isTranslator;

@property (nonatomic, readonly) BOOL isVerified;

@property (nonatomic, readonly) NSString *lang;

@property (nonatomic, readonly) NSInteger listedCount;

@property (nonatomic, readonly) NSString *location;

@property (nonatomic, readonly) NSString *name;

@property (nonatomic, readonly) NSString *profileBackgroundColor;

@property (nonatomic, readonly) NSString *profileBackgroundImageURL;

@property (nonatomic, readonly) NSString *profileBackgroundImageURLHttps;

@property (nonatomic, readonly) NSString *profileBannerURL;

@property (nonatomic, readonly) NSString *profileImageURL;

@property (nonatomic, readonly) NSString *profileImageURLHttps;

@property (nonatomic, readonly) NSString *profileLinkColor;

@property (nonatomic, readonly) NSString *profileSidebarBorderColor;

@property (nonatomic, readonly) NSString *profileSidebarFillColor;

@property (nonatomic, readonly) NSString *profileTextColor;

@property (nonatomic, readonly) NSString *screenName;

@property (nonatomic, readonly) PMStatus *status;

@property (nonatomic, readonly) NSInteger statusesCount;

@property (nonatomic, readonly) NSString *timeZone;

@property (nonatomic, readonly) NSString *url;

//@property (nonatomic, readonly) PMURLEntity *urlEntity;

@property (nonatomic, readonly) NSString *userDescription;

@property (nonatomic, readonly) long long userId;

@property (nonatomic, readonly) NSInteger utcOffset;

- (id)initWithDictionary:(NSDictionary *)dict;
@end
