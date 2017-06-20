//
//  commentsTimeLine.h
//
//  Created by   on 2017/6/14
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface commentsTimeLine : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *isPraise;
@property (nonatomic, strong) NSString *timeLineIdentifier;
@property (nonatomic, strong) NSString *userPraise;
@property (nonatomic, strong) NSString *updateTime;
@property (nonatomic, strong) NSString *parentId;
@property (nonatomic, strong) NSString *addTime;
@property (nonatomic, strong) NSString *floorNum;
@property (nonatomic, strong) NSString *userId;
@property (nonatomic, strong) NSArray *img;
@property (nonatomic, strong) NSArray *reply;
@property (nonatomic, strong) NSString *avatar;
@property (nonatomic, strong) NSString *nickname;
@property (nonatomic, strong) NSString *objId;
@property (nonatomic, strong) NSString *praiseNum;
@property (nonatomic, strong) NSString *content;

@property (nonatomic, assign) BOOL commentUp;

@property (nonatomic, assign) BOOL floorUp;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
