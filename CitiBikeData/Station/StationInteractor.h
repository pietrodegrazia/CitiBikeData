//
//  StationInteractor.h
//  CitiBikeData
//
//  Created by Pietro Degrazia on 6/17/16.
//  Copyright © 2016 PDG. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Station.h"
#import "FileHelper.h"

@interface StationInteractor : NSObject

+(void)dumpStationDataFile;

+(Station)fetchStationAtIndex: (int)index;

@end
