//
//  EnumObject.m
//  autoKeyedPersistentSingletonDemo
//
//  Created by Christopher Brandow on 10/15/14.
//  Copyright (c) 2014 Flouu. All rights reserved.
//

#import "EnumObject.h"
#import <objc/objc-runtime.h>

@implementation EnumObject

+ (instancetype)sharedInstance {
    static dispatch_once_t  onceToken;
    static EnumObject *sSharedInstance;
    
    dispatch_once(&onceToken, ^{
        sSharedInstance = [[EnumObject alloc] init];
    });
    return sSharedInstance;
}

- (id)init {
    
    if (self = [super init]) {
    
        [[[self class] keysFromProperties] enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            NSLog(@"key: %@ index %zd", obj, idx);
                [self setValue:@(1<<idx) forKey:obj];
        }];
    }
    return self;
    
}

+ (NSArray *)enumKeys {
    return [[self class] keysFromProperties];
}


#pragma mark objc runtime

+ (NSArray *)keysFromProperties {
    
    u_int count;
    
    objc_property_t* properties = class_copyPropertyList([self class], &count);
    NSMutableArray* propertyArray = [NSMutableArray arrayWithCapacity:count];
    
    for (int i = 0; i < count ; i++) {
        [propertyArray addObject:@(property_getName(properties[i]))];
    }
    free(properties);
    
    return [NSArray arrayWithArray:propertyArray];
}

@end
