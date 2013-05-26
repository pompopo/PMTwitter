//
// Created by pom on 13/05/25.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "PMStatus.h"
#import "NSDictionary+Util.h"
#import "PMUser.h"

@implementation PMStatus {

}
- (id)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    if (self) {
        NSString *createdAtStr = [[dict nonNullObjectForKey:@"created_at"] copy];
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateStyle:NSDateFormatterLongStyle];
        [dateFormatter setTimeStyle:NSDateFormatterNoStyle];
        [dateFormatter setDateFormat:@"EEE MMM dd HH:mm:ss Z yyyy"];
        _createdAt = [dateFormatter dateFromString:createdAtStr];

        NSDictionary *currentUserRetweet = [dict nonNullObjectForKey:@"current_user_retweet"];
        _currentUserRetweetId = [[currentUserRetweet nonNullObjectForKey:@"id"] longLongValue];

        _favoriteCount = [[dict nonNullObjectForKey:@"favorite_count"] integerValue];

        _filterLevel = [[dict nonNullObjectForKey:@"filter_level"] copy];

        _isFavorited = [[dict nonNullObjectForKey:@"favorited"] boolValue];

        _isPossiblySensitive = [[dict nonNullObjectForKey:@"possibly_sensitive"] boolValue];

        _isRetweetedByMe = [[dict nonNullObjectForKey:@"retweeted"] boolValue];

        _isTruncated = [[dict nonNullObjectForKey:@"truncated"] boolValue];

        _inReplyToScreenName = [[dict nonNullObjectForKey:@"in_reply_to_screen_name"] copy];

        _inReplyToStatusId = [[dict nonNullObjectForKey:@"in_reply_to_status_id"] longLongValue];

        _inReplyToUserId = [[dict nonNullObjectForKey:@"in_reply_to_user_id"] longLongValue];

        _lang = [[dict nonNullObjectForKey:@"lang"] copy];

        _retweetCount = [[dict nonNullObjectForKey:@"retweet_count"] integerValue];

        NSDictionary *retweetedStatusDict = [dict nonNullObjectForKey:@"retweeted_status"];
        if (retweetedStatusDict) {
            _retweetedStatus = [[PMStatus alloc] initWithDictionary:retweetedStatusDict];
            _isRetweet = YES;
        }

        _source = [[dict nonNullObjectForKey:@"source"] copy];

        _statusId = [[dict nonNullObjectForKey:@"id"] longLongValue];

        _text = [[dict nonNullObjectForKey:@"text"] copy];

        NSDictionary *userDict = [dict nonNullObjectForKey:@"user"];
        if (userDict) {
            _user = [[PMUser alloc] initWithDictionary:userDict];
        }
    }
    return self;
}

@end