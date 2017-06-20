//
//  commentsBaseClass.h
//
//  Created by   on 2017/6/14
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class commentsData;

@interface commentsBaseClass : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *code;
@property (nonatomic, strong) NSString *message;
@property (nonatomic, strong) commentsData *data;
@property (nonatomic, strong) NSString *serverTime;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
