//
//  ChecklistsViewController.h
//  Checklists
//
//  Created by Claus Guttesen on 15/06/13.
//  Copyright (c) 2013 Claus Guttesen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ItemDetailViewController.h"

@class Checklist;

@interface ChecklistViewController : UITableViewController <ItemDetailViewControllerDelegate>


@property (nonatomic, strong) Checklist *checklist;
@end
