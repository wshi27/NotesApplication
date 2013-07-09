//
//  User.h
//  NotesApplication
//
//  Created by Weiwei Shi on 7/4/13.
//  Copyright (c) 2013 self.edu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface User : NSManagedObject

@property (nonatomic, retain) NSString * fullName;
@property (nonatomic, retain) NSDate * dateOfBirth;
@property (nonatomic, retain) NSString * password;

@end
