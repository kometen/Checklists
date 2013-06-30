//
//  Checklist.m
//  Checklists
//
//  Created by Claus Guttesen on 28/06/13.
//  Copyright (c) 2013 Claus Guttesen. All rights reserved.
//

#import "Checklist.h"

@implementation Checklist

-(id)init {
    if ((self = [super init])) {
        self.items = [[NSMutableArray alloc] initWithCapacity:20];
    }
    return self;
}

@end
