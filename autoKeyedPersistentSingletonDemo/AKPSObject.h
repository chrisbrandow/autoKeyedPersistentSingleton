//
//  selfKeyedAndStoredObject.h
//  testTechApplication
//
//  Created by Christopher Brandow on 10/3/14.
//  Copyright (c) 2014 Flouu. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit;
/** 
  This is intended to be a simple, lightweight replacement for NSUserDefaults class.
  You can use this class to create a singleton object that has only the properties defined in the .h @interface.
  It will encode and persist any properties added automatically.
  works with objects and primitive data types.
  because these are properties, then it will code-complete.
  Saved properties will be loaded from persistent store.
  Get and Set the properties as you would any NSObject.
  Set the properties to persistent store using "save" method.
  At the moment it is not KVC compliant.
 */
@interface AKPSObject : NSObject

+ (AKPSObject *)sharedInstance;
+ (NSArray *)propertyKeys;
- (BOOL)save;

//these are all just examples. delete and modify properties as you will

@property (nonatomic) NSString *stringProperty;
@property (nonatomic) NSString *myName;
@property (nonatomic) NSNumber *numberProperty;
@property (nonatomic) double double_Property;
@property (nonatomic) NSInteger randomPropertyName;
@property (nonatomic) float anotherPropertyName;
@property (nonatomic) NSArray *testArray;
@property (nonatomic) UIColor *thisColor;


@end

