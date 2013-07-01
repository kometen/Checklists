//
//  DataModel.h
//  Checklists
//
//  Created by Claus Guttesen on 01/07/13.
//  Copyright (c) 2013 Claus Guttesen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataModel : NSObject

@property (nonatomic, strong) NSMutableArray *lists;

-(void)saveChecklists;

@end
