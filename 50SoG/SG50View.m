//
//  SG50View.m
//  50SoG
//
//  Created by Alexander v. Below on 17.07.12.
//  Copyright (c) 2012 AVB Software.
/*  
 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the “Software”), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 */

#import "SG50View.h"

@implementation SG50View

- (void)drawRect:(CGRect)rect
{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGFloat fullWidth = self.bounds.size.width;
    CGFloat oneShadeWidth = fullWidth / 50.0;
    
    int shade;
    int firstShade = floor (rect.origin.x * 50.0 / fullWidth);
    int lastShade = floor (CGRectGetMaxX(rect) * 50.0 / fullWidth);
    for (shade = firstShade; shade <= lastShade; shade ++) 
    {
        CGFloat grey = 1.0 - shade / 49.0;
        UIColor *shadeOfGrey = [UIColor colorWithWhite:grey alpha:1.0];
        [shadeOfGrey set];
        CGContextAddRect(ctx, CGRectMake(shade*oneShadeWidth, rect.origin.y, oneShadeWidth + 2, rect.size.height));
        CGContextFillPath(ctx);
    }
}

@end
