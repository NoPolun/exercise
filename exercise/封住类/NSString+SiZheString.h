//
//  NSString+SiZheString.h
//  exercise
//
//  Created by 哲 on 16/7/8.
//  Copyright © 2016年 XSZ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (SiZheString)
//获取字符串高度
-(CGFloat)getStringHighInputWidth:(NSInteger)number fontSize:(NSInteger)sizeFont;
//获取字符串宽度
-(CGFloat)getStringWidthFontSize:(NSInteger)sizeFont;
//获取标签字符串
-(NSAttributedString *)getTagString;
//去除标签字符串中的标签
-(NSString *)removeTagOfHTML;
//字符串转化成NSData
-(NSData *)getDataWithString;
//显示不同颜色的标签文字
-(NSMutableAttributedString*)getDifferentColorString:(NSString *)resultString sizeFontNumber:(NSInteger)fontSize color:(UIColor *)color;
//去掉特殊字符
-(NSString *)getDisposeString;
//进行邮箱正则表达式判断
-(BOOL)validateEmail;
//效验手机号的正则表达式
- (NSTextCheckingResult *)checkCellPhoneNum;
//图片防止渲染
-(UIImage *)getImageTheRenderingString;
//复制文字
-(void)getStringCopy;
@end
