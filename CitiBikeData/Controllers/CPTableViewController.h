//
//  CPTableViewController.h
//  CitiBikeData
//
//  Created by Pietro Degrazia on 6/19/16.
//  Copyright © 2016 PDG. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SVProgressHUD.h"
#import "StationInteractor.h"
#import "CSVInteractor.h"
#import "ResultTableViewController.h"

@interface CPTableViewController : UITableViewController

-(void)showIndexAlert;
-(void)showRangeAlert;
- (void) proceedWithResult: (NSArray*)result;


typedef enum {
    Search = 0,
    Sort = 1
} Sections;

typedef enum {
    ByIndex = 0,
    ByRange = 1
} SearchSection;

typedef enum {
    Ascending = 0,
    Descending = 1
} SortSection;
@end
