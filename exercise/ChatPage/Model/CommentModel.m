//
//  CommentModel.m
//  exercise
//
//  Created by 哲 on 16/11/24.
//  Copyright © 2016年 XSZ. All rights reserved.
//

#import "CommentModel.h"

@implementation CommentModel
-(instancetype)initWithDic:(NSDictionary *)dic{
    self = [super init];
    if (self) {
        self.commentId          = dic[@"commentId"];
        self.commentUserId      = dic[@"commentUserId"];
        self.commentUserName    = dic[@"commentUserName"];
        self.commentPhoto       = dic[@"commentPhoto"];
        self.commentText        = dic[@"commentText"];
        self.commentByUserId    = dic[@"commentByUserId"];
        self.commentByUserName  = dic[@"commentByUserName"];
        self.commentByPhoto     = dic[@"commentByPhoto"];
        self.createDateStr      = dic[@"createDateStr"];
        self.checkStatus        = dic[@"checkStatus"];
    }
    return self;
}

- (NSMutableArray *)commentModelArray {
    if (_commentModelArray == nil) {
        _commentModelArray = [[NSMutableArray alloc] init];
    }
    return _commentModelArray;
}


-(NSMutableArray *)messageBigPics{
    if (_messageBigPicArray==nil) {
        _messageBigPicArray = [NSMutableArray array];
    }
    return _messageBigPicArray;
}

@end
