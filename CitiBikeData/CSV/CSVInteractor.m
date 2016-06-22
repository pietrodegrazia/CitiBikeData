//
//  CSVInteractor.m
//  CitiBikeData
//
//  Created by Pietro Degrazia on 6/16/16.
//  Copyright © 2016 PDG. All rights reserved.
//

#import "CSVInteractor.h"

@implementation CSVInteractor

+(void) parseCSVToFile {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
//    [userDefaults removeObjectForKey:@"hasParsedStationsCSV"];
    if ([userDefaults boolForKey:@"hasParsedStationsCSV"]) {
        printf("\nCSV file has already been parsed\n");
        return;
    }
    
    
    NSString *csvPath = [FileHelper pathForStationsCSV];
    const char *csvPathCharPointer = [csvPath UTF8String];
    const char *CSVFileOptions = [@"rt" UTF8String];
    
    NSString *stationDataPath = [FileHelper pathForStationsData];
    const char *stationDataPathCharPointer = [stationDataPath UTF8String];
    const char *stationDataFileOptions = [@"ab" UTF8String];
    
    FILE *csvFile = fopen(csvPathCharPointer, CSVFileOptions);
    FILE *dataFile = fopen(stationDataPathCharPointer, stationDataFileOptions);
    
    Station station;

    char* currentLine = NULL;
    size_t len = 0;
    ssize_t read;
    
    char* currentField;
    const char csvDelimeter[2] = ",";
    
    printf("\nparsing stations csv file...\n");

    getline(&currentLine, &len, csvFile);
    while ((read = getline(&currentLine, &len, csvFile)) != -1) {
        currentField = strtok(currentLine, csvDelimeter);
        station.identifier = atoi(currentField);
        
        currentField = strtok(NULL, csvDelimeter);
        strcpy(station.name, currentField);
        
        currentField = strtok(NULL, csvDelimeter);
        station.totalDocks = atoi(currentField);
        
        currentField= strtok(NULL, csvDelimeter);
        station.latitude = atof(currentField);
        
        currentField= strtok(NULL, csvDelimeter);
        station.longitude = atof(currentField);
        
        currentField = strtok(NULL, csvDelimeter);
        strcpy(station.address, currentField);
        
        fwrite(&station, sizeof(Station), 1, dataFile);
    }
    
    fclose(dataFile);
    fclose(csvFile);

    
    [userDefaults setBool:true forKey:@"hasParsedStationsCSV"];
    [userDefaults synchronize];
   
}

@end
