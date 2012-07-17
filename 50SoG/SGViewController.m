//
//  SGViewController.m
//  50SoG
//
//  Created by Alexander v. Below on 17.07.12.
//  Copyright (c) 2012 AVB Software. 
/*  
    Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the “Software”), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
    The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 */

#import "SGViewController.h"
#import "SG50View.h"

@interface SGViewController ()

@end

@implementation SGViewController

- (void) loadView {
    UIView *shadesView = [[SG50View alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
    shadesView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.view = shadesView;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

@end
