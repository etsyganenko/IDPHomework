//
//  TSYTableViewController.h
//  TSYHomeworkUI
//
//  Created by Admin on 17.06.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TSYTableViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>
- (IBAction)onButtonAdd:(id)sender;
- (IBAction)onButtonRemove:(id)sender;
- (IBAction)onButtonMove:(id)sender;

@end
