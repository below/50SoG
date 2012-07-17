//
//  SGAppDelegate.h
//  50SoG
//
//  Created by Alexander v. Below on 17.07.12.
//  Copyright (c) 2012 AVB Software. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SGViewController;

@interface SGAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) SGViewController *viewController;

@end
