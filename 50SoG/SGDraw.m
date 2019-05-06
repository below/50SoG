//
//  SGDraw.m
//  50SoG
//
//  Created by Alexander v. Below on 15.09.15.
//  Copyright © 2015 AVB Software. All rights reserved.
//

#import "SGDraw.h"
#if TARGET_OS_IPHONE
#import <UIKit/UIKit.h>
#define OSColor UIColor
#else
#import <AppKit/AppKit.h>
#define OSColor NSColor
#endif

void drawShades(CGRect rect, CGRect bounds)
{
    CGContextRef ctx;
#if TARGET_OS_IPHONE
    ctx = UIGraphicsGetCurrentContext();
#else
    ctx = [NSGraphicsContext currentContext].CGContext;
#endif
    CGFloat fullWidth = bounds.size.width;
    CGFloat oneShadeWidth = fullWidth / 50.0;
    
    int shade;
    int firstShade = floor (rect.origin.x * 50.0 / fullWidth);
    int lastShade = floor (CGRectGetMaxX(rect) * 50.0 / fullWidth);
    for (shade = firstShade; shade <= lastShade; shade ++)
    {
        CGFloat grey = 1.0 - shade / 49.0;
        OSColor *shadeOfGrey = [OSColor colorWithWhite:grey alpha:1.0];
        [shadeOfGrey set];
        CGContextAddRect(ctx, CGRectMake(shade*oneShadeWidth, rect.origin.y, oneShadeWidth + 2, rect.size.height));
        CGContextFillPath(ctx);
    }
}
