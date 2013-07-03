//
//  Note.h
//  NotesApplication
//
//  Created by Weiwei Shi on 7/2/13.
//  Copyright (c) 2013 self.edu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Note : NSManagedObject

@property (nonatomic, retain) NSString * body;
@property (nonatomic, retain) NSDate * dateCreated;
@property (nonatomic, retain) NSNumber * index;

@end
