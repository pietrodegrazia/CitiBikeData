//
//  BPTree.m
//  CitiBikeData
//
//  Created by Pietro Degrazia on 6/17/16.
//  Copyright © 2016 PDG. All rights reserved.
//

#import "BPTree.h"
#import "bpt.h"

@interface BPTree ()

@property (nonatomic, readonly) bpt::bplus_tree* tree;

@end

@implementation BPTree

- (instancetype) initWithFilePath:(NSString*) path shouldForceEmpty: (bool) forceEmpty
{
    self = [super init];
    
    if(self != nil)
    {
        _tree = new bpt::bplus_tree([path UTF8String], false);
    }
    
    return self;
}

- (void) insertKey:(int)key forValue: (int)value {
    char newKey[16] = { 0 };
    sprintf(newKey, "%d", key);
    _tree->insert(newKey, value);
}

- (int) findKey:(const char*) key {
    int value;
    if ( _tree->search(key, &value) == 0 ) {
        return value;
    } else {
        return -1;
    }
}

- (NSArray*) findKeysInRange:(const char*) firstKey :(const char*)secondKey {
    int maxSize = atoi(secondKey) - atoi(firstKey);
    int values[maxSize];
    
    bpt::key_t start(firstKey), end(secondKey);
    _tree->search_range(&start, end, values, maxSize);
    
    NSMutableArray *mutableResult = [[NSMutableArray alloc]init];
    for (int i = 0; i < maxSize; i++) {
        if (values[i] != -1) {
            [mutableResult addObject:[NSNumber numberWithInteger:values[i]]];
        }
    }
    NSArray *result = [NSArray arrayWithArray:mutableResult];
    return result;

}

- (void) dumpTree {
//    _tree->dumpTree();
    char newKey[16] = { 0 };
    sprintf(newKey, "%d", 0);
    
    char otherKey[16] = { 0 };
    sprintf(otherKey, "%d", 6000);
    
    bpt::value_t values[1000];
    bpt::key_t start(newKey), end(otherKey);

    _tree->search_range(&start, end, values, 1000);
}

- (NSArray*) keysInAscendingOrder {
    int values[510];
    _tree->sortOrderAscending(values, 510);
    NSMutableArray *mutableResult = [[NSMutableArray alloc]init];
    for (int i = 0; i < 510; i++) {
        if (values[i] != -1) {
            [mutableResult addObject:[NSNumber numberWithInteger:values[i]]];
        }
    }
    NSArray *result = [NSArray arrayWithArray:mutableResult];
    return result;
}

- (NSArray*) keysInDescendingOrder {
    int values[510];
    
    _tree->sortOrderDescending(values, 510);
    
    NSMutableArray *mutableResult = [[NSMutableArray alloc]init];
    for (int i = 0; i < 510; i++) {
        if (values[i] != -1) {
            [mutableResult addObject:[NSNumber numberWithInteger:values[i]]];
        }
    }
    NSArray *result = [NSArray arrayWithArray:mutableResult];
    return result;
}
@end