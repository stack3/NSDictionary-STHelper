How to install.
---
Just copy NSDictionary+ST.m and NSDictionary+ST.h to your project.  
Xcode version: 4.4 and over with ARC.

USAGE
---
Get NSInteger value. If the object in dictionary is not NSNumber or NSString of integer, it will return nil.
`NSInteger value = [dict st_integerForKey:@"value"]`
  
Get NSString value from a nested NSDictionary.  
`NSString *value = [dict st_stringForPath:@"user.name"]`
  
All category methods have prefix 'st_'. It might look ugly but it could avoid name conflicts.  

LICENSE
---
MIT License
Please read LICENSE.txt
