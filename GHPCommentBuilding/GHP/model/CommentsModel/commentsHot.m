//
//  commentsHot.m
//
//  Created by   on 2017/6/14
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "commentsHot.h"
#import "commentsReply.h"


NSString *const kcommentsHotIsPraise = @"is_praise";
NSString *const kcommentsHotId = @"id";
NSString *const kcommentsHotUserPraise = @"user_praise";
NSString *const kcommentsHotUpdateTime = @"update_time";
NSString *const kcommentsHotParentId = @"parent_id";
NSString *const kcommentsHotAddTime = @"add_time";
NSString *const kcommentsHotFloorNum = @"floor_num";
NSString *const kcommentsHotUserId = @"user_id";
NSString *const kcommentsHotImg = @"img";
NSString *const kcommentsHotReply = @"reply";
NSString *const kcommentsHotAvatar = @"avatar";
NSString *const kcommentsHotNickname = @"nickname";
NSString *const kcommentsHotObjId = @"obj_id";
NSString *const kcommentsHotPraiseNum = @"praise_num";
NSString *const kcommentsHotContent = @"content";


@interface commentsHot ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation commentsHot

@synthesize isPraise = _isPraise;
@synthesize hotIdentifier = _hotIdentifier;
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
            self.isPraise = [self objectOrNilForKey:kcommentsHotIsPraise fromDictionary:dict];
            self.hotIdentifier = [self objectOrNilForKey:kcommentsHotId fromDictionary:dict];
            self.userPraise = [self objectOrNilForKey:kcommentsHotUserPraise fromDictionary:dict];
            self.updateTime = [self objectOrNilForKey:kcommentsHotUpdateTime fromDictionary:dict];
            self.parentId = [self objectOrNilForKey:kcommentsHotParentId fromDictionary:dict];
            self.addTime = [self objectOrNilForKey:kcommentsHotAddTime fromDictionary:dict];
            self.floorNum = [self objectOrNilForKey:kcommentsHotFloorNum fromDictionary:dict];
            self.userId = [self objectOrNilForKey:kcommentsHotUserId fromDictionary:dict];
            self.img = [self objectOrNilForKey:kcommentsHotImg fromDictionary:dict];
    NSObject *receivedcommentsReply = [dict objectForKey:kcommentsHotReply];
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
            self.avatar = [self objectOrNilForKey:kcommentsHotAvatar fromDictionary:dict];
            self.nickname = [self objectOrNilForKey:kcommentsHotNickname fromDictionary:dict];
            self.objId = [self objectOrNilForKey:kcommentsHotObjId fromDictionary:dict];
            self.praiseNum = [self objectOrNilForKey:kcommentsHotPraiseNum fromDictionary:dict];
            self.content = [self objectOrNilForKey:kcommentsHotContent fromDictionary:dict];
        self.commentUp = NO;
        self.floorUp = NO;

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.isPraise forKey:kcommentsHotIsPraise];
    [mutableDict setValue:self.hotIdentifier forKey:kcommentsHotId];
    [mutableDict setValue:self.userPraise forKey:kcommentsHotUserPraise];
    [mutableDict setValue:self.updateTime forKey:kcommentsHotUpdateTime];
    [mutableDict setValue:self.parentId forKey:kcommentsHotParentId];
    [mutableDict setValue:self.addTime forKey:kcommentsHotAddTime];
    [mutableDict setValue:self.floorNum forKey:kcommentsHotFloorNum];
    [mutableDict setValue:self.userId forKey:kcommentsHotUserId];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForImg] forKey:kcommentsHotImg];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForReply] forKey:kcommentsHotReply];
    [mutableDict setValue:self.avatar forKey:kcommentsHotAvatar];
    [mutableDict setValue:self.nickname forKey:kcommentsHotNickname];
    [mutableDict setValue:self.objId forKey:kcommentsHotObjId];
    [mutableDict setValue:self.praiseNum forKey:kcommentsHotPraiseNum];
    [mutableDict setValue:self.content forKey:kcommentsHotContent];

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

    self.isPraise = [aDecoder decodeObjectForKey:kcommentsHotIsPraise];
    self.hotIdentifier = [aDecoder decodeObjectForKey:kcommentsHotId];
    self.userPraise = [aDecoder decodeObjectForKey:kcommentsHotUserPraise];
    self.updateTime = [aDecoder decodeObjectForKey:kcommentsHotUpdateTime];
    self.parentId = [aDecoder decodeObjectForKey:kcommentsHotParentId];
    self.addTime = [aDecoder decodeObjectForKey:kcommentsHotAddTime];
    self.floorNum = [aDecoder decodeObjectForKey:kcommentsHotFloorNum];
    self.userId = [aDecoder decodeObjectForKey:kcommentsHotUserId];
    self.img = [aDecoder decodeObjectForKey:kcommentsHotImg];
    self.reply = [aDecoder decodeObjectForKey:kcommentsHotReply];
    self.avatar = [aDecoder decodeObjectForKey:kcommentsHotAvatar];
    self.nickname = [aDecoder decodeObjectForKey:kcommentsHotNickname];
    self.objId = [aDecoder decodeObjectForKey:kcommentsHotObjId];
    self.praiseNum = [aDecoder decodeObjectForKey:kcommentsHotPraiseNum];
    self.content = [aDecoder decodeObjectForKey:kcommentsHotContent];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_isPraise forKey:kcommentsHotIsPraise];
    [aCoder encodeObject:_hotIdentifier forKey:kcommentsHotId];
    [aCoder encodeObject:_userPraise forKey:kcommentsHotUserPraise];
    [aCoder encodeObject:_updateTime forKey:kcommentsHotUpdateTime];
    [aCoder encodeObject:_parentId forKey:kcommentsHotParentId];
    [aCoder encodeObject:_addTime forKey:kcommentsHotAddTime];
    [aCoder encodeObject:_floorNum forKey:kcommentsHotFloorNum];
    [aCoder encodeObject:_userId forKey:kcommentsHotUserId];
    [aCoder encodeObject:_img forKey:kcommentsHotImg];
    [aCoder encodeObject:_reply forKey:kcommentsHotReply];
    [aCoder encodeObject:_avatar forKey:kcommentsHotAvatar];
    [aCoder encodeObject:_nickname forKey:kcommentsHotNickname];
    [aCoder encodeObject:_objId forKey:kcommentsHotObjId];
    [aCoder encodeObject:_praiseNum forKey:kcommentsHotPraiseNum];
    [aCoder encodeObject:_content forKey:kcommentsHotContent];
}

- (id)copyWithZone:(NSZone *)zone
{
    commentsHot *copy = [[commentsHot alloc] init];
    
    if (copy) {

        copy.isPraise = [self.isPraise copyWithZone:zone];
        copy.hotIdentifier = [self.hotIdentifier copyWithZone:zone];
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
