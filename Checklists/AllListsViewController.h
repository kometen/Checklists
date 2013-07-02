//
//  AllListsViewController.h
//  Checklists
//
//  Created by Claus Guttesen on 28/06/13.
//  Copyright (c) 2013 Claus Guttesen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ListDetailViewController.h"
#import "DataModel.h"

@interface AllListsViewController : UITableViewController <ListDetalViewControllerDelegate, UINavigationControllerDelegate>

@property (nonatomic, strong) DataModel *dataModel;

@end
