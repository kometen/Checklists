//
//  ChecklistItem.m
//  Checklists
//
//  Created by Claus Guttesen on 17/06/13.
//  Copyright (c) 2013 Claus Guttesen. All rights reserved.
//

#import "ChecklistItem.h"

@implementation ChecklistItem

-(void)toggleChecked {
    self.checked = !self.checked;
}

@end
