//
//  ResultTableViewController.m
//  CitiBikeData
//
//  Created by Pietro Degrazia on 6/19/16.
//  Copyright © 2016 PDG. All rights reserved.
//

#import "ResultTableViewController.h"

@implementation ResultTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _results.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"resultCell"];
    
    int fileIndex = [(NSNumber*)_results[indexPath.row] intValue];
    
    Station station = [StationInteractor fetchStationAtIndex:fileIndex];
    if (station.identifier != -1) {
        cell.textLabel.text = [NSString stringWithUTF8String:station.name];
        cell.detailTextLabel.text = [NSString stringWithFormat:@"%i", station.identifier];
    } else {
        cell.textLabel.text = @"";
        cell.detailTextLabel.text = @"";
    }
    return cell;
}

@end
