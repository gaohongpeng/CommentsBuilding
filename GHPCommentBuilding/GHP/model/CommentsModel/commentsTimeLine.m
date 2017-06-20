//
//  commentsTimeLine.m
//
//  Created by   on 2017/6/14
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "commentsTimeLine.h"
#import "commentsReply.h"


NSString *const kcommentsTimeLineIsPraise = @"is_praise";
NSString *const kcommentsTimeLineId = @"id";
NSString *const kcommentsTimeLineUserPraise = @"user_praise";
NSString *const kcommentsTimeLineUpdateTime = @"update_time";
NSString *const kcommentsTimeLineParentId = @"parent_id";
NSString *const kcommentsTimeLineAddTime = @"add_time";
NSString *const kcommentsTimeLineFloorNum = @"floor_num";
NSString *const kcommentsTimeLineUserId = @"user_id";
NSString *const kcommentsTimeLineImg = @"img";
NSString *const kcommentsTimeLineReply = @"reply";
NSString *const kcommentsTimeLineAvatar = @"avatar";
NSString *const kcommentsTimeLineNickname = @"nickname";
NSString *const kcommentsTimeLineObjId = @"obj_id";
NSString *const kcommentsTimeLinePraiseNum = @"praise_num";
NSString *const kcommentsTimeLineContent = @"content";


@interface commentsTimeLine ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation commentsTimeLine

@synthesize isPraise = _isPraise;
@synthesize timeLineIdentifier = _timeLineIdentifier;
@synthesize userPraise = _userPraise;
@synthesize updateTime = _updateTime;
@synthesize parentId = _parentId;
@synthesize addTime = _addTime;
@synthesize floorNum = _floorNum;
@synthesize userId = _userId;
@synthesize img = _img;
@synthesize reply = _reply;
@synthesize avatar = _avatar;
@synthesize nickname = _nickname;
@synthesize objId = _objId;
@synthesize praiseNum = _praiseNum;
@synthesize content = _content;
@synthesize commentUp = _commentUp;
@synthesize floorUp = _floorUp;

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
            self.isPraise = [self objectOrNilForKey:kcommentsTimeLineIsPraise fromDictionary:dict];
            self.timeLineIdentifier = [self objectOrNilForKey:kcommentsTimeLineId fromDictionary:dict];
            self.userPraise = [self objectOrNilForKey:kcommentsTimeLineUserPraise fromDictionary:dict];
            self.updateTime = [self objectOrNilForKey:kcommentsTimeLineUpdateTime fromDictionary:dict];
            self.parentId = [self objectOrNilForKey:kcommentsTimeLineParentId fromDictionary:dict];
            self.addTime = [self objectOrNilForKey:kcommentsTimeLineAddTime fromDictionary:dict];
            self.floorNum = [self objectOrNilForKey:kcommentsTimeLineFloorNum fromDictionary:dict];
            self.userId = [self objectOrNilForKey:kcommentsTimeLineUserId fromDictionary:dict];
            self.img = [self objectOrNilForKey:kcommentsTimeLineImg fromDictionary:dict];
    NSObject *receivedcommentsReply = [dict objectForKey:kcommentsTimeLineReply];
    NSMutableArray *parsedcommentsReply = [NSMutableArray array];
    if ([receivedcommentsReply isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedcommentsReply) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedcommentsReply addObject:[commentsReply modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedcommentsReply isKindOfClass:[NSDictionary class]]) {
       [parsedcommentsReply addObject:[commentsReply modelObjectWithDictionary:(NSDictionary *)receivedcommentsReply]];
    }

    self.reply = [NSArray arrayWithArray:parsedcommentsReply];
            self.avatar = [self objectOrNilForKey:kcommentsTimeLineAvatar fromDictionary:dict];
            self.nickname = [self objectOrNilForKey:kcommentsTimeLineNickname fromDictionary:dict];
            self.objId = [self objectOrNilForKey:kcommentsTimeLineObjId fromDictionary:dict];
            self.praiseNum = [self objectOrNilForKey:kcommentsTimeLinePraiseNum fromDictionary:dict];
            self.content = [self objectOrNilForKey:kcommentsTimeLineContent fromDictionary:dict];
        self.commentUp = NO;
        self.floorUp = NO;
    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.isPraise forKey:kcommentsTimeLineIsPraise];
    [mutableDict setValue:self.timeLineIdentifier forKey:kcommentsTimeLineId];
    [mutableDict setValue:self.userPraise forKey:kcommentsTimeLineUserPraise];
    [mutableDict setValue:self.updateTime forKey:kcommentsTimeLineUpdateTime];
    [mutableDict setValue:self.parentId forKey:kcommentsTimeLineParentId];
    [mutableDict setValue:self.addTime forKey:kcommentsTimeLineAddTime];
    [mutableDict setValue:self.floorNum forKey:kcommentsTimeLineFloorNum];
    [mutableDict setValue:self.userId forKey:kcommentsTimeLineUserId];
    NSMutableArray *tempArrayForImg = [NSMutableArray array];
    for (NSObject *subArrayObject in self.img) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForImg addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForImg addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForImg] forKey:kcommentsTimeLineImg];
    NSMutableArray *tempArrayForReply = [NSMutableArray array];
    for (NSObject *subArrayObject in self.reply) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForReply addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForReply addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForReply] forKey:kcommentsTimeLineReply];
    [mutableDict setValue:self.avatar forKey:kcommentsTimeLineAvatar];
    [mutableDict setValue:self.nickname forKey:kcommentsTimeLineNickname];
    [mutableDict setValue:self.objId forKey:kcommentsTimeLineObjId];
    [mutableDict setValue:self.praiseNum forKey:kcommentsTimeLinePraiseNum];
    [mutableDict setValue:self.content forKey:kcommentsTimeLineContent];

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

    self.isPraise = [aDecoder decodeObjectForKey:kcommentsTimeLineIsPraise];
    self.timeLineIdentifier = [aDecoder decodeObjectForKey:kcommentsTimeLineId];
    self.userPraise = [aDecoder decodeObjectForKey:kcommentsTimeLineUserPraise];
    self.updateTime = [aDecoder decodeObjectForKey:kcommentsTimeLineUpdateTime];
    self.parentId = [aDecoder decodeObjectForKey:kcommentsTimeLineParentId];
    self.addTime = [aDecoder decodeObjectForKey:kcommentsTimeLineAddTime];
    self.floorNum = [aDecoder decodeObjectForKey:kcommentsTimeLineFloorNum];
    self.userId = [aDecoder decodeObjectForKey:kcommentsTimeLineUserId];
    self.img = [aDecoder decodeObjectForKey:kcommentsTimeLineImg];
    self.reply = [aDecoder decodeObjectForKey:kcommentsTimeLineReply];
    self.avatar = [aDecoder decodeObjectForKey:kcommentsTimeLineAvatar];
    self.nickname = [aDecoder decodeObjectForKey:kcommentsTimeLineNickname];
    self.objId = [aDecoder decodeObjectForKey:kcommentsTimeLineObjId];
    self.praiseNum = [aDecoder decodeObjectForKey:kcommentsTimeLinePraiseNum];
    self.content = [aDecoder decodeObjectForKey:kcommentsTimeLineContent];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_isPraise forKey:kcommentsTimeLineIsPraise];
    [aCoder encodeObject:_timeLineIdentifier forKey:kcommentsTimeLineId];
    [aCoder encodeObject:_userPraise forKey:kcommentsTimeLineUserPraise];
    [aCoder encodeObject:_updateTime forKey:kcommentsTimeLineUpdateTime];
    [aCoder encodeObject:_parentId forKey:kcommentsTimeLineParentId];
    [aCoder encodeObject:_addTime forKey:kcommentsTimeLineAddTime];
    [aCoder encodeObject:_floorNum forKey:kcommentsTimeLineFloorNum];
    [aCoder encodeObject:_userId forKey:kcommentsTimeLineUserId];
    [aCoder encodeObject:_img forKey:kcommentsTimeLineImg];
    [aCoder encodeObject:_reply forKey:kcommentsTimeLineReply];
    [aCoder encodeObject:_avatar forKey:kcommentsTimeLineAvatar];
    [aCoder encodeObject:_nickname forKey:kcommentsTimeLineNickname];
    [aCoder encodeObject:_objId forKey:kcommentsTimeLineObjId];
    [aCoder encodeObject:_praiseNum forKey:kcommentsTimeLinePraiseNum];
    [aCoder encodeObject:_content forKey:kcommentsTimeLineContent];
}

- (id)copyWithZone:(NSZone *)zone
{
    commentsTimeLine *copy = [[commentsTimeLine alloc] init];
    
    if (copy) {

        copy.isPraise = [self.isPraise copyWithZone:zone];
        copy.timeLineIdentifier = [self.timeLineIdentifier copyWithZone:zone];
        copy.userPraise = [self.userPraise copyWithZone:zone];
        copy.updateTime = [self.updateTime copyWithZone:zone];
        copy.parentId = [self.parentId copyWithZone:zone];
        copy.addTime = [self.addTime copyWithZone:zone];
        copy.floorNum = [self.floorNum copyWithZone:zone];
        copy.userId = [self.userId copyWithZone:zone];
        copy.img = [self.img copyWithZone:zone];
        copy.reply = [self.reply copyWithZone:zone];
        copy.avatar = [self.avatar copyWithZone:zone];
        copy.nickname = [self.nickname copyWithZone:zone];
        copy.objId = [self.objId copyWithZone:zone];
        copy.praiseNum = [self.praiseNum copyWithZone:zone];
        copy.content = [self.content copyWithZone:zone];
    }
    
    return copy;
}


@end
