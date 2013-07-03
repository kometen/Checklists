//
//  DataModel.h
//  Checklists
//
//  Created by Claus Guttesen on 01/07/13.
//  Copyright (c) 2013 Claus Guttesen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Checklist.h"

@interface DataModel : NSObject

@property (nonatomic, strong) NSMutableArray *lists;

-(void)saveChecklists;
-(int)indexOfSelectedChecklist;
-(void)setIndexOfSelectedChecklist:(int)index;
-(void)sortChecklist;

@end
