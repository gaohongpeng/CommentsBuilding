//
//  commentsData.h
//
//  Created by   on 2017/6/14
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface commentsData : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSArray *hot;
@property (nonatomic, strong) NSArray *timeLine;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
