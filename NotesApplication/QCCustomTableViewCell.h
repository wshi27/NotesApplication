//
//  QCCustomTableViewCell.h
//  NotesApplication
//
//  Created by Weiwei Shi on 7/4/13.
//  Copyright (c) 2013 self.edu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QCCustomTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UILabel *dateCratedLable;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;

@end
