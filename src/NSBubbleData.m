//
//  NSBubbleData.m
//
//  Created by Alex Barinov
//  Project home page: http://alexbarinov.github.com/UIBubbleTableView/
//
//  This work is licensed under the Creative Commons Attribution-ShareAlike 3.0 Unported License.
//  To view a copy of this license, visit http://creativecommons.org/licenses/by-sa/3.0/
//

#import "NSBubbleData.h"
#import <QuartzCore/QuartzCore.h>

@implementation NSBubbleData

#pragma mark - Properties

@synthesize date = _date;
@synthesize type = _type;
@synthesize view = _view;
@synthesize insets = _insets;

#pragma mark - Lifecycle

#if !__has_feature(objc_arc)
- (void)dealloc
{
    [_date release];
    _date = nil;
    [_view release];
    _view = nil;

    [super dealloc];
}
#endif

#pragma mark - Text bubble

const UIEdgeInsets textInsetsMine = {5, 10, 11, 17};
const UIEdgeInsets textInsetsSomeone = {5, 15, 11, 10};

+ (id)dataWithUsername:(NSString *)username text:(NSString *)text date:(NSDate *)date type:(NSBubbleType)type
{
#if !__has_feature(objc_arc)
    return [[[NSBubbleData alloc] initWithUsername:username text:text date:date type:type] autorelease];
#else
    return [[NSBubbleData alloc] initWithUsername:username text:text date:date type:type];
#endif
}

+ (id)dataWithText:(NSString *)text date:(NSDate *)date type:(NSBubbleType)type
{
#if !__has_feature(objc_arc)
    return [[[NSBubbleData alloc] initWithUsername:nil text:text date:date type:type] autorelease];
#else
    return [[NSBubbleData alloc] initWithUsername:nil text:text date:date type:type];
#endif
}

- (id)initWithUsername:(NSString *)username text:(NSString *)text date:(NSDate *)date type:(NSBubbleType)type
{
    UIFont *font = [UIFont systemFontOfSize:[UIFont systemFontSize]];
    UIFont *usernameFont = [UIFont systemFontOfSize:14.0];
    CGSize size = [(text ? text : @"") sizeWithFont:font constrainedToSize:CGSizeMake(220, 9999) lineBreakMode:NSLineBreakByWordWrapping];

    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, size.width, size.height)];
    label.numberOfLines = 0;
    label.lineBreakMode = NSLineBreakByWordWrapping;
    label.text = (text ? text : @"");
    label.font = font;
    label.backgroundColor = [UIColor clearColor];

    UILabel *usernameLabel = nil;
    if (username) {
        usernameLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 300, 20)];
        usernameLabel.textAlignment = (type == BubbleTypeMine) ? UITextAlignmentRight : UITextAlignmentLeft;
        usernameLabel.text = username;
        usernameLabel.textColor = [UIColor colorWithRed:0.157 green:0.306 blue:0.592 alpha:1.000];
        usernameLabel.font = usernameFont;
        usernameLabel.backgroundColor = [UIColor clearColor];
    }

#if !__has_feature(objc_arc)
    [label autorelease];
#endif

    UIEdgeInsets insets = (type == BubbleTypeMine ? textInsetsMine : textInsetsSomeone);
    return [self initWithUsernameView:usernameLabel view:label date:date type:type insets:insets];
}

#pragma mark - Image bubble

const UIEdgeInsets imageInsetsMine = {11, 13, 16, 22};
const UIEdgeInsets imageInsetsSomeone = {11, 18, 16, 14};

+ (id)dataWithImage:(UIImage *)image date:(NSDate *)date type:(NSBubbleType)type
{
#if !__has_feature(objc_arc)
    return [[[NSBubbleData alloc] initWithImage:image date:date type:type] autorelease];
#else
    return [[NSBubbleData alloc] initWithImage:image date:date type:type];
#endif
}

- (id)initWithImage:(UIImage *)image date:(NSDate *)date type:(NSBubbleType)type
{
    CGSize size = image.size;
    if (size.width > 220)
    {
        size.height /= (size.width / 220);
        size.width = 220;
    }

    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, size.width, size.height)];
    imageView.image = image;
    imageView.layer.cornerRadius = 5.0;
    imageView.layer.masksToBounds = YES;


#if !__has_feature(objc_arc)
    [imageView autorelease];
#endif

    UIEdgeInsets insets = (type == BubbleTypeMine ? imageInsetsMine : imageInsetsSomeone);
    return [self initWithView:imageView date:date type:type insets:insets];
}

#pragma mark - Custom view bubble

+ (id)dataWithView:(UIView *)view date:(NSDate *)date type:(NSBubbleType)type insets:(UIEdgeInsets)insets
{
#if !__has_feature(objc_arc)
    return [[[NSBubbleData alloc] initWithView:view date:date type:type insets:insets] autorelease];
#else
    return [[NSBubbleData alloc] initWithView:view date:date type:type insets:insets];
#endif
}

- (id)initWithView:(UIView *)view date:(NSDate *)date type:(NSBubbleType)type insets:(UIEdgeInsets)insets
{
    return [self initWithUsernameView:nil view:view date:date type:type insets:insets];
}

- (id)initWithUsernameView:(UIView *)usernameView view:(UIView *)view date:(NSDate *)date type:(NSBubbleType)type insets:(UIEdgeInsets)insets
{
    self = [super init];
    if (self)
    {
#if !__has_feature(objc_arc)
        _usernameView = usernameView ? [usernameView retain] : nil;
        _view = [view retain];
        _date = [date retain];
#else
        _usernameVew = usernameView;
        _view = view;
        _date = date;
#endif
        _type = type;
        _insets = insets;
    }
    return self;
}

@end