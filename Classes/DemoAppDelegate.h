//
//  DemoAppDelegate.h
//  DemonstrationApp
//
//  Created by Chris on 11/18/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SimpleDemoViewController;

@interface DemoAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) SimpleDemoViewController *simpleDemoView;

@end
