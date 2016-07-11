//
//  NSString+SiZheString.m
//  exercise
//
//  Created by 哲 on 16/7/8.
//  Copyright © 2016年 XSZ. All rights reserved.
//

#import "NSString+SiZheString.h"

@implementation NSString (SiZheString)
//获取字符串高度
-(CGFloat)getStringHighInputWidth:(NSInteger)number fontSize:(NSInteger)sizeFont
{
    //    第一个参数:宽度，高度，高度一般越大越好
    //    第二个参数：计算的类型
    //    第三个参数：字体的大小（label字体设置和这个参数一定同意）
    //    第四个参数：nil;
    CGRect rect =[self boundingRectWithSize:CGSizeMake(number, 3000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:sizeFont]} context:nil];
    return rect.size.height;
}
//获取字符串宽度
-(CGFloat)getStringWidthFontSize:(NSInteger)sizeFont
{
    if ([[[UIDevice currentDevice] systemVersion] doubleValue] <= 7.0) {
        CGSize size = [self sizeWithFont:[UIFont boldSystemFontOfSize:sizeFont] constrainedToSize:CGSizeMake(MAXFLOAT, 14) lineBreakMode:NSLineBreakByWordWrapping];
        return size.width;
    }else {
        CGRect rect = [self boundingRectWithSize:CGSizeMake(MAXFLOAT, 14) options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:sizeFont]} context:nil];
        return rect.size.width + 10;
    }
}
//获取标签字符串
-(NSAttributedString *)getTagString
{
    NSAttributedString * tagStr = [[NSAttributedString alloc] initWithData:[self dataUsingEncoding:NSUnicodeStringEncoding] options:@{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType} documentAttributes:nil error:nil];
    return tagStr;
}
//去除标签字符串中的标签
-(NSString *)removeTagOfHTML
{
    NSString *tagString = self;
    NSScanner * scanner = [NSScanner scannerWithString:tagString];
    NSString * text = nil;
    while([scanner isAtEnd]==NO)
    {
        //找到标签的起始位置
        [scanner scanUpToString:@"<" intoString:nil];
        //找到标签的结束位置
        [scanner scanUpToString:@">" intoString:&text];
        //替换字符
        tagString = [tagString stringByReplacingOccurrencesOfString:[NSString stringWithFormat:@"%@>",text] withString:@""];
    }
    return tagString;
}
//NSData转化成字符串
-(NSData *)getDataWithString
{
    NSData* dataString = [self dataUsingEncoding:NSUTF8StringEncoding];
    return dataString;
}
//显示不同颜色的标签文字
-(NSMutableAttributedString*)getDifferentColorString:(NSString *)resultString sizeFontNumber:(NSInteger)fontSize color:(UIColor *)color
{
    // 设置标签文字
    NSMutableAttributedString *attrituteString = [[NSMutableAttributedString alloc] initWithString:resultString];
    // 获取标红的位置和长度
    NSRange range = [resultString rangeOfString:self];
    // 设置标签文字的属性
    [attrituteString setAttributes:@{NSForegroundColorAttributeName :color,   NSFontAttributeName : [UIFont systemFontOfSize:fontSize]} range:range];
//    返回渲染不同颜色的字符串
    return attrituteString;
}
//去掉特殊字符
-(NSString *)getDisposeString
{
    NSCharacterSet *setString = [NSCharacterSet characterSetWithCharactersInString:@"@／：；（）¥「」＂、[]{}#%-*+=_\\|~＜＞$?^?'@#$%^&*()_+'\""];
    　NSString *disposeString = [[NSString stringWithFormat:@"%@",self] stringByTrimmingCharactersInSet:setString];
    return disposeString;
}
//进行邮箱正则表达式判断
-(BOOL) validateEmail
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:self];
}
//效验手机号的正则表达式
- (NSTextCheckingResult *)checkCellPhoneNum
{
    NSString *patternCellphone =  @"^((13[0-9])|(14[0-9])|(15[0-9])|(17[0-9])|(18[0-9]))\\d{8}$";
    NSRegularExpression *regexCellphone = [NSRegularExpression regularExpressionWithPattern:patternCellphone options:0 error:nil];
    
    NSTextCheckingResult *isMatchCellphone = [regexCellphone firstMatchInString:self options:0
        range:NSMakeRange(0, [self length])];
    return isMatchCellphone;
}
//图片防止渲染
-(UIImage *)getImageTheRenderingString{
    UIImage *imageRendering =[UIImage imageNamed:self];
    imageRendering =[imageRendering imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    return imageRendering;
}

@end
