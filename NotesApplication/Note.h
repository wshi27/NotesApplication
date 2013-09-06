//
//  Note.h
//  NotesApplication
//
//  Created by Weiwei Shi on 9/1/13.
//  Copyright (c) 2013 self.edu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Note : NSManagedObject

@property (nonatomic, retain) NSString * body;
@property (nonatomic, retain) NSDate * dateCreated;
@property (nonatomic, retain) NSNumber * index;
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) id image;

@end
