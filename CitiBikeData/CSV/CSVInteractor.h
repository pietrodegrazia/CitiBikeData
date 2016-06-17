//
//  CSVInteractor.h
//  CitiBikeData
//
//  Created by Pietro Degrazia on 6/16/16.
//  Copyright © 2016 PDG. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FileHelper.h"
#import "Station.h"

@interface CSVInteractor : NSObject

+(void)parseCSVToFile;

@end
