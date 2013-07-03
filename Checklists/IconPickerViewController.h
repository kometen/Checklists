//
//  IconPickerViewController.h
//  Checklists
//
//  Created by Claus Guttesen on 03/07/13.
//  Copyright (c) 2013 Claus Guttesen. All rights reserved.
//

#import <UIKit/UIKit.h>

@class IconPickerViewController;

@protocol IconPickerViewControllerDelegate <NSObject>

-(void)iconPicker:(IconPickerViewController *)picker didPickIcon:(NSString *)theIconName;

@end

@interface IconPickerViewController : UITableViewController

@property (nonatomic, weak) id <IconPickerViewControllerDelegate> delegate;

@end
