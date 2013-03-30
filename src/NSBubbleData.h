//
//  NSBubbleData.h
//
//  Created by Alex Barinov
//  Project home page: http://alexbarinov.github.com/UIBubbleTableView/
//
//  This work is licensed under the Creative Commons Attribution-ShareAlike 3.0 Unported License.
//  To view a copy of this license, visit http://creativecommons.org/licenses/by-sa/3.0/
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, NSBubbleType) {
    BubbleTypeMine = 0,
    BubbleTypeSomeoneElse = 1
};

@interface NSBubbleData : NSObject

@property (readonly, nonatomic, strong) NSDate *date;
@property (readonly, nonatomic) NSBubbleType type;
@property (readonly, nonatomic, strong) UIView *view;
@property (readonly, nonatomic, strong) UIView *usernameView;
@property (readonly, nonatomic) UIEdgeInsets insets;

- (id)initWithUsername:(NSString *)username text:(NSString *)text date:(NSDate *)date type:(NSBubbleType)type;
+ (id)dataWithUsername:(NSString *)username text:(NSString *)text date:(NSDate *)date type:(NSBubbleType)type;
//- (id)initWithUsername:(NSString *)username image:(UIImage *)image date:(NSDate *)date type:(NSBubbleType)type;
//+ (id)dataWithUsername:(NSString *)username image:(UIImage *)image date:(NSDate *)date type:(NSBubbleType)type;

- (id)initWithText:(NSString *)text date:(NSDate *)date type:(NSBubbleType)type;
+ (id)dataWithText:(NSString *)text date:(NSDate *)date type:(NSBubbleType)type;
- (id)initWithImage:(UIImage *)image date:(NSDate *)date type:(NSBubbleType)type;
+ (id)dataWithImage:(UIImage *)image date:(NSDate *)date type:(NSBubbleType)type;

- (id)initWithUsernameView:(UIView *)usernameView view:(UIView *)view date:(NSDate *)date type:(NSBubbleType)type insets:(UIEdgeInsets)insets;
+ (id)dataWithUsernameView:(UIView *)usernameView view:(UIView *)view date:(NSDate *)date type:(NSBubbleType)type insets:(UIEdgeInsets)insets;

- (id)initWithView:(UIView *)view date:(NSDate *)date type:(NSBubbleType)type insets:(UIEdgeInsets)insets;
+ (id)dataWithView:(UIView *)view date:(NSDate *)date type:(NSBubbleType)type insets:(UIEdgeInsets)insets;

@end
