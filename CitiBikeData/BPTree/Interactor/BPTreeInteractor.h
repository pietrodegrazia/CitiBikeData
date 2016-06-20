//
//  BPTreeInteractor.h
//  CitiBikeData
//
//  Created by Pietro Degrazia on 6/17/16.
//  Copyright © 2016 PDG. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BPTree.h"
#import "FileHelper.h"
@interface BPTreeInteractor : NSObject

- (void) loadStationIdIndex: (bool)forceEmpty;

- (void) insertKey: (NSInteger)key forValue:(NSInteger)value;

- (void) dumpTree;

- (int) valueForKey: (NSString*) key;

- (NSArray*) valuesForRangeWith: (NSString*) key andKey:(NSString*)secondKey;
- (NSArray*) valuesInAscendingOrder;
- (NSArray*) valuesInDescendingOrder;


@end
