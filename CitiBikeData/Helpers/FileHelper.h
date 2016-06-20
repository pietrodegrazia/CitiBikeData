//
//  FileHelper.h
//  CitiBikeData
//
//  Created by Pietro Degrazia on 6/16/16.
//  Copyright © 2016 PDG. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FileHelper : NSObject

+(NSString*) pathForStationsData;

+(NSString*) pathForStationsIdIndex;

+(NSString*) pathForStationsCSV;

@end
