autoKeyedPersistentSingleton
============================

  This is intended to be a simple, lightweight alternative to NSUserDefaults class.
  It is a singleton object that encodes and persists any properties added to the @interface.
  It persists on disk using the NSKeyedArchiver and works with objects and primitive data types.
  because these are properties, then it will autocomplete in code.
  Get and Set the properties as you would any NSObject.
  Set the properties to persistent store using "save" method.
  At the moment it is not KVC compliant.
  
  NOTE: the implementation uses one method that relies on <objc/objc-runtime.h>
  
  ```
  @interface AKPSObject : NSObject

+ (AKPSObject *)sharedInstance;
+ (NSArray *)propertyKeys; //an array of property names as strings
- (BOOL)save;  //keyed archiving

//these are all just examples. uncomment or add properties as you wish

//@property (nonatomic) NSString *stringProperty;
//@property (nonatomic) double doubleProperty;

@property (nonatomic) NSArray *testArray;
```
