//
//  AKPESObject.h
//  autoKeyedPersistentSingletonDemo
//
//  Created by Christopher Brandow on 10/15/14.
//  Copyright (c) 2014 Flouu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EnumObject : NSObject
+ (EnumObject *)sharedInstance;
+ (NSArray *)enumKeys;

@property (nonatomic, readonly) NSInteger firstEnumProperty;
@property (nonatomic, readonly) NSInteger secondEnumProperty;
@property (nonatomic, readonly) NSInteger thirdEnumProperty;

@end
