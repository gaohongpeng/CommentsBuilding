//
//  commentsData.m
//
//  Created by   on 2017/6/14
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "commentsData.h"
#import "commentsHot.h"
#import "commentsTimeLine.h"


NSString *const kcommentsDataHot = @"hot";
NSString *const kcommentsDataTimeLine = @"time_line";


@interface commentsData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation commentsData

@synthesize hot = _hot;
@synthesize timeLine = _timeLine;


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
    NSObject *receivedcommentsHot = [dict objectForKey:kcommentsDataHot];
    NSMutableArray *parsedcommentsHot = [NSMutableArray array];
    if ([receivedcommentsHot isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedcommentsHot) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedcommentsHot addObject:[commentsHot modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedcommentsHot isKindOfClass:[NSDictionary class]]) {
       [parsedcommentsHot addObject:[commentsHot modelObjectWithDictionary:(NSDictionary *)receivedcommentsHot]];
    }

    self.hot = [NSArray arrayWithArray:parsedcommentsHot];
    NSObject *receivedcommentsTimeLine = [dict objectForKey:kcommentsDataTimeLine];
    NSMutableArray *parsedcommentsTimeLine = [NSMutableArray array];
    if ([receivedcommentsTimeLine isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedcommentsTimeLine) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedcommentsTimeLine addObject:[commentsTimeLine modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedcommentsTimeLine isKindOfClass:[NSDictionary class]]) {
       [parsedcommentsTimeLine addObject:[commentsTimeLine modelObjectWithDictionary:(NSDictionary *)receivedcommentsTimeLine]];
    }

    self.timeLine = [NSArray arrayWithArray:parsedcommentsTimeLine];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    NSMutableArray *tempArrayForHot = [NSMutableArray array];
    for (NSObject *subArrayObject in self.hot) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForHot addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForHot addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForHot] forKey:kcommentsDataHot];
    NSMutableArray *tempArrayForTimeLine = [NSMutableArray array];
    for (NSObject *subArrayObject in self.timeLine) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForTimeLine addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForTimeLine addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForTimeLine] forKey:kcommentsDataTimeLine];

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

    self.hot = [aDecoder decodeObjectForKey:kcommentsDataHot];
    self.timeLine = [aDecoder decodeObjectForKey:kcommentsDataTimeLine];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_hot forKey:kcommentsDataHot];
    [aCoder encodeObject:_timeLine forKey:kcommentsDataTimeLine];
}

- (id)copyWithZone:(NSZone *)zone
{
    commentsData *copy = [[commentsData alloc] init];
    
    if (copy) {

        copy.hot = [self.hot copyWithZone:zone];
        copy.timeLine = [self.timeLine copyWithZone:zone];
    }
    
    return copy;
}


@end
