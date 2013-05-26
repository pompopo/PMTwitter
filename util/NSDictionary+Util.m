//
// Created by pom on 13/05/25.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "NSDictionary+Util.h"


@implementation NSDictionary (Util)

- (id)nonNullObjectForKey:(NSString *)key {
    id obj = [self objectForKey:key];
    if ([[NSNull null] isEqual:obj]) {
        return nil;
    } else {
        return obj;
    }
}
@end