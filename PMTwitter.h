//
//  PMTwitter.h
//  PMTwitter
//
//  Created by pom on 13/05/22.
//  Copyright (c) 2013年 com.gmail.pompopo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Social/Social.h>
#import <Accounts/Accounts.h>
#import "PMStatus.h"
#import "PMUser.h"

typedef void (^PMStatusBlock)(PMStatus *status);
typedef void (^PMUserBlock)(PMUser *user);
typedef void (^PMFailBlock)(NSError *error);

@interface PMTwitter : NSObject

- (id)initWithAccount:(ACAccount *)account;
- (id)initWithToken:(NSString *)token secret:(NSString *)secret;
- (void)showUser:(NSString *)screenName
         succeed:(PMUserBlock)succeed
            fail:(PMFailBlock)fail;
@end
