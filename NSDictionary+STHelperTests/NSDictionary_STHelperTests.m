//
//  NSDictionary_STHelperTests.m
//  NSDictionary+STHelperTests
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

#import "NSDictionary_STHelperTests.h"
#import "NSDictionary+STHelper.h"

@implementation NSDictionary_STHelperTests

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
    // unsignedIntegerForKey
    //
    dict = @{
    @"max" : [NSString stringWithFormat:@"%lu", NSUIntegerMax],
    @"one-two-three" : @"123",
    };
    STAssertEquals((NSUInteger)NSUIntegerMax, [dict st_unsignedIntegerForKey:@"max"], nil);
    STAssertEquals((NSUInteger)123, [dict st_unsignedIntegerForKey:@"one-two-three"], nil);
    STAssertEquals((NSUInteger)345, [dict st_unsignedIntegerForKey:@"nil" defaultValue:345], nil);
    
    dict = @{
    @"max" : [NSNumber numberWithUnsignedInt:NSUIntegerMax],
    @"zero" : [NSNumber numberWithInt:0],
    };
    STAssertEquals((NSUInteger)NSUIntegerMax, [dict st_unsignedIntegerForKey:@"max"], nil);
    STAssertEquals((NSUInteger)0, [dict st_unsignedIntegerForKey:@"zero"], nil);
    //
    // charForKey
    //
    dict = @{
             @"min" : [NSString stringWithFormat:@"%d", CHAR_MIN],
             @"max" : [NSString stringWithFormat:@"%d", CHAR_MAX],
             @"one-two-three" : @"123",
             };
    STAssertEquals((char)CHAR_MIN, [dict st_charForKey:@"min"], nil);
    STAssertEquals((char)CHAR_MAX, [dict st_charForKey:@"max"], nil);
    STAssertEquals((char)123, [dict st_charForKey:@"one-two-three"], nil);
    STAssertEquals((char)124, [dict st_charForKey:@"nil" defaultValue:124], nil);
    
    dict = @{
             @"min" : [NSNumber numberWithChar:CHAR_MIN],
             @"max" : [NSNumber numberWithChar:CHAR_MAX],
             @"zero" : [NSNumber numberWithChar:0],
             };
    STAssertEquals((char)CHAR_MIN, [dict st_charForKey:@"min"], nil);
    STAssertEquals((char)CHAR_MAX, [dict st_charForKey:@"max"], nil);
    STAssertEquals((char)0, [dict st_charForKey:@"zero"], nil);
    //
    // unsignedCharForKey
    //
    dict = @{
             @"max" : [NSString stringWithFormat:@"%u", UCHAR_MAX],
             @"one-two-three" : @"123",
             };
    STAssertEquals((unsigned char)UCHAR_MAX, [dict st_unsignedCharForKey:@"max"], nil);
    STAssertEquals((unsigned char)123, [dict st_unsignedCharForKey:@"one-two-three"], nil);
    STAssertEquals((unsigned char)210, [dict st_unsignedCharForKey:@"nil" defaultValue:210], nil);
    
    dict = @{
             @"max" : [NSNumber numberWithUnsignedChar:UCHAR_MAX],
             @"zero" : [NSNumber numberWithUnsignedChar:0],
             };
    STAssertEquals((unsigned char)UCHAR_MAX, [dict st_unsignedCharForKey:@"max"], nil);
    STAssertEquals((unsigned char)0, [dict st_unsignedCharForKey:@"zero"], nil);
    //
    // shortForKey
    //
    dict = @{
             @"min" : [NSString stringWithFormat:@"%d", SHRT_MIN],
             @"max" : [NSString stringWithFormat:@"%d", SHRT_MAX],
             @"one-two-three" : @"123",
             };
    STAssertEquals((short)SHRT_MIN, [dict st_shortForKey:@"min"], nil);
    STAssertEquals((short)SHRT_MAX, [dict st_shortForKey:@"max"], nil);
    STAssertEquals((short)123, [dict st_shortForKey:@"one-two-three"], nil);
    STAssertEquals((short)124, [dict st_shortForKey:@"nil" defaultValue:124], nil);
    
    dict = @{
             @"min" : [NSNumber numberWithShort:SHRT_MIN],
             @"max" : [NSNumber numberWithShort:SHRT_MAX],
             @"zero" : [NSNumber numberWithShort:0],
             };
    STAssertEquals((short)SHRT_MIN, [dict st_shortForKey:@"min"], nil);
    STAssertEquals((short)SHRT_MAX, [dict st_shortForKey:@"max"], nil);
    STAssertEquals((short)0, [dict st_shortForKey:@"zero"], nil);
    //
    // unsignedShortForKey
    //
    dict = @{
             @"max" : [NSString stringWithFormat:@"%u", USHRT_MAX],
             @"one-two-three" : @"123",
             };
    STAssertEquals((unsigned short)USHRT_MAX, [dict st_unsignedShortForKey:@"max"], nil);
    STAssertEquals((unsigned short)123, [dict st_unsignedShortForKey:@"one-two-three"], nil);
    STAssertEquals((unsigned short)210, [dict st_unsignedShortForKey:@"nil" defaultValue:210], nil);
    
    dict = @{
             @"max" : [NSNumber numberWithUnsignedShort:USHRT_MAX],
             @"zero" : [NSNumber numberWithUnsignedShort:0],
             };
    STAssertEquals((unsigned short)USHRT_MAX, [dict st_unsignedShortForKey:@"max"], nil);
    STAssertEquals((unsigned short)0, [dict st_unsignedShortForKey:@"zero"], nil);
    //
    // longForKey
    //
    dict = @{
             @"min" : [NSString stringWithFormat:@"%ld", LONG_MIN],
             @"max" : [NSString stringWithFormat:@"%ld", LONG_MAX],
             @"one-two-three" : @"123",
             };
    STAssertEquals((long)LONG_MIN, [dict st_longForKey:@"min"], nil);
    STAssertEquals((long)LONG_MAX, [dict st_longForKey:@"max"], nil);
    STAssertEquals((long)123, [dict st_longForKey:@"one-two-three"], nil);
    STAssertEquals((long)124, [dict st_longForKey:@"nil" defaultValue:124], nil);
    
    dict = @{
             @"min" : [NSNumber numberWithLong:LONG_MIN],
             @"max" : [NSNumber numberWithLong:LONG_MAX],
             @"zero" : [NSNumber numberWithLong:0],
             };
    STAssertEquals((long)LONG_MIN, [dict st_longForKey:@"min"], nil);
    STAssertEquals((long)LONG_MAX, [dict st_longForKey:@"max"], nil);
    STAssertEquals((long)0, [dict st_longForKey:@"zero"], nil);
    //
    // unsignedLongForKey
    //
    dict = @{
             @"max" : [NSString stringWithFormat:@"%lu", ULONG_MAX],
             @"one-two-three" : @"123",
             };
    STAssertEquals((unsigned long)ULONG_MAX, [dict st_unsignedLongForKey:@"max"], nil);
    STAssertEquals((unsigned long)123, [dict st_unsignedLongForKey:@"one-two-three"], nil);
    STAssertEquals((unsigned long)210, [dict st_unsignedLongForKey:@"nil" defaultValue:210], nil);
    
    dict = @{
             @"max" : [NSNumber numberWithUnsignedLong:ULONG_MAX],
             @"zero" : [NSNumber numberWithUnsignedLong:0],
             };
    STAssertEquals((unsigned long)ULONG_MAX, [dict st_unsignedLongForKey:@"max"], nil);
    STAssertEquals((unsigned long)0, [dict st_unsignedLongForKey:@"zero"], nil);
    //
    // longLongForKey
    //
    dict = @{
             @"min" : [NSString stringWithFormat:@"%lld", LLONG_MIN],
             @"max" : [NSString stringWithFormat:@"%lld", LLONG_MAX],
             @"one-two-three" : @"123",
             };
    STAssertEquals((long long)LLONG_MIN, [dict st_longLongForKey:@"min"], nil);
    STAssertEquals((long long)LLONG_MAX, [dict st_longLongForKey:@"max"], nil);
    STAssertEquals((long long)123, [dict st_longLongForKey:@"one-two-three"], nil);
    STAssertEquals((long long)124, [dict st_longLongForKey:@"nil" defaultValue:124], nil);
    
    dict = @{
             @"min" : [NSNumber numberWithLongLong:LLONG_MIN],
             @"max" : [NSNumber numberWithLongLong:LLONG_MAX],
             @"zero" : [NSNumber numberWithLongLong:0],
             };
    STAssertEquals((long long)LLONG_MIN, [dict st_longLongForKey:@"min"], nil);
    STAssertEquals((long long)LLONG_MAX, [dict st_longLongForKey:@"max"], nil);
    STAssertEquals((long long)0, [dict st_longLongForKey:@"zero"], nil);
    //
    // unsignedLongLongForKey
    //
    dict = @{
             @"max" : [NSString stringWithFormat:@"%llu", ULLONG_MAX],
             @"one-two-three" : @"123",
             };
    STAssertEquals((unsigned long long)ULLONG_MAX, [dict st_unsignedLongLongForKey:@"max"], nil);
    STAssertEquals((unsigned long long)123, [dict st_unsignedLongLongForKey:@"one-two-three"], nil);
    STAssertEquals((unsigned long long)210, [dict st_unsignedLongLongForKey:@"nil" defaultValue:210], nil);
    
    dict = @{
             @"max" : [NSNumber numberWithUnsignedLongLong:ULLONG_MAX],
             @"zero" : [NSNumber numberWithUnsignedLongLong:0],
             };
    STAssertEquals((unsigned long long)ULLONG_MAX, [dict st_unsignedLongLongForKey:@"max"], nil);
    STAssertEquals((unsigned long long)0, [dict st_unsignedLongLongForKey:@"zero"], nil);
    //
    // Alias of integers.
    //
    dict = @{
    @"int8_min" : [NSString stringWithFormat:@"%d", INT8_MIN],
    @"int8_max" : [NSString stringWithFormat:@"%d", INT8_MAX],
    @"uint8_max" : [NSString stringWithFormat:@"%u", UINT8_MAX],
    @"int16_min" : [NSString stringWithFormat:@"%d", INT16_MIN],
    @"int16_max" : [NSString stringWithFormat:@"%d", INT16_MAX],
    @"uint16_max" : [NSString stringWithFormat:@"%u", UINT16_MAX],
    @"int32_min" : [NSString stringWithFormat:@"%d", INT32_MIN],
    @"int32_max" : [NSString stringWithFormat:@"%d", INT32_MAX],
    @"uint32_max" : [NSString stringWithFormat:@"%u", UINT32_MAX],
    @"int64_min" : [NSString stringWithFormat:@"%lld", INT64_MIN],
    @"int64_max" : [NSString stringWithFormat:@"%lld", INT64_MAX],
    @"uint64_max" : [NSString stringWithFormat:@"%llu", UINT64_MAX],
    };
    STAssertEquals((int8_t)INT8_MIN, [dict st_int8ForKey:@"int8_min"], nil);
    STAssertEquals((int8_t)INT8_MAX, [dict st_int8ForKey:@"int8_max"], nil);
    STAssertEquals((uint8_t)UINT8_MAX, [dict st_uint8ForKey:@"uint8_max"], nil);
    STAssertEquals((int16_t)INT16_MIN, [dict st_int16ForKey:@"int16_min"], nil);
    STAssertEquals((int16_t)INT16_MAX, [dict st_int16ForKey:@"int16_max"], nil);
    STAssertEquals((uint16_t)UINT16_MAX, [dict st_uint16ForKey:@"uint16_max"], nil);
    STAssertEquals((int32_t)INT32_MIN, [dict st_int32ForKey:@"int32_min"], nil);
    STAssertEquals((int32_t)INT32_MAX, [dict st_int32ForKey:@"int32_max"], nil);
    STAssertEquals((uint32_t)UINT32_MAX, [dict st_uint32ForKey:@"uint32_max"], nil);
    STAssertEquals((int64_t)INT64_MIN, [dict st_int64ForKey:@"int64_min"], nil);
    STAssertEquals((int64_t)INT64_MAX, [dict st_int64ForKey:@"int64_max"], nil);
    STAssertEquals((uint64_t)UINT64_MAX, [dict st_uint64ForKey:@"uint64_max"], nil);
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
    STAssertEquals((NSTimeInterval)345.0f, [[dict st_dateForKey:@"date2" defaultValue:[NSDate dateWithTimeIntervalSince1970:345.0f]] timeIntervalSince1970], nil);
    //
    // dataForKey
    //
    dict = @{
             @"data" : [@"data1" dataUsingEncoding:NSUTF8StringEncoding],
             };
    STAssertEqualObjects(@"data1", [[NSString alloc] initWithData:[dict st_dataForKey:@"data"] encoding:NSUTF8StringEncoding], nil);
    STAssertEqualObjects(@"data2", [[NSString alloc] initWithData:[dict st_dataForKey:@"data2" defaultValue:[@"data2" dataUsingEncoding:NSUTF8StringEncoding]] encoding:NSUTF8StringEncoding], nil);
    //
    // URLForKey
    //
    dict = @{
             @"url" : [NSURL URLWithString:@"http://stack3.net/"]
             };
    STAssertEqualObjects(@"http://stack3.net/", [[dict st_URLForKey:@"url"] absoluteString], nil);
    STAssertEqualObjects(@"http://stack3.net/about", [[dict st_URLForKey:@"url2" defaultValue:[NSURL URLWithString:@"http://stack3.net/about"]] absoluteString], nil);
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
