//
//  commentsReply.h
//
//  Created by   on 2017/6/14
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface commentsReply : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *replyIdentifier;
@property (nonatomic, strong) NSString *userPraise;
@property (nonatomic, strong) NSString *updateTime;
@property (nonatomic, strong) NSString *addTime;
@property (nonatomic, strong) NSString *parentId;
@property (nonatomic, strong) NSString *floorNum;
@property (nonatomic, strong) NSString *userId;
@property (nonatomic, strong) NSArray *img;
@property (nonatomic, strong) NSArray *reply;
@property (nonatomic, strong) NSString *avatar;
@property (nonatomic, strong) NSString *nickname;
@property (nonatomic, strong) NSString *objId;
@property (nonatomic, strong) NSString *praiseNum;
@property (nonatomic, strong) NSString *content;

@property (nonatomic, assign) BOOL commentUp; //是否展开收起

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
