//
//  BPTree.h
//  CitiBikeData
//
//  Created by Pietro Degrazia on 6/17/16.
//  Copyright © 2016 PDG. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BPTree : NSObject

@property (nonatomic, copy) NSString* filePath;
- (instancetype) initWithFilePath:(NSString*) path shouldForceEmpty: (bool)forceEmpty;

- (void) insertKey:(int)key forValue: (int)value;

- (void) dumpTree;

- (int) findKey:(const char*) key;

- (NSArray*) findKeysInRange:(const char*) firstKey :(const char*)secondKey;

- (NSArray*) keysInAscendingOrder;
- (NSArray*) keysInDescendingOrder;
@end
