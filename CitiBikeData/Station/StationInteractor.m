//
//  StationInteractor.m
//  CitiBikeData
//
//  Created by Pietro Degrazia on 6/17/16.
//  Copyright © 2016 PDG. All rights reserved.
//

#import "StationInteractor.h"

@implementation StationInteractor

+(Station) fetchStationAtIndex:(int)index {
    Station station;
    NSString *stationDataPath = [FileHelper pathForStationsData];
    const char *stationDataPathCharPointer = [stationDataPath UTF8String];
    
    FILE *dataFile = fopen(stationDataPathCharPointer, [@"rb" UTF8String]);
    if (dataFile == NULL)
        printf("\nErro abrindo o arquivo");
    
    fseeko(dataFile, sizeof(Station)*index, SEEK_SET);
    if (fread(&station, sizeof(Station), 1, dataFile) != 1) {
        printf("\nErro ao ler Station de index %i", index);
    }
    printf("\nLeu Station:\n   %d %s %f\n", station.identifier, station.name, station.latitude);
    
    return station;
}

+(void) dumpStationDataFile {
    Station station;
    NSString *stationDataPath = [FileHelper pathForStationsData];
    const char *stationDataPathCharPointer = [stationDataPath UTF8String];
    
    FILE *dataFileRead = fopen(stationDataPathCharPointer, [@"rb" UTF8String]);
    if (dataFileRead == NULL)
        printf("\nErro abrindo o arquivo");
    
    fseeko(dataFileRead, 0, SEEK_SET);
    while (fread(&station, sizeof(Station), 1, dataFileRead) == 1) {
        printf("%d %s %f\n", station.identifier, station.name, station.latitude);
    }
}

@end
