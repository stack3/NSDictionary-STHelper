//
//  NSDictionary_STTests.m
//  NSDictionary+STTests
//
//  Created by EIMEI on 12/07/04.
//
//  Copyright (c) 2012 stack3.net
//  Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
//  The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//

#import "NSDictionary_STTests.h"
#import "NSDictionary+ST.h"

@implementation NSDictionary_STTests

- (void)setUp {
    [super setUp];
    
    // Set-up code here.
}

- (void)tearDown {
    // Tear-down code here.
    
    [super tearDown];
}

- (void)testMethods {
    NSDictionary *dict;
    //
    // objectForKey
    //
    dict = @{
    @"key" : @"string",
    };
    STAssertEquals(@"string", [dict st_objectForKey:@"key"], nil);
    STAssertEquals((NSObject*)nil, [dict st_objectForKey:@"nil"], nil);
    //
    // boolForKey
    //
    dict = @{
    @"key1" : [NSNumber numberWithBool:YES],
    @"key2" : [NSNumber numberWithBool:NO],
    @"key3" : [NSNumber numberWithInt:1],
    @"key4" : [NSNumber numberWithInt:0],
    };
    STAssertEquals(YES, [dict st_boolForKey:@"key1"], nil);
    STAssertEquals(NO, [dict st_boolForKey:@"key2"], nil);
    STAssertEquals(YES, [dict st_boolForKey:@"key3"], nil);
    STAssertEquals(NO, [dict st_boolForKey:@"key4"], nil);
    STAssertEquals(YES, [dict st_boolForKey:@"key5" defaultValue:YES], nil);
    //
    // integerForKey
    //
    dict = @{
    @"min" : [NSString stringWithFormat:@"%ld", NSIntegerMin],
    @"max" : [NSString stringWithFormat:@"%ld", NSIntegerMax],
    @"one-two-three" : @"123",
    };
    STAssertEquals((NSInteger)NSIntegerMin, [dict st_integerForKey:@"min"], nil);
    STAssertEquals((NSInteger)NSIntegerMax, [dict st_integerForKey:@"max"], nil);
    STAssertEquals(123, [dict st_integerForKey:@"one-two-three"], nil);
    STAssertEquals(456, [dict st_integerForKey:@"nil" defaultValue:456], nil);
    
    dict = @{
    @"min" : [NSNumber numberWithInt:NSIntegerMin],
    @"max" : [NSNumber numberWithInt:NSIntegerMax],
    @"zero" : [NSNumber numberWithInt:0],
    };
    STAssertEquals(INT32_MIN, [dict st_integerForKey:@"min"], nil);
    STAssertEquals(INT32_MAX, [dict st_integerForKey:@"max"], nil);
    STAssertEquals(0, [dict st_integerForKey:@"zero"], nil);
    //
    // uintegerForKey
    //
    dict = @{
    @"max" : [NSString stringWithFormat:@"%lu", NSUIntegerMax],
    @"one-two-three" : @"123",
    };
    STAssertEquals((NSUInteger)NSUIntegerMax, [dict st_uintegerForKey:@"max"], nil);
    STAssertEquals((NSUInteger)123, [dict st_uintegerForKey:@"one-two-three"], nil);
    STAssertEquals((NSUInteger)345, [dict st_uintegerForKey:@"nil" defaultValue:345], nil);
    
    dict = @{
    @"max" : [NSNumber numberWithUnsignedInt:NSUIntegerMax],
    @"zero" : [NSNumber numberWithInt:0],
    };
    STAssertEquals((NSUInteger)NSUIntegerMax, [dict st_uintegerForKey:@"max"], nil);
    STAssertEquals((NSUInteger)0, [dict st_uintegerForKey:@"zero"], nil);
    //
    // int32ForKey
    //
    dict = @{
    @"min" : [NSString stringWithFormat:@"%d", INT32_MIN],
    @"max" : [NSString stringWithFormat:@"%d", INT32_MAX],
    @"one-two-three" : @"-123",
    };
    STAssertEquals(INT32_MIN, [dict st_int32ForKey:@"min"], nil);
    STAssertEquals(INT32_MAX, [dict st_int32ForKey:@"max"], nil);
    STAssertEquals(-123, [dict st_int32ForKey:@"one-two-three"], nil);
    STAssertEquals(345, [dict st_int32ForKey:@"nil" defaultValue:345], nil);
    
    dict = @{
    @"min" : [NSNumber numberWithInt:INT32_MIN],
    @"max" : [NSNumber numberWithInt:INT32_MAX],
    @"one-two-three" : [NSNumber numberWithInt:-123],
    };
    STAssertEquals(INT32_MIN, [dict st_int32ForKey:@"min"], nil);
    STAssertEquals(INT32_MAX, [dict st_int32ForKey:@"max"], nil);
    STAssertEquals(-123, [dict st_int32ForKey:@"one-two-three"], nil);
    //
    // uint32ForKey
    //
    dict = @{
    @"max" : [NSString stringWithFormat:@"%u", UINT32_MAX],
    @"one-two-three" : @"123",
    };
    STAssertEquals(UINT32_MAX, [dict st_uint32ForKey:@"max"], nil);
    STAssertEquals((uint32_t)123, [dict st_uint32ForKey:@"one-two-three"], nil);
    STAssertEquals((uint32_t)345, [dict st_uint32ForKey:@"zero" defaultValue:345], nil);
    
    dict = @{
    @"max" : [NSNumber numberWithUnsignedInt:UINT32_MAX],
    @"zero" : [NSNumber numberWithUnsignedInt:0],
    };
    STAssertEquals(UINT_MAX, [dict st_uint32ForKey:@"max"], nil);
    STAssertEquals((uint32_t)0, [dict st_uint32ForKey:@"zero"], nil);
    //
    // int64ForKey
    //
    dict = @{
    @"min" : [NSString stringWithFormat:@"%lld", LONG_LONG_MIN],
    @"max" : [NSString stringWithFormat:@"%lld", LONG_LONG_MAX],
    @"one-two-three" : @"123",
    };
    STAssertEquals(LONG_LONG_MIN, [dict st_int64ForKey:@"min"], nil);
    STAssertEquals(LONG_LONG_MAX, [dict st_int64ForKey:@"max"], nil);
    STAssertEquals((int64_t)123, [dict st_int64ForKey:@"one-two-three"], nil);
    STAssertEquals((int64_t)345, [dict st_int64ForKey:@"nil" defaultValue:345], nil);
    
    dict = @{
    @"min" : [NSNumber numberWithLongLong:LONG_LONG_MIN],
    @"max" : [NSNumber numberWithLongLong:LONG_LONG_MAX],
    @"one-two-three" : [NSNumber numberWithLongLong:-123],
    };
    STAssertEquals(LONG_LONG_MIN, [dict st_int64ForKey:@"min"], nil);
    STAssertEquals(LONG_LONG_MAX, [dict st_int64ForKey:@"max"], nil);
    STAssertEquals((int64_t)-123, [dict st_int64ForKey:@"one-two-three"], nil);
    //
    // uint64ForKey
    //
    dict = @{
    @"max" : [NSString stringWithFormat:@"%llu", ULONG_LONG_MAX],
    @"one-two-three" : @"123",
    };
    STAssertEquals(ULONG_LONG_MAX, [dict st_uint64ForKey:@"max"], nil);
    STAssertEquals((uint64_t)123, [dict st_uint64ForKey:@"one-two-three"], nil);
    STAssertEquals((uint64_t)345, [dict st_uint64ForKey:@"nil" defaultValue:345], nil);
    
    dict = @{
    @"max" : [NSNumber numberWithUnsignedLongLong:ULONG_LONG_MAX],
    @"zero" : [NSNumber numberWithUnsignedLongLong:0],
    };
    STAssertEquals(ULONG_LONG_MAX, [dict st_uint64ForKey:@"max"], nil);
    STAssertEquals((uint64_t)0, [dict st_uint64ForKey:@"zero"], nil);
    //
    // floatForKey
    //
    dict = @{
    @"max" : [NSString stringWithFormat:@"%f", FLT_MAX],
    @"one-two-three" : @"123.4",
    };
    STAssertEquals(MAXFLOAT, [dict st_floatForKey:@"max"], nil);
    STAssertEqualsWithAccuracy((float)123.4f, [dict st_floatForKey:@"one-two-three"], 0.01f, nil);
    STAssertEqualsWithAccuracy((float)345.0f, [dict st_floatForKey:@"nil" defaultValue:345.0f], 0.01f, nil);
    
    dict = @{
    @"max" : [NSNumber numberWithFloat:MAXFLOAT],
    @"zero" : [NSNumber numberWithFloat:0],
    };
    STAssertEquals(MAXFLOAT, [dict st_floatForKey:@"max"], nil);
    STAssertEquals((float)0, [dict st_floatForKey:@"zero"], nil);
    //
    // doubleForKey
    //
    dict = @{
    @"max" : [NSString stringWithFormat:@"%f", DBL_MAX],
    @"one-two-three" : @"123.4",
    };
    STAssertEquals(DBL_MAX, [dict st_doubleForKey:@"max"], nil);
    STAssertEquals((double)0, [dict st_doubleForKey:@"zero"], nil);
    STAssertEqualsWithAccuracy((double)123.4f, [dict st_doubleForKey:@"one-two-three"], 0.01f, nil);
    STAssertEqualsWithAccuracy((double)345.0f, [dict st_doubleForKey:@"nil" defaultValue:345.0f], 0.01f, nil);
    
    dict = @{
    @"max" : [NSNumber numberWithDouble:DBL_MAX],
    @"zero" : [NSNumber numberWithDouble:0],
    };
    STAssertEquals(DBL_MAX, [dict st_doubleForKey:@"max"], nil);
    STAssertEquals((double)0, [dict st_doubleForKey:@"zero"], nil);
    //
    // stringForKey
    //
    dict = @{
    @"string" : @"abc",
    @"number" : [NSNumber numberWithInt:123],
    @"array" : [NSArray array],
    };
    STAssertEquals(@"abc", [dict st_stringForKey:@"string"], nil);
    STAssertEquals(YES, [[dict st_stringForKey:@"number"] isEqualToString:@"123"], nil);
    STAssertEquals((NSString*)nil, [dict st_stringForKey:@"array"], nil);
    STAssertEquals((NSString*)@"abc", [dict st_stringForKey:@"array" defaultValue:@"abc"], nil);
    //
    // arrayForKey
    //
    dict = @{
    @"array" : @[@"0", @"1", @"2"],
    @"string" : @"abc",
    };
    NSArray *array = [dict st_arrayForKey:@"array"];
    STAssertEquals((NSUInteger)3, array.count, nil);
    STAssertEquals((NSArray*)nil, [dict st_arrayForKey:@"string"], nil);
    array = [dict st_arrayForKey:@"string" defaultValue:@[@"abc"]];
    STAssertEquals((NSString*)@"abc", [array objectAtIndex:0], nil);
    
    array = [dict st_arrayForKey:@"nil" defaultValue:@[@"abc"]];
    STAssertEquals((NSUInteger)1, array.count, nil);
    STAssertEquals(@"abc", (NSString*)[array objectAtIndex:0], nil);
    //
    // dictionaryForKey
    //
    dict = @{
    @"dictionary" : @{@"key": @"value"},
    @"string" : @"abc"
    };
    STAssertEquals(@"value", [[dict st_dictionaryForKey:@"dictionary"] objectForKey:@"key"], nil);
    STAssertEquals((NSDictionary*)nil, [dict st_dictionaryForKey:@"string"], nil);
    dict = [dict st_dictionaryForKey:@"string" defaultValue:@{@"key" : @"value"}];
    STAssertEquals((NSString*)@"value", [dict objectForKey:@"key"], nil);
    //
    // dateForKey
    //
    dict = @{
    @"date" : [NSDate dateWithTimeIntervalSince1970:123],
    @"string" : @"abc"
    };
    STAssertEquals((NSTimeInterval)123.0f, [[dict st_dateForKey:@"date"] timeIntervalSince1970], nil);
    STAssertEquals((NSDictionary*)nil, [dict st_dictionaryForKey:@"string"], nil);
    
    //
    // objectForPath
    //
    dict = @{
    @"user" : @{
        @"first_name" : @"Nyusoku",
        @"middle_name" : @"De",
        @"last_name" : @"Yaruo",
        @"address" : @{@"prefecture" : @"Tokyo", @"city" : @"Nerima"},
        @"age" : [NSNumber numberWithInt:28],
        @"created_at" : [NSDate dateWithTimeIntervalSince1970:123]
    },
    @"url" : @"stack3.net",
    @"friend_ids" : @[@"12345", @"12346", @"12347"],
    };
    STAssertEquals(@"Nyusoku", [dict st_stringForPath:@"user.first_name"], nil);
    STAssertEquals(@"De", [dict st_stringForPath:@"user.middle_name"], nil);
    STAssertEquals(@"Yaruo", [dict st_stringForPath:@"user.last_name"], nil);
    STAssertEquals(@"Tokyo", [dict st_stringForPath:@"user.address.prefecture"], nil);
    STAssertEquals(@"Nerima", [dict st_stringForPath:@"user.address.city"], nil);
    STAssertEquals(28, [[dict st_stringForPath:@"user.age"] intValue], nil);
    STAssertEquals((NSTimeInterval)123.0f, [[dict st_dateForPath:@"user.created_at"] timeIntervalSince1970], nil);
    STAssertEquals(@"stack3.net", [dict st_stringForPath:@"url"], nil);
    STAssertEquals(@"12347", [[dict st_arrayForPath:@"friend_ids"] lastObject], nil);
    
    STAssertEquals((NSObject*)nil, [dict st_objectForPath:@"nil"], nil);
    STAssertEquals((NSObject*)nil, [dict st_objectForPath:@"user.nil"], nil);
}

@end
