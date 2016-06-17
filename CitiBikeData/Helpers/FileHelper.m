//
//  FileHelper.m
//  CitiBikeData
//
//  Created by Pietro Degrazia on 6/16/16.
//  Copyright © 2016 PDG. All rights reserved.
//

#import "FileHelper.h"

@implementation FileHelper

+(NSString*) pathForStationsCSV {
    NSString *csvPath = [[NSBundle mainBundle] pathForResource:@"StationsCSV" ofType:@"csv"];
    return csvPath;
}

+(NSString*) pathForStationsData {
    NSArray *directoryPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectoryPath = [directoryPaths objectAtIndex:0];
    NSString *stationDataPath = [documentsDirectoryPath stringByAppendingPathComponent:@"stationData.dat"];
    
    NSFileManager *fileManager= [NSFileManager defaultManager];
    if(![fileManager fileExistsAtPath:stationDataPath])
        [fileManager createFileAtPath:stationDataPath contents:nil attributes:nil];
    
    return stationDataPath;
}

+(NSURL*) directoryForCSVFiles {
    NSArray *directoryPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectoryPath = [directoryPaths objectAtIndex:0];
    NSString *CSVDirectoryPath = [documentsDirectoryPath stringByAppendingPathComponent:@"CBD_CSV"];
    
    BOOL isDir;
    NSFileManager *fileManager= [NSFileManager defaultManager];
    if(![fileManager fileExistsAtPath:CSVDirectoryPath isDirectory:&isDir])
        if(![fileManager createDirectoryAtPath:CSVDirectoryPath withIntermediateDirectories:YES attributes:nil error:NULL])
            NSLog(@"Error: Create folder failed %@", CSVDirectoryPath);
    
    NSURL *csvDirectoryURL = [NSURL URLWithString:CSVDirectoryPath];
    
    return csvDirectoryURL;
}

@end
