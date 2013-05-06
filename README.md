NSDictionary+STHelper
=======================

NSDictionary category methods to get various value types.

Usage
---
Get NSInteger value. If the object in NSDictionary is not NSNumber or NSString of integer, it will return 0.
`NSInteger value = [dict st_integerForKey:@"value"]`

These methods can return default value if the object was not found.
`NSInteger value = [dict st_integerForKey:@"value" defaultValue:123]`
  
Get NSString value from a nested NSDictionary.  
`NSString *value = [dict st_stringForPath:@"user.name"]`
These methods are useful to get values from a parsed JSON NSDictionary.
  
All category methods have prefix 'st_'. It might look ugly but it could avoid name conflicts.  

How to install
---
Just copy 4 files to your project.  

- NSDictionary+STHelper.m
- NSDictionary+STHelper.h
- NSMutableDictionary+STHelper.m
- NSMutableDictionary+STHelper.h

Requirement
---
- Xcode version 4.4 and over
- ARC

License
---
MIT License  
Please read LICENSE.txt
