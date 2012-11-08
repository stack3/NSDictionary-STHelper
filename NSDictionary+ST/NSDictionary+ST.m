//
//  NSDictionary+ST.m
//
//  Copyright (c) 2012 stack3.net (http://stack3.net/)
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

#import "NSDictionary+ST.h"

@implementation NSDictionary (ST)

#pragma mark -
#pragma mark ForKey

- (id)st_objectForKey:(NSString*)key {
    return [self st_objectForKey:key defaultValue:nil];
}

- (id)st_objectForKey:(NSString*)key defaultValue:(id)defaultValue {
	id obj = [self objectForKey:key];
	if (obj) {
		return obj;
	} else {
		return defaultValue;
	}
}

- (BOOL)st_boolForKey:(NSString*)key {
	return [self st_boolForKey:key defaultValue:NO];
}

- (BOOL)st_boolForKey:(NSString*)key defaultValue:(BOOL)defaultValue {
    id obj = [self objectForKey:key];
	if (obj && [obj isKindOfClass:[NSNumber class]]) {
		return [(NSNumber*)obj boolValue];
	} else {
		return defaultValue;
	}
}

- (NSInteger)st_integerForKey:(NSString*)key {
	return [self st_integerForKey:key defaultValue:0];
}

- (NSInteger)st_integerForKey:(NSString*)key defaultValue:(NSInteger)defaultValue {
	id obj = [self objectForKey:key];
	if (!obj) {
		return defaultValue;
	}
    
	if ([obj isKindOfClass:[NSNumber class]]) {
		return [(NSNumber*)obj integerValue];
	} else if ([obj isKindOfClass:[NSString class]]) {
		return (NSInteger)strtol([(NSString*)obj UTF8String], NULL, 0);
	} else {
		return defaultValue;
	}
}

- (NSUInteger)st_uintegerForKey:(NSString*)key {
	return [self st_uintegerForKey:key defaultValue:0];
}

- (NSUInteger)st_uintegerForKey:(NSString*)key defaultValue:(NSUInteger)defaultValue {
	id obj = [self objectForKey:key];
	if (!obj) {
		return defaultValue;
	}
    
	if ([obj isKindOfClass:[NSNumber class]]) {
		return [(NSNumber*)obj unsignedIntegerValue];
	} else if ([obj isKindOfClass:[NSString class]]) {
		return (NSInteger)strtoul([(NSString*)obj UTF8String], NULL, 0);
	} else {
		return defaultValue;
	}
}

- (int32_t)st_int32ForKey:(NSString*)key {
	return [self st_int32ForKey:key defaultValue:0];
}

- (int32_t)st_int32ForKey:(NSString*)key defaultValue:(int32_t)defaultValue {
    return [self st_integerForKey:key defaultValue:defaultValue];
}

- (uint32_t)st_uint32ForKey:(NSString*)key {
	return [self st_uint32ForKey:key defaultValue:0];
}

- (uint32_t)st_uint32ForKey:(NSString*)key defaultValue:(uint32_t)defaultValue {
    return [self st_uintegerForKey:key defaultValue:defaultValue];
}

- (int64_t)st_int64ForKey:(NSString*)key {
	return [self st_int64ForKey:key defaultValue:0];
}

- (int64_t)st_int64ForKey:(NSString*)key defaultValue:(int64_t)defaultValue {
	id obj = [self objectForKey:key];
	if (!obj) {
		return defaultValue;
	}
	
	if ([obj isKindOfClass:[NSNumber class]]) {
		return [(NSNumber*)obj longLongValue];
	} else if ([obj isKindOfClass:[NSString class]]) {
		return strtoll([(NSString*)obj UTF8String], NULL, 0);
	} else {
		return defaultValue;
	}
}

- (uint64_t)st_uint64ForKey:(NSString*)key {
	return [self st_uint64ForKey:key defaultValue:0];
}

- (uint64_t)st_uint64ForKey:(NSString*)key defaultValue:(uint64_t)defaultValue {
	id obj = [self objectForKey:key];
	if (!obj) {
		return defaultValue;
	}
	
	if ([obj isKindOfClass:[NSNumber class]]) {
		return [(NSNumber*)obj unsignedLongLongValue];
	} else if ([obj isKindOfClass:[NSString class]]) {
		return strtoull([(NSString*)obj UTF8String], NULL, 0);
	} else {
		return defaultValue;
	}
}

- (float)st_floatForKey:(NSString*)key {
	return [self st_floatForKey:key defaultValue:0];
}

- (float)st_floatForKey:(NSString*)key defaultValue:(float)defaultValue {
	id obj = [self objectForKey:key];
	if (!obj) {
		return defaultValue;
	}
    
	if ([obj isKindOfClass:[NSNumber class]]) {
		return [(NSNumber*)obj floatValue];
	} else if ([obj isKindOfClass:[NSString class]]) {
		return [(NSString*)obj floatValue];
	} else {
		return defaultValue;
	}
}

- (double)st_doubleForKey:(NSString*)key {
	return [self st_doubleForKey:key defaultValue:0];
}

- (double)st_doubleForKey:(NSString*)key defaultValue:(double)defaultValue {
	id obj = [self objectForKey:key];
	if (!obj) {
		return defaultValue;
	}
    
	if ([obj isKindOfClass:[NSNumber class]]) {
		return [(NSNumber*)obj doubleValue];
	} else if ([obj isKindOfClass:[NSString class]]) {
		return [(NSString*)obj doubleValue];
	} else {
		return defaultValue;
	}
}

- (NSString*)st_stringForKey:(NSString*)key {
	return [self st_stringForKey:key defaultValue:nil];
}

- (NSString*)st_stringForKey:(NSString*)key defaultValue:(NSString*)defaultValue {
	id obj = [self objectForKey:key];
	if (!obj) {
		return defaultValue;
	}
    
    if ([obj isKindOfClass:[NSString class]]) {
		return obj;
	} else if ([obj isKindOfClass:[NSNumber class]]) {
		return [(NSNumber*)obj stringValue];
	} else {
		return defaultValue;
	}
}

- (NSArray*)st_arrayForKey:(NSString*)key {
	return [self st_arrayForKey:key defaultValue:nil];
}

- (NSArray*)st_arrayForKey:(NSString*)key defaultValue:(NSArray*)defaultValue {
	id obj = [self objectForKey:key];
    if (obj && [obj isKindOfClass:[NSArray class]]) {
		return obj;
	} else {
		return defaultValue;
	}
}

- (NSDictionary*)st_dictionaryForKey:(NSString*)key {
	return [self st_dictionaryForKey:key defaultValue:nil];
}

- (NSDictionary*)st_dictionaryForKey:(NSString*)key defaultValue:(NSDictionary*)defaultValue {
	id obj = [self objectForKey:key];
    if (obj && [obj isKindOfClass:[NSDictionary class]]) {
		return obj;
	} else {
		return defaultValue;
	}
}

- (NSDate*)st_dateForKey:(NSString*)key {
	return [self st_dateForKey:key defaultValue:nil];
}

- (NSDate*)st_dateForKey:(NSString*)key defaultValue:(NSDate*)defaultValue {
	id obj = [self objectForKey:key];
    if (obj && [obj isKindOfClass:[NSDate class]]) {
		return obj;
	} else {
		return defaultValue;
	}
}

#pragma mark -
#pragma mark ForPath

- (NSDictionary*)st_dictionaryForPaths:(NSArray*)paths {
    if (paths.count == 0) {
        return nil;
    }
    
    NSDictionary *target = self;
    for (int i = 0; i < paths.count - 1; i++) {
        NSString *key = [paths objectAtIndex:i];
        target = [target st_dictionaryForKey:key];
        if (!target) {
            return nil;
        }
    }
    
    return target;
}

- (NSObject*)st_objectForPath:(NSString*)path {
    return [self st_objectForPath:path defaultValue:nil];
}

- (NSObject*)st_objectForPath:(NSString*)path defaultValue:(NSObject*)defaultValue {
    NSArray *paths = [path componentsSeparatedByString:@"."];
    if (paths.count == 1) {
        return [self st_objectForKey:paths.lastObject];
    } else if (paths.count >= 2) {
        NSDictionary *obj = [self st_dictionaryForPaths:paths];
        return [obj st_objectForKey:paths.lastObject];
    }
    
    return defaultValue;
}

- (BOOL)st_boolForPath:(NSString*)path {
    return [self st_boolForPath:path defaultValue:NO];
}

- (BOOL)st_boolForPath:(NSString*)path defaultValue:(BOOL)defaultValue {
    NSArray *paths = [path componentsSeparatedByString:@"."];
    if (paths.count == 1) {
        return [self st_boolForKey:paths.lastObject];
    } else if (paths.count >= 2) {
        NSDictionary *obj = [self st_dictionaryForPaths:paths];
        return [obj st_boolForKey:paths.lastObject];
    }
    
    return defaultValue;
}

- (NSInteger)st_integerForPath:(NSString*)path {
    return [self st_integerForPath:path defaultValue:0];
}

- (NSInteger)st_integerForPath:(NSString*)path defaultValue:(NSInteger)defaultValue {
    NSArray *paths = [path componentsSeparatedByString:@"."];
    if (paths.count == 1) {
        return [self st_integerForKey:paths.lastObject];
    } else if (paths.count >= 2) {
        NSDictionary *obj = [self st_dictionaryForPaths:paths];
        return [obj st_integerForKey:paths.lastObject];
    }
    
    return defaultValue;
}

- (NSUInteger)st_uintegerForPath:(NSString*)path {
    return [self st_uintegerForPath:path defaultValue:0];
}

- (NSUInteger)st_uintegerForPath:(NSString*)path defaultValue:(NSUInteger)defaultValue {
    NSArray *paths = [path componentsSeparatedByString:@"."];
    if (paths.count == 1) {
        return [self st_uintegerForKey:paths.lastObject];
    } else if (paths.count >= 2) {
        NSDictionary *obj = [self st_dictionaryForPaths:paths];
        return [obj st_uintegerForKey:paths.lastObject];
    }
    
    return defaultValue;
}

- (int32_t)st_int32ForPath:(NSString*)path {
    return [self st_int32ForPath:path defaultValue:0];
}

- (int32_t)st_int32ForPath:(NSString*)path defaultValue:(int32_t)defaultValue {
    NSArray *paths = [path componentsSeparatedByString:@"."];
    if (paths.count == 1) {
        return [self st_int32ForKey:paths.lastObject];
    } else if (paths.count >= 2) {
        NSDictionary *obj = [self st_dictionaryForPaths:paths];
        return [obj st_int32ForKey:paths.lastObject];
    }
    
    return defaultValue;
}

- (uint32_t)st_uint32ForPath:(NSString*)path {
    return [self st_uint32ForPath:path defaultValue:0];
}

- (uint32_t)st_uint32ForPath:(NSString*)path defaultValue:(uint32_t)defaultValue {
    NSArray *paths = [path componentsSeparatedByString:@"."];
    if (paths.count == 1) {
        return [self st_uint32ForKey:paths.lastObject];
    } else if (paths.count >= 2) {
        NSDictionary *obj = [self st_dictionaryForPaths:paths];
        return [obj st_uint32ForKey:paths.lastObject];
    }
    
    return defaultValue;
}

- (int64_t)st_int64ForPath:(NSString*)path {
    return [self st_int64ForPath:path defaultValue:0];
}

- (int64_t)st_int64ForPath:(NSString*)path defaultValue:(int64_t)defaultValue {
    NSArray *paths = [path componentsSeparatedByString:@"."];
    if (paths.count == 1) {
        return [self st_int64ForKey:paths.lastObject];
    } else if (paths.count >= 2) {
        NSDictionary *obj = [self st_dictionaryForPaths:paths];
        return [obj st_int64ForKey:paths.lastObject];
    }
    
    return defaultValue;
}

- (uint64_t)st_uint64ForPath:(NSString*)path {
    return [self st_uint64ForPath:path defaultValue:0];
}

- (uint64_t)st_uint64ForPath:(NSString*)path defaultValue:(uint64_t)defaultValue {
    NSArray *paths = [path componentsSeparatedByString:@"."];
    if (paths.count == 1) {
        return [self st_uint64ForKey:paths.lastObject];
    } else if (paths.count >= 2) {
        NSDictionary *obj = [self st_dictionaryForPaths:paths];
        return [obj st_uint64ForKey:paths.lastObject];
    }
    
    return defaultValue;
}

- (float)st_floatForPath:(NSString*)path {
    return [self st_floatForPath:path defaultValue:0];
}

- (float)st_floatForPath:(NSString*)path defaultValue:(float)defaultValue {
    NSArray *paths = [path componentsSeparatedByString:@"."];
    if (paths.count == 1) {
        return [self st_floatForKey:paths.lastObject];
    } else if (paths.count >= 2) {
        NSDictionary *obj = [self st_dictionaryForPaths:paths];
        return [obj st_floatForKey:paths.lastObject];
    }
    
    return defaultValue;
}

- (double)st_doubleForPath:(NSString*)path {
    return [self st_doubleForPath:path defaultValue:0];
}

- (double)st_doubleForPath:(NSString*)path defaultValue:(double)defaultValue {
    NSArray *paths = [path componentsSeparatedByString:@"."];
    if (paths.count == 1) {
        return [self st_doubleForKey:paths.lastObject];
    } else if (paths.count >= 2) {
        NSDictionary *obj = [self st_dictionaryForPaths:paths];
        return [obj st_doubleForKey:paths.lastObject];
    }
    
    return defaultValue;
}

- (NSString*)st_stringForPath:(NSString*)path {
    return [self st_stringForPath:path defaultValue:nil];
}

- (NSString*)st_stringForPath:(NSString*)path defaultValue:(NSString*)defaultValue {
    NSArray *paths = [path componentsSeparatedByString:@"."];
    if (paths.count == 1) {
        return [self st_stringForKey:paths.lastObject];
    } else if (paths.count >= 2) {
        NSDictionary *obj = [self st_dictionaryForPaths:paths];
        return [obj st_stringForKey:paths.lastObject];
    }
    
    return defaultValue;
}

- (NSArray*)st_arrayForPath:(NSString*)path {
    return [self st_arrayForPath:path defaultValue:nil];
}

- (NSArray*)st_arrayForPath:(NSString*)path defaultValue:(NSArray*)defaultValue {
    NSArray *paths = [path componentsSeparatedByString:@"."];
    if (paths.count == 1) {
        return [self st_arrayForKey:paths.lastObject];
    } else if (paths.count >= 2) {
        NSDictionary *obj = [self st_dictionaryForPaths:paths];
        return [obj st_arrayForKey:paths.lastObject];
    }
    
    return defaultValue;
}

- (NSDictionary*)st_dictionaryForPath:(NSString*)path {
    return [self st_dictionaryForPath:path defaultValue:nil];
}

- (NSDictionary*)st_dictionaryForPath:(NSString*)path defaultValue:(NSDictionary*)defaultValue {
    NSArray *paths = [path componentsSeparatedByString:@"."];
    if (paths.count == 1) {
        return [self st_dictionaryForKey:paths.lastObject];
    } else if (paths.count >= 2) {
        NSDictionary *obj = [self st_dictionaryForPaths:paths];
        return [obj st_dictionaryForKey:paths.lastObject];
    }
    
    return defaultValue;
}

- (NSDate*)st_dateForPath:(NSString*)path {
    return [self st_dateForPath:path defaultValue:nil];
}

- (NSDate*)st_dateForPath:(NSString*)path defaultValue:(NSDate*)defaultValue {
    NSArray *paths = [path componentsSeparatedByString:@"."];
    if (paths.count == 1) {
        return [self st_dateForKey:paths.lastObject];
    } else if (paths.count >= 2) {
        NSDictionary *obj = [self st_dictionaryForPaths:paths];
        return [obj st_dateForKey:paths.lastObject];
    }
    
    return defaultValue;
}

@end
