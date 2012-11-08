//
//  NSDictionary+ST.h
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

#import <Foundation/Foundation.h>

/**
 * @brief Category methods to get values.
 *
 * USAGE:
 *   [dict st_integerForKey:@"value"]
 *     -> If the value was integer, it returns NSInteger value.
 *   [dict st_stringForKey:@"user.name"]
 *     -> You can get value from a nested dictionary.
 *        These methods are useful to get values from dictionary parsed JSON.
 */
@interface NSDictionary (ST)

- (id)st_objectForKey:(NSString*)key;
- (id)st_objectForKey:(NSString*)key defaultValue:(id)defaultValue;
- (BOOL)st_boolForKey:(NSString*)key;
- (BOOL)st_boolForKey:(NSString*)key defaultValue:(BOOL)defaultValue;
- (NSInteger)st_integerForKey:(NSString*)key;
- (NSInteger)st_integerForKey:(NSString*)key defaultValue:(NSInteger)defaultValue;
- (NSUInteger)st_uintegerForKey:(NSString*)key;
- (NSUInteger)st_uintegerForKey:(NSString*)key defaultValue:(NSUInteger)defaultValue;
- (int32_t)st_int32ForKey:(NSString*)key;
- (int32_t)st_int32ForKey:(NSString*)key defaultValue:(int32_t)defaultValue;
- (uint32_t)st_uint32ForKey:(NSString*)key;
- (uint32_t)st_uint32ForKey:(NSString*)key defaultValue:(uint32_t)defaultValue;
- (int64_t)st_int64ForKey:(NSString*)key;
- (int64_t)st_int64ForKey:(NSString*)key defaultValue:(int64_t)defaultValue;
- (uint64_t)st_uint64ForKey:(NSString*)key;
- (uint64_t)st_uint64ForKey:(NSString*)key defaultValue:(uint64_t)defaultValue;
- (float)st_floatForKey:(NSString*)key;
- (float)st_floatForKey:(NSString*)key defaultValue:(float)defaultValue;
- (double)st_doubleForKey:(NSString*)key;
- (double)st_doubleForKey:(NSString*)key defaultValue:(double)defaultValue;
- (NSString*)st_stringForKey:(NSString*)key;
- (NSString*)st_stringForKey:(NSString*)key defaultValue:(NSString*)defaultValue;
- (NSArray*)st_arrayForKey:(NSString*)key;
- (NSArray*)st_arrayForKey:(NSString*)key defaultValue:(NSArray*)defaultValue;
- (NSDictionary*)st_dictionaryForKey:(NSString*)key;
- (NSDictionary*)st_dictionaryForKey:(NSString*)key defaultValue:(NSDictionary*)defaultValue;
- (NSDate*)st_dateForKey:(NSString*)key;
- (NSDate*)st_dateForKey:(NSString*)key defaultValue:(NSDate*)defaultValue;

- (NSObject*)st_objectForPath:(NSString*)path;
- (NSObject*)st_objectForPath:(NSString*)path defaultValue:(NSObject*)defaultValue;
- (BOOL)st_boolForPath:(NSString*)path;
- (BOOL)st_boolForPath:(NSString*)path defaultValue:(BOOL)defaultValue;
- (NSInteger)st_integerForPath:(NSString*)path;
- (NSInteger)st_integerForPath:(NSString*)path defaultValue:(NSInteger)defaultValue;
- (NSUInteger)st_uintegerForPath:(NSString*)path;
- (NSUInteger)st_uintegerForPath:(NSString*)path defaultValue:(NSUInteger)defaultValue;
- (int32_t)st_int32ForPath:(NSString*)path;
- (int32_t)st_int32ForPath:(NSString*)path defaultValue:(int32_t)defaultValue;
- (uint32_t)st_uint32ForPath:(NSString*)path;
- (uint32_t)st_uint32ForPath:(NSString*)path defaultValue:(uint32_t)defaultValue;
- (int64_t)st_int64ForPath:(NSString*)path;
- (int64_t)st_int64ForPath:(NSString*)path defaultValue:(int64_t)defaultValue;
- (uint64_t)st_uint64ForPath:(NSString*)path;
- (uint64_t)st_uint64ForPath:(NSString*)path defaultValue:(uint64_t)defaultValue;
- (float)st_floatForPath:(NSString*)path;
- (float)st_floatForPath:(NSString*)path defaultValue:(float)defaultValue;
- (double)st_doubleForPath:(NSString*)path;
- (double)st_doubleForPath:(NSString*)path defaultValue:(double)defaultValue;
- (NSString*)st_stringForPath:(NSString*)path;
- (NSString*)st_stringForPath:(NSString*)path defaultValue:(NSString*)defaultValue;
- (NSArray*)st_arrayForPath:(NSString*)path;
- (NSArray*)st_arrayForPath:(NSString*)path defaultValue:(NSArray*)defaultValue;
- (NSDictionary*)st_dictionaryForPath:(NSString*)path;
- (NSDictionary*)st_dictionaryForPath:(NSString*)path defaultValue:(NSDictionary*)defaultValue;
- (NSDate*)st_dateForPath:(NSString*)path;
- (NSDate*)st_dateForPath:(NSString*)path defaultValue:(NSDate*)defaultValue;

@end
