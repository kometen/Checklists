//
//  AddItemViewController.h
//  Checklists
//
//  Created by Claus Guttesen on 20/06/13.
//  Copyright (c) 2013 Claus Guttesen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddItemViewController : UITableViewController <UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UITextField *textField;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *doneBarButton;

-(IBAction)cancel;
-(IBAction)done;

@end
