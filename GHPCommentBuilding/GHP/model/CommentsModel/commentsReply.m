//
//  commentsReply.m
//
//  Created by   on 2017/6/14
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "commentsReply.h"


NSString *const kcommentsReplyId = @"id";
NSString *const kcommentsReplyUserPraise = @"user_praise";
NSString *const kcommentsReplyUpdateTime = @"update_time";
NSString *const kcommentsReplyAddTime = @"add_time";
NSString *const kcommentsReplyParentId = @"parent_id";
NSString *const kcommentsReplyFloorNum = @"floor_num";
NSString *const kcommentsReplyUserId = @"user_id";
NSString *const kcommentsReplyImg = @"img";
NSString *const kcommentsReplyReply = @"reply";
NSString *const kcommentsReplyAvatar = @"avatar";
NSString *const kcommentsReplyNickname = @"nickname";
NSString *const kcommentsReplyObjId = @"obj_id";
NSString *const kcommentsReplyPraiseNum = @"praise_num";
NSString *const kcommentsReplyContent = @"content";


@interface commentsReply ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation commentsReply

@synthesize replyIdentifier = _replyIdentifier;
@synthesize userPraise = _userPraise;
@synthesize updateTime = _updateTime;
@synthesize addTime = _addTime;
@synthesize parentId = _parentId;
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
            self.replyIdentifier = [self objectOrNilForKey:kcommentsReplyId fromDictionary:dict];
            self.userPraise = [self objectOrNilForKey:kcommentsReplyUserPraise fromDictionary:dict];
            self.updateTime = [self objectOrNilForKey:kcommentsReplyUpdateTime fromDictionary:dict];
            self.addTime = [self objectOrNilForKey:kcommentsReplyAddTime fromDictionary:dict];
            self.parentId = [self objectOrNilForKey:kcommentsReplyParentId fromDictionary:dict];
            self.floorNum = [self objectOrNilForKey:kcommentsReplyFloorNum fromDictionary:dict];
            self.userId = [self objectOrNilForKey:kcommentsReplyUserId fromDictionary:dict];
            self.img = [self objectOrNilForKey:kcommentsReplyImg fromDictionary:dict];
            self.reply = [self objectOrNilForKey:kcommentsReplyReply fromDictionary:dict];
            self.avatar = [self objectOrNilForKey:kcommentsReplyAvatar fromDictionary:dict];
            self.nickname = [self objectOrNilForKey:kcommentsReplyNickname fromDictionary:dict];
            self.objId = [self objectOrNilForKey:kcommentsReplyObjId fromDictionary:dict];
            self.praiseNum = [self objectOrNilForKey:kcommentsReplyPraiseNum fromDictionary:dict];
            self.content = [self objectOrNilForKey:kcommentsReplyContent fromDictionary:dict];

        self.commentUp = NO;
    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.replyIdentifier forKey:kcommentsReplyId];
    [mutableDict setValue:self.userPraise forKey:kcommentsReplyUserPraise];
    [mutableDict setValue:self.updateTime forKey:kcommentsReplyUpdateTime];
    [mutableDict setValue:self.addTime forKey:kcommentsReplyAddTime];
    [mutableDict setValue:self.parentId forKey:kcommentsReplyParentId];
    [mutableDict setValue:self.floorNum forKey:kcommentsReplyFloorNum];
    [mutableDict setValue:self.userId forKey:kcommentsReplyUserId];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForImg] forKey:kcommentsReplyImg];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForReply] forKey:kcommentsReplyReply];
    [mutableDict setValue:self.avatar forKey:kcommentsReplyAvatar];
    [mutableDict setValue:self.nickname forKey:kcommentsReplyNickname];
    [mutableDict setValue:self.objId forKey:kcommentsReplyObjId];
    [mutableDict setValue:self.praiseNum forKey:kcommentsReplyPraiseNum];
    [mutableDict setValue:self.content forKey:kcommentsReplyContent];

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

    self.replyIdentifier = [aDecoder decodeObjectForKey:kcommentsReplyId];
    self.userPraise = [aDecoder decodeObjectForKey:kcommentsReplyUserPraise];
    self.updateTime = [aDecoder decodeObjectForKey:kcommentsReplyUpdateTime];
    self.addTime = [aDecoder decodeObjectForKey:kcommentsReplyAddTime];
    self.parentId = [aDecoder decodeObjectForKey:kcommentsReplyParentId];
    self.floorNum = [aDecoder decodeObjectForKey:kcommentsReplyFloorNum];
    self.userId = [aDecoder decodeObjectForKey:kcommentsReplyUserId];
    self.img = [aDecoder decodeObjectForKey:kcommentsReplyImg];
    self.reply = [aDecoder decodeObjectForKey:kcommentsReplyReply];
    self.avatar = [aDecoder decodeObjectForKey:kcommentsReplyAvatar];
    self.nickname = [aDecoder decodeObjectForKey:kcommentsReplyNickname];
    self.objId = [aDecoder decodeObjectForKey:kcommentsReplyObjId];
    self.praiseNum = [aDecoder decodeObjectForKey:kcommentsReplyPraiseNum];
    self.content = [aDecoder decodeObjectForKey:kcommentsReplyContent];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_replyIdentifier forKey:kcommentsReplyId];
    [aCoder encodeObject:_userPraise forKey:kcommentsReplyUserPraise];
    [aCoder encodeObject:_updateTime forKey:kcommentsReplyUpdateTime];
    [aCoder encodeObject:_addTime forKey:kcommentsReplyAddTime];
    [aCoder encodeObject:_parentId forKey:kcommentsReplyParentId];
    [aCoder encodeObject:_floorNum forKey:kcommentsReplyFloorNum];
    [aCoder encodeObject:_userId forKey:kcommentsReplyUserId];
    [aCoder encodeObject:_img forKey:kcommentsReplyImg];
    [aCoder encodeObject:_reply forKey:kcommentsReplyReply];
    [aCoder encodeObject:_avatar forKey:kcommentsReplyAvatar];
    [aCoder encodeObject:_nickname forKey:kcommentsReplyNickname];
    [aCoder encodeObject:_objId forKey:kcommentsReplyObjId];
    [aCoder encodeObject:_praiseNum forKey:kcommentsReplyPraiseNum];
    [aCoder encodeObject:_content forKey:kcommentsReplyContent];
}

- (id)copyWithZone:(NSZone *)zone
{
    commentsReply *copy = [[commentsReply alloc] init];
    
    if (copy) {

        copy.replyIdentifier = [self.replyIdentifier copyWithZone:zone];
        copy.userPraise = [self.userPraise copyWithZone:zone];
        copy.updateTime = [self.updateTime copyWithZone:zone];
        copy.addTime = [self.addTime copyWithZone:zone];
        copy.parentId = [self.parentId copyWithZone:zone];
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
