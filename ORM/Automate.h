//  Tomas Caufriez (167432)

//  Automate.h
//  ORM
//
//  Created by gofrette on 2/03/15.
//  Copyright (c) 2015 gofrette. All rights reserved.
//

/*
    Automate able to generate database
*/

#import <Foundation/Foundation.h>
#import "sqlite3.h"


@interface Automate : NSObject

-(id) Init;

-(void) CreateTable: (NSMutableDictionary*)data;
-(void) DropTable: (NSMutableDictionary*)data;

-(void) Create: (NSMutableDictionary*)data;
-(void) Read: (NSMutableDictionary*)data;
-(void) Update: (NSMutableDictionary*)data;
-(void) Delete: (NSMutableDictionary*)data;

// database generation
-(void) CreateTable_1: (NSMutableDictionary*)data;
-(void) Create_1: (NSMutableDictionary*)data;
-(void) Create_2: (NSMutableDictionary*)data;
-(void) Create_3: (NSMutableDictionary*)data;
-(void) Create_4: (NSMutableDictionary*)data;
-(void) Create_5: (NSMutableDictionary*)data;
-(void) Create_6: (NSMutableDictionary*)data;
@end
