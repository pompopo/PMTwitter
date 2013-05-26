//
//  PMTwitter.m
//  PMTwitter
//
//  Created by pom on 13/05/22.
//  Copyright (c) 2013年 com.gmail.pompopo. All rights reserved.
//

#import "PMTwitter.h"

@interface PMTwitter ()
@property (nonatomic) ACAccount *account;
@end

@implementation PMTwitter
- (id)initWithAccount:(ACAccount *)account {
    self = [super init];
    if (self) {
        self.account = account;
    }
    return self;
}
- (id)initWithToken:(NSString *)token secret:(NSString *)secret {
    ACAccountStore *store = [[ACAccountStore alloc] init];
    ACAccountType *type = [store accountTypeWithAccountTypeIdentifier:ACAccountTypeIdentifierTwitter];
    ACAccount *account = [[ACAccount alloc] initWithAccountType:type];
    ACAccountCredential *credential = [[ACAccountCredential alloc] initWithOAuthToken:token
                                                                          tokenSecret:secret];
    account.credential = credential;


    return [self initWithAccount:account];
}

- (void)showUser:(NSString *)screenName
         succeed:(PMUserBlock)succeed
            fail:(PMFailBlock)fail {
    NSURL *url = [NSURL URLWithString:@"https://api.twitter.com/1.1/users/show.json"];
    NSDictionary *parameters = @{
            @"screen_name" : screenName
    };

    [self _requestWithURL:url
            requestMethod:SLRequestMethodGET
               parameters:parameters
                userBlock:succeed
                failBlock:fail];
}

- (void)_requestWithURL:(NSURL *)url
          requestMethod:(SLRequestMethod)method
             parameters:(NSDictionary *)parameters
                handler:(SLRequestHandler)handler {
    SLRequest *request = [SLRequest requestForServiceType:SLServiceTypeTwitter
                                            requestMethod:method
                                                      URL:url
                                               parameters:parameters];
    request.account = self.account;
    [request performRequestWithHandler:handler];
}

#pragma mark - private methods
// for APIs return only User
- (void)_requestWithURL:(NSURL *)url
          requestMethod:(SLRequestMethod)method
             parameters:(NSDictionary *)parameters
              userBlock:(PMUserBlock)succeed
              failBlock:(PMFailBlock)fail {
    [self _requestWithURL:url
            requestMethod:method
               parameters:parameters
                  handler:^(NSData *responseData, NSHTTPURLResponse *urlResponse, NSError *error) {
                      NSLog(@"statusCode = %d", urlResponse.statusCode);
                      NSLog(@"error = %@", error);
                      if (error) {
                          fail(error);
                          return;
                      }
                      NSString *dataStr = [[NSString alloc] initWithData:responseData
                                                                encoding:NSUTF8StringEncoding];
                      NSLog(@"res = %@", dataStr);
                      NSError *jsonError;
                      NSDictionary *json = [self parseJSONWithData:responseData
                                                             error:&jsonError];


                      if (jsonError) {
                          fail(jsonError);
                          return;
                      }
                      PMUser *user = [[PMUser alloc] initWithDictionary:json];
                      succeed(user);
                  }];

}
- (id)parseJSONWithData:(NSData *)data error:(NSError **)error{
    id json = [NSJSONSerialization JSONObjectWithData:data
                                              options:0
                                                error:error];
    if (*error) {
        return nil;
    }
    if ([json isKindOfClass:[NSDictionary class]]) {
        NSDictionary *dict = (NSDictionary *)json;
        if ([dict objectForKey:@"errors"]) {
               *error = [NSError errorWithDomain:@"TwitterError"
                                            code:-1
                                        userInfo:nil];
        }
    }
    return json;
}
@end
