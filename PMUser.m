//
// Created by pom on 13/05/25.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "PMUser.h"
#import "NSDictionary+Util.h"
#import "PMStatus.h"
@implementation PMUser {

}

- (id)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    if (self) {
        _createdAt = nil;

        _favouritesCount = [[dict nonNullObjectForKey:@"favourites_count"] integerValue];

        _followersCount = [[dict nonNullObjectForKey:@"followers_count"] integerValue];

        _friendsCount = [[dict nonNullObjectForKey:@"friends_count"] integerValue];

        _isContributorsEnabled = [[dict nonNullObjectForKey:@"contributors_enabled"] boolValue];

        _isFollowRequestSent = [[dict nonNullObjectForKey:@"follow_request_sent"] boolValue];

        _isDefaultProfile = [[dict nonNullObjectForKey:@"default_profile"] boolValue];

        _isDefaultProfileImage = [[dict nonNullObjectForKey:@"default_profile_image"] boolValue];

        _isGeoEnabled = [[dict nonNullObjectForKey:@"geo_enabled"] boolValue];

        _isProfileBackgroundTiled = [[dict nonNullObjectForKey:@"profile_background_tile"] boolValue];

        _isProfileUseBackgroundImage = [[dict nonNullObjectForKey:@"profile_user_background_image"] boolValue];

        _isProtected = [[dict nonNullObjectForKey:@"protected"] boolValue];

        _isShowAllInlineMedia = [[dict nonNullObjectForKey:@"show_all_inline_mode"] boolValue];

        _isTranslator = [[dict nonNullObjectForKey:@"is_translator"] boolValue];

        _isVerified = [[dict nonNullObjectForKey:@"verified"] boolValue];

        _lang = [[dict nonNullObjectForKey:@"lang"] copy];

        _listedCount = [[dict nonNullObjectForKey:@"listed_count"] integerValue];

        _location = [[dict nonNullObjectForKey:@"location"] copy];

        _name = [[dict nonNullObjectForKey:@"name"] copy];

        _profileBackgroundColor = [[dict nonNullObjectForKey:@"profile_background_color"] copy];

        _profileBackgroundImageURL = [[dict nonNullObjectForKey:@"profile_background_image_url"] copy];

        _profileBackgroundImageURLHttps = [[dict nonNullObjectForKey:@"profile_background_image_url_https"] copy];

        _profileBannerURL = [[dict nonNullObjectForKey:@"profile_banner_url"] copy];

        _profileImageURL = [[dict nonNullObjectForKey:@"profile_image_url"] copy];

        _profileImageURLHttps = [[dict nonNullObjectForKey:@"profile_image_url_https"] copy];

        _profileLinkColor = [[dict nonNullObjectForKey:@"profile_link_color"] copy];

        _profileSidebarBorderColor = [[dict nonNullObjectForKey:@"profile_sidebar_border_color"] copy];

        _profileSidebarFillColor = [[dict nonNullObjectForKey:@"profile_sidebar_fill_color"] copy];

        _profileTextColor = [[dict nonNullObjectForKey:@"profile_text_color"] copy];

        _screenName = [[dict nonNullObjectForKey:@"screen_name"] copy];

        NSDictionary *statusDict = [dict nonNullObjectForKey:@"status"];
        if (statusDict) {
            _status = [[PMStatus alloc] initWithDictionary:statusDict];
        }

        _statusesCount = [[dict nonNullObjectForKey:@"statuses_count"] integerValue];

        _userId = [[dict nonNullObjectForKey:@"id"] longLongValue];

        _timeZone = [[dict nonNullObjectForKey:@"time_zone"] copy];

        _userDescription = [[dict nonNullObjectForKey:@"description"] copy];

        _url = [[dict nonNullObjectForKey:@"url"] copy];

        _utcOffset = [[dict nonNullObjectForKey:@"utf_offset"] integerValue];
    }
    return self;
}
@end