//
//  commentsBaseClass.m
//
//  Created by   on 2017/6/14
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "commentsBaseClass.h"
#import "commentsData.h"


NSString *const kcommentsBaseClassCode = @"code";
NSString *const kcommentsBaseClassMessage = @"message";
NSString *const kcommentsBaseClassData = @"data";
NSString *const kcommentsBaseClassServerTime = @"server_time";


@interface commentsBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation commentsBaseClass

@synthesize code = _code;
@synthesize message = _message;
@synthesize data = _data;
@synthesize serverTime = _serverTime;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.code = [self objectOrNilForKey:kcommentsBaseClassCode fromDictionary:dict];
            self.message = [self objectOrNilForKey:kcommentsBaseClassMessage fromDictionary:dict];
            self.data = [commentsData modelObjectWithDictionary:[dict objectForKey:kcommentsBaseClassData]];
            self.serverTime = [self objectOrNilForKey:kcommentsBaseClassServerTime fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.code forKey:kcommentsBaseClassCode];
    [mutableDict setValue:self.message forKey:kcommentsBaseClassMessage];
    [mutableDict setValue:[self.data dictionaryRepresentation] forKey:kcommentsBaseClassData];
    [mutableDict setValue:self.serverTime forKey:kcommentsBaseClassServerTime];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description 
{
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict
{
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];

    self.code = [aDecoder decodeObjectForKey:kcommentsBaseClassCode];
    self.message = [aDecoder decodeObjectForKey:kcommentsBaseClassMessage];
    self.data = [aDecoder decodeObjectForKey:kcommentsBaseClassData];
    self.serverTime = [aDecoder decodeObjectForKey:kcommentsBaseClassServerTime];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_code forKey:kcommentsBaseClassCode];
    [aCoder encodeObject:_message forKey:kcommentsBaseClassMessage];
    [aCoder encodeObject:_data forKey:kcommentsBaseClassData];
    [aCoder encodeObject:_serverTime forKey:kcommentsBaseClassServerTime];
}

- (id)copyWithZone:(NSZone *)zone
{
    commentsBaseClass *copy = [[commentsBaseClass alloc] init];
    
    if (copy) {

        copy.code = [self.code copyWithZone:zone];
        copy.message = [self.message copyWithZone:zone];
        copy.data = [self.data copyWithZone:zone];
        copy.serverTime = [self.serverTime copyWithZone:zone];
    }
    
    return copy;
}


@end
