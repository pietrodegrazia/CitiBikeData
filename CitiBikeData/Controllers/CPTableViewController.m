//
//  CPTableViewController.m
//  CitiBikeData
//
//  Created by Pietro Degrazia on 6/19/16.
//  Copyright © 2016 PDG. All rights reserved.
//

#import "CPTableViewController.h"
@interface CPTableViewController () {
    BPTreeInteractor *treeInteractor;
}
@end

@implementation CPTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //Carrega CSV pra arquivo serial
    [CSVInteractor parseCSVToFile];
    
    //Carrega indice
    treeInteractor = [[BPTreeInteractor alloc]init];
    [treeInteractor loadStationIdIndex: false];
    
//    [treeInteractor dumpTree];
    
    
    //permite pesquisa
    //1.por chave √
    //2.por intervalo √
    //3.lista ordenada √
    //4.lista inversa √
    
    
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.tableView.allowsSelection = true;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%@", indexPath);
    self.tableView.allowsSelection = false;
    [tableView deselectRowAtIndexPath:indexPath animated:true];
    switch (indexPath.section) {
        case Search:
            switch (indexPath.row) {
                case ByIndex:{
                    [self showIndexAlert];
                    break;
                }
    
                case ByRange:
                    [self showRangeAlert];
                    break;
            }
            break;
            
        case Sort:
            switch (indexPath.row) {
                case Ascending:
                    [self performSegueWithIdentifier:@"gotoResultTable" sender:[treeInteractor valuesInAscendingOrder]];
                    break;
                case Descending:
                    [self performSegueWithIdentifier:@"gotoResultTable" sender:[treeInteractor valuesInDescendingOrder]];
                    break;
            }
    }
}

- (void) showIndexAlert {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Digite o identificador:" message:@"" preferredStyle:UIAlertControllerStyleAlert];
    
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {}];
    
    UIAlertAction *searchAction = [UIAlertAction actionWithTitle:@"Buscar" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
        NSString *stationId = [[[alert textFields] firstObject] text];
        
//        [SVProgressHUD show];
        int fileIndex = [treeInteractor valueForKey:stationId];
        if (fileIndex == -1) {
            NSLog(@"Nao encontrou identificador");
            [SVProgressHUD showErrorWithStatus:@"Nao encontrou identificador"];
            self.tableView.allowsSelection = true;
            return;
        }

        NSArray *result = [[NSArray alloc] initWithObjects: [NSNumber numberWithInt:fileIndex], nil];
//        [SVProgressHUD dismiss];
        [alert dismissViewControllerAnimated:false completion:nil];
     [self performSegueWithIdentifier:@"gotoResultTable" sender:(id)result];
        NSLog(@"%@", result);
    }];
    
    [alert addAction:searchAction];
    [self presentViewController:alert animated:true completion:nil];
}

- (void) showRangeAlert {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Digite os identificadores:" message:@"" preferredStyle:UIAlertControllerStyleAlert];
    
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {}];
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {}];
    
    UIAlertAction *searchAction = [UIAlertAction actionWithTitle:@"Buscar" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
        NSString *firstStationId = [[[alert textFields] firstObject] text];
        NSString *secondStationId = [[[alert textFields] objectAtIndex:1] text];
        NSArray *results = [treeInteractor valuesForRangeWith:firstStationId andKey:secondStationId];
        [alert dismissViewControllerAnimated:false completion:nil];
        [self performSegueWithIdentifier:@"gotoResultTable" sender:(id)results];
        NSLog(@"%@", results);
    }];
    
    [alert addAction:searchAction];
    [self presentViewController:alert animated:true completion:nil];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier]  isEqual: @"gotoResultTable"]) {
        ResultTableViewController *vc = (ResultTableViewController*)[segue destinationViewController];
        vc.results = sender;
        NSLog(@"");
    }
}

- (IBAction)updateIndex:(id)sender {
    [StationInteractor populateIndexFromInteractor:treeInteractor];
}

@end










