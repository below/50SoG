//
//  InterfaceController.m
//  50SoG WatchKit Extension
//
//  Created by Alexander v. Below on 13.09.15.
//  Copyright © 2015 AVB Software. All rights reserved.
//

#import "InterfaceController.h"
#import <UIKit/UIKit.h>
#import "_0SoG_WatchKit_Extension-Swift.h"

@interface InterfaceController()
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceImage *image;
@end


@implementation InterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];

    CGRect screenBounds = [WKInterfaceDevice currentDevice].screenBounds;
    // 136;170, 156;195
    CGFloat screenScale = [WKInterfaceDevice currentDevice].screenScale;
    // 2
    UIGraphicsBeginImageContextWithOptions(screenBounds.size, YES, screenScale);
    
    [objcWrapper objcDrawShadesWithRect:screenBounds bounds:screenBounds];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    [self.image setImage:image];
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

@end



