//
//  BPTreeInteractor.m
//  CitiBikeData
//
//  Created by Pietro Degrazia on 6/17/16.
//  Copyright © 2016 PDG. All rights reserved.
//

#import "BPTreeInteractor.h"

@interface BPTreeInteractor () {
    BPTree *tree;
}
@end

@implementation BPTreeInteractor

- (void) loadStationIdIndex:(bool) forceEmpty {
    NSString *filePath = [FileHelper pathForStationsIdIndex];
    tree = [[BPTree alloc]initWithFilePath:filePath shouldForceEmpty:forceEmpty];
}

- (void) insertKey: (NSInteger)key forValue:(NSInteger)value {
    [tree insertKey:key forValue: value];
}

- (void) dumpTree {
    [tree dumpTree];
}

- (int) valueForKey: (NSString*) key {
    return [tree findKey:key.UTF8String];
}

- (NSArray*) valuesForRangeWith: (NSString*) key andKey:(NSString*)secondKey {
    NSArray *results = [tree findKeysInRange:key.UTF8String :secondKey.UTF8String];
    return results;
}

- (NSArray*) valuesInAscendingOrder {
    NSArray *results = [tree keysInAscendingOrder];
    return results;
}

- (NSArray*) valuesInDescendingOrder {
    NSArray *results = [tree keysInDescendingOrder];
    return results;
}

@end