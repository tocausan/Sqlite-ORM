//  Tomas Caufriez (167432)

//  SQLiteLibrary.h
//  ORM
//
//  Created by gofrette on 2/03/15.
//  Copyright (c) 2015 gofrette. All rights reserved.
//

/*
 
HOW TO USE:

send:
    NSMutableDictionary =
        @"table"        = @"foo",
        @"row"          = NSMutableArray,
        @"values"       = NSMutableArray,
        @"whereRow"     = @"foo",
        @"whereValue"   = @"foo"
 
retrieve:
    NSMutableDictionary =
        @"result"          = NSMutableDictionary
 
*/

#import <Foundation/Foundation.h>
#import "sqlite3.h"

@interface SQLiteLibrary : NSObject{
    NSString *databaseName; // db name
    NSString *databasePath; // db path
}

-(id) Init; // init database

-(void) CreateDatabase: (NSString *)databasename: (BOOL)overwrite; // validate & create database (& change database name)
-(void) CreateTable: (NSMutableDictionary*)data; // create table
-(void) DropTable: (NSMutableDictionary*)data; // drop table

// CRUD
-(void) Create: (NSMutableDictionary*)data; // insert into table
-(void) Read: (NSMutableDictionary*)data; // read table
-(void) Update: (NSMutableDictionary*)data; // update table
-(void) Delete: (NSMutableDictionary*)data; // delete table

@end
