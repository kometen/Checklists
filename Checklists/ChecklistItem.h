//
//  ChecklistItem.h
//  Checklists
//
//  Created by Claus Guttesen on 17/06/13.
//  Copyright (c) 2013 Claus Guttesen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ChecklistItem : NSObject

@property (nonatomic, copy) NSString *text;
@property (nonatomic, assign) BOOL checked;

-(void)toggleChecked;

@end
