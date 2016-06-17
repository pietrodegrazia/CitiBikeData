//
//  Station.h
//  CitiBikeData
//
//  Created by Pietro Degrazia on 6/17/16.
//  Copyright © 2016 PDG. All rights reserved.
//

#ifndef Station_h
#define Station_h

typedef struct Station
{
    int identifier;
    int totalDocks;
    float latitude;
    float longitude;
    char name[55];
    char address[55];
} Station;

#endif /* Station_h */
