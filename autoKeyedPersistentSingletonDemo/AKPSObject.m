//
//  selfKeyedAndStoredObject.m
//  testTechApplication
//
//  Created by Christopher Brandow on 10/3/14.
//  Copyright (c) 2014 Flouu. All rights reserved.
//

#import "AKPSObject.h"
#import <objc/objc-runtime.h>

@implementation AKPSObject

+ (AKPSObject *)sharedInstance {
    static dispatch_once_t  onceToken;
    static AKPSObject * sSharedInstance;
    
    dispatch_once(&onceToken, ^{
        sSharedInstance = [[AKPSObject alloc] init];
    });
    return sSharedInstance;
}

- (id)init {
    
    if (!(self = [super init])) {
        return self;
    }
    
    NSString *path = [self dataSourceFilePath];
    if ([[NSFileManager defaultManager] fileExistsAtPath:path]) {
        
        self = ([NSKeyedUnarchiver unarchiveObjectWithFile:path]) ?: self;

    }
    
    return self;
    
}

#pragma mark NSCoder

- (id)initWithCoder:(NSCoder *)aDecoder {

    if (!(self = [super init])) {
        return nil;
    }
    
    for (NSString *key in [[self class] keysFromProperties]) {
    
        if ([aDecoder containsValueForKey:key]) {
            [self setValue:[aDecoder decodeObjectForKey:key] forKey:key];
        }
    }
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {

    for (NSString *key in [[self class] keysFromProperties]) {
        
        [aCoder encodeObject:[self valueForKey:key] forKey:key];
        
    }
    
}

+ (NSArray *)propertyKeys {
    return [[self class] keysFromProperties];
}

#pragma mark persistence

- (BOOL)save {
    
    return [NSKeyedArchiver archiveRootObject:self toFile:[self dataSourceFilePath]];
    
}

- (NSURL *)applicationDocumentsDirectory {
    
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

- (NSString *)dataSourceFilePath {
    
    NSString *fileName =  [NSString stringWithFormat:@"%@_file", [self class]];
    
    NSURL *dataFileURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:fileName];

    return [dataFileURL path];
    
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
