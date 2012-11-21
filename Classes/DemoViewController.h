//
//  DemoViewController.h
//  DemonstrationApp
//
//  Created by Chris on 11/18/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ListObject.h"
@interface DemoViewController : UIViewController 
    <UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate> {
    
    NSMutableArray *listData;
    IBOutlet UITextField *inputField;
    IBOutlet UITableView *listView;
}


@property (nonatomic, retain) IBOutlet UITextField *inputField;
@property (nonatomic, retain) IBOutlet UITableView *listView;
@property (nonatomic, retain) NSMutableArray *listData;

- (IBAction) add_pressed;
@end
