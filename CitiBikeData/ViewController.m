//
//  ViewController.m
//  CitiBikeData
//
//  Created by Pietro Degrazia on 6/16/16.
//  Copyright © 2016 PDG. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Carrega CSV pra arquivo serial
    [CSVInteractor parseCSVToFile];
    
    //Carrega indice
    
    
    //permite pesquisa
    //1.por chave
    //2.por intervalo
    //3.lista ordenada
    //4.lista inversa
    
    //busca no arquivo por offset
    Station station = [StationInteractor fetchStationAtIndex:[@1 intValue]];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
