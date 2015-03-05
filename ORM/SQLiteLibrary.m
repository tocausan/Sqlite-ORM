//  Tomas Caufriez (167432)

//  SQLiteLibrary.m
//  ORM
//
//  Created by gofrette on 2/03/15.
//  Copyright (c) 2015 gofrette. All rights reserved.
//

#import "SQLiteLibrary.h"

@implementation SQLiteLibrary

/*
*** Init database
    - set database name
    - set database path
    - log database name
*/
-(id) Init{
    @autoreleasepool{
        return self;
    }
}


/*
 ##### ####  #####  ###  ##### #####    ###    ####   ###  #####  ###  ####   ###   #### #####
 #     #   # #     #   #   #   #       #   #   #   # #   #   #   #   # #   # #   # #     #
 #     ####  ###   #####   #   ###     #####   #   # #####   #   ##### ####  #####  ###  ###
 #     #   # #     #   #   #   #       #   #   #   # #   #   #   #   # #   # #   #     # #
 #     #   # #     #   #   #   #       #   #   #   # #   #   #   #   # #   # #   #     # #
 ##### #   # ##### #   #   #   #####   #   #   ####  #   #   #   #   # ####  #   # ####  #####
 
*** Database validation & creation:
    - set database name
    - set database path
    - create BOOL & fileManager
    - check database path
    - check if db exist && !BOOL
    - create db path
    - copy db into path
*/

-(void) CreateDatabase: (NSString *)databasename: (BOOL)overwrite {
    @autoreleasepool{
        
        databaseName = databasename;
        NSArray *documentPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *documentsDir = [documentPaths objectAtIndex:0];
        databasePath = [documentsDir stringByAppendingPathComponent:databaseName];
        
        NSLog(@"DB name: %@",databaseName);
        NSLog(@"DB path: %@",documentsDir);
        
        
        BOOL success;
        NSFileManager *fileManager = [NSFileManager defaultManager];
        success = [fileManager fileExistsAtPath:databasePath];
        if (success && !overwrite) { return; }
    
        NSString *databasePathFromApp = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:databaseName];
        [fileManager copyItemAtPath:databasePathFromApp toPath:databasePath error:nil];
    }
}

/*
 ##### ####  #####  ###  ##### #####    ###    #####  ###  ####  #     #####
 #     #   # #     #   #   #   #       #   #     #   #   # #   # #     #
 #     ####  ###   #####   #   ###     #####     #   ##### ####  #     ###
 #     #   # #     #   #   #   #       #   #     #   #   # #   # #     #
 #     #   # #     #   #   #   #       #   #     #   #   # #   # #     #
 ##### #   # ##### #   #   #   #####   #   #     #   #   # ####  ##### #####
 
 *** Create a table
 - open database
 - create sql statement
 - convert statement to UTF8
 - prepare compiledStatement
 - check prepare error
 - check step error
 - log result
 - compile
 */
-(void) CreateTable: (NSMutableDictionary *)data{
    @autoreleasepool{
        
        sqlite3 *_database;
        sqlite3_open([databasePath UTF8String], &_database);
        
        NSString *sqlStatement = @"CREATE TABLE ";
        sqlStatement = [sqlStatement stringByAppendingString: [data objectForKey:@"table"]];
        sqlStatement = [sqlStatement stringByAppendingString: @"("];
        sqlStatement = [sqlStatement stringByAppendingString: [[data objectForKey:@"row"] componentsJoinedByString:@", "]];
        sqlStatement = [sqlStatement stringByAppendingString: @")"];
        const char *sql = [sqlStatement UTF8String];

        static sqlite3_stmt *compiledStatement;
        int result = sqlite3_prepare_v2(_database, sql, -1, &compiledStatement, NULL);
        if(result != SQLITE_OK) {
            NSLog(@"Prepare-error #%i: %s\n", result, sqlite3_errmsg(_database));
        }
        
        result = sqlite3_step(compiledStatement);
        if (result != SQLITE_DONE) {
            NSLog(@"Step-error #%i : %s \n STATEMENT: \"%@\" \n\n", result, sqlite3_errmsg(_database), sqlStatement);
        }else{
            NSLog (@"\n\nTABLE CREATED\ntable: %@ \nrow: %@\n", [data objectForKey:@"table"], [data objectForKey:@"row"]);
        }
        
        sqlite3_finalize(compiledStatement);
    }
}



/*
 ####  ####   ###  ####    ###    #####  ###  ####  #     #####
 #   # #   # #   # #   #  #   #     #   #   # #   # #     #
 #   # ####  #   # ####   #####     #   ##### ####  #     ###
 #   # #   # #   # #      #   #     #   #   # #   # #     #
 #   # #   # #   # #      #   #     #   #   # #   # #     #
 ####  #   #  ###  #      #   #     #   #   # ####  ##### #####
 
 *** Drop a table
 - open database
 - create sql statement
 - convert statement to UTF8
 - prepare compiledStatement
 - check prepare error
 - check step error
 - log result
 - compile
 */
-(void) DropTable: (NSMutableDictionary *)data{
    @autoreleasepool{
        
        sqlite3 *_database;
        sqlite3_open([databasePath UTF8String], &_database);
        
        NSString *sqlStatement = @"DROP TABLE ";
        sqlStatement = [sqlStatement stringByAppendingString: [data objectForKey:@"table"]];
        const char *sql = [sqlStatement UTF8String];
        
        static sqlite3_stmt *compiledStatement;
        int result = sqlite3_prepare_v2(_database, sql, -1, &compiledStatement, NULL);
        if(result != SQLITE_OK) {
            NSLog(@"Prepare-error #%i: %s\n", result, sqlite3_errmsg(_database));
        }
        
        result = sqlite3_step(compiledStatement);
        if (result != SQLITE_DONE) {
            NSLog(@"Step-error #%i : %s \n STATEMENT: \"%@\" \n\n", result, sqlite3_errmsg(_database), sqlStatement);
        }else{
            NSLog (@"\n\nTABLE DROPPED\ntable: %@ \n", [data objectForKey:@"table"]);
        }
        
        sqlite3_finalize(compiledStatement);
    }
}




/*
 ##### ####  #####  ###  ##### #####
 #     #   # #     #   #   #   #
 #     ####  ###   #####   #   ###
 #     #   # #     #   #   #   #
 #     #   # #     #   #   #   #
 ##### #   # ##### #   #   #   #####
 
 *** Create (insert into table)
 - open database
 - create sql statement
 - convert statement to UTF8
 - prepare compiledStatement
 - check prepare error
 - check step error
 - log result
 - compile
 */
-(void) Create: (NSMutableDictionary *)data{
    @autoreleasepool{
        
        sqlite3 *_database;
        sqlite3_open([databasePath UTF8String], &_database);
        
        NSString *sqlStatement = @"INSERT INTO ";
        sqlStatement = [sqlStatement stringByAppendingString: [data objectForKey:@"table"]];
        sqlStatement = [sqlStatement stringByAppendingString: @"("];
        sqlStatement = [sqlStatement stringByAppendingString: [[data objectForKey:@"row"] componentsJoinedByString:@", "]];
        sqlStatement = [sqlStatement stringByAppendingString: @")"];
        sqlStatement = [sqlStatement stringByAppendingString: @" VALUES ('"];
        sqlStatement = [sqlStatement stringByAppendingString: [[data objectForKey:@"value"] componentsJoinedByString:@"', '"]];
        sqlStatement = [sqlStatement stringByAppendingString: @"')"];
        const char *sql = [sqlStatement UTF8String];
        
        static sqlite3_stmt *compiledStatement;
        int result = sqlite3_prepare_v2(_database, sql, -1, &compiledStatement, NULL);
        if(result != SQLITE_OK) {
            NSLog(@"Prepare-error #%i: %s\n", result, sqlite3_errmsg(_database));
        }
        
        result = sqlite3_step(compiledStatement);
        if (result != SQLITE_DONE) {
            NSLog(@"Step-error #%i : %s \n STATEMENT: \"%@\" \n\n", result, sqlite3_errmsg(_database), sqlStatement);
        }else{
            NSLog (@"\n\nDATA CREATED\ntable: %@ \nrow: %@ \nvalue: %@\n", [data objectForKey:@"table"], [data objectForKey:@"row"], [data objectForKey:@"value"]);
        }
        
        sqlite3_finalize(compiledStatement);
        
        
    }
}


/*
 ####  #####  ###  ####
 #   # #     #   # #   #
 ####  ###   ##### #   #
 #   # #     #   # #   #
 #   # #     #   # #   #
 #   # ##### #   # ####
 
 *** Read (select table)
 - set variables
 - open database
 - create sql statement
 - convert statement to UTF8
 - prepare compiledStatement
 - get database result
 - check prepare error
 - compile
 - log result
 - return result into data
 */
-(void)Read: (NSMutableDictionary *)data{

    sqlite3 *_database;
    
    NSString *IDObject;
    NSString *arrayKey;
    NSString *arrayObject;
    
    NSMutableDictionary *resultData = [[NSMutableDictionary alloc]initWithCapacity:0];
    NSMutableDictionary *resultByID = [[NSMutableDictionary alloc]initWithCapacity:0];
    
    
    if(sqlite3_open([databasePath UTF8String], &_database) == SQLITE_OK) {
        // set sql statement
        NSString *sqlStatement = @"SELECT * FROM ";
        sqlStatement = [sqlStatement stringByAppendingString: [data objectForKey:@"table"]];
        const char *sql = [sqlStatement UTF8String];
        // prepare sql statement
        sqlite3_stmt *compiledStatement;
        int result = sqlite3_prepare_v2(_database, sql, -1, &compiledStatement, NULL);
        if(result == SQLITE_OK) {
            
            // columns
            NSDictionary *dictionary;
            // get dbObject counting on data->row
            for (int i = 0; i < [[data objectForKey:@"row"] count]; i++) {
                // read database
                while(sqlite3_step(compiledStatement) == SQLITE_ROW) {
                
                    // get ÌD
                    char * ID = (char *)sqlite3_column_text(compiledStatement, [[dictionary objectForKey: @"ID"] intValue]);
                    IDObject = [NSString stringWithUTF8String:ID];
                    
                    for (int j = 0; j < [[data objectForKey:@"row"] count]; j++) {
                        // get data->row
                        arrayKey = [[data objectForKey:@"row"] objectAtIndex:j];
                        // get dbObject from database
                        char * dbObject = (char *)sqlite3_column_text(compiledStatement, [[dictionary objectForKey: arrayKey] intValue]);
                        if (!dbObject){ dbObject=" "; }
                        // cast dbObject to sting
                        arrayObject = [NSString stringWithUTF8String:dbObject];
                        // set result
                        [resultData setObject:arrayObject forKey:arrayKey];
                        [resultByID setObject:resultData forKey:IDObject];
                    }
                }
            }
        }else{
            NSLog(@"Prepare-error #%i: %s\n", result, sqlite3_errmsg(_database));
        }
        sqlite3_finalize(compiledStatement);
    }else{
        printf("\"sqlite3_open\" error \n");
    }
    sqlite3_close(_database);
    
    // return result into data
    [data setObject:resultByID forKey:@"result"];
}



/*
 #   # ####  ####   ###  ##### #####
 #   # #   # #   # #   #   #   #
 #   # ####  #   # #####   #   ###
 #   # #     #   # #   #   #   #
 #   # #     #   # #   #   #   #
  ###  #     ####  #   #   #   #####
 
 *** Update (insert into table)
 - open database
 - create sql statement
 - convert statement to UTF8
 - prepare compiledStatement
 - check prepare error
 - check step error
 - log result
 - compile
 */
-(void) Update: (NSMutableDictionary *)data{
    @autoreleasepool{
        
        sqlite3 *_database;
        sqlite3_open([databasePath UTF8String], &_database);
        
        NSString *sqlStatement = @"UPDATE ";
        sqlStatement = [sqlStatement stringByAppendingString: [data objectForKey:@"table"]];
        sqlStatement = [sqlStatement stringByAppendingString: @" SET "];
        
        // update rows counting data->row
        for (int i = 0; i < [[data objectForKey:@"row"] count]; i++){
            
            sqlStatement = [sqlStatement stringByAppendingString: [[data objectForKey:@"row"] objectAtIndex:i]];
            sqlStatement = [sqlStatement stringByAppendingString: @" = "];
            sqlStatement = [sqlStatement stringByAppendingString: [[data objectForKey:@"value"] objectAtIndex:i]];
            
        }
        sqlStatement = [sqlStatement stringByAppendingString: @" WHERE "];
        sqlStatement = [sqlStatement stringByAppendingString: [data objectForKey:@"whereRow"]];
        sqlStatement = [sqlStatement stringByAppendingString: @" = "];
        sqlStatement = [sqlStatement stringByAppendingString: [data objectForKey:@"whereValue"]];
        const char *sql = [sqlStatement UTF8String];
        
        static sqlite3_stmt *compiledStatement;
        int result = sqlite3_prepare_v2(_database, sql, -1, &compiledStatement, NULL);
        if(result != SQLITE_OK) {
            NSLog(@"Prepare-error #%i: %s\n", result, sqlite3_errmsg(_database));
        }
        
        result = sqlite3_step(compiledStatement);
        if (result != SQLITE_DONE) {
            NSLog(@"Step-error #%i : %s \n STATEMENT: \"%@\" \n\n", result, sqlite3_errmsg(_database), sqlStatement);
        }else{
            NSLog (@"\n\nDATA UPDATED\ntable: %@ \nrow: %@ \nvalue: %@\n", [data objectForKey:@"table"], [data objectForKey:@"row"], [data objectForKey:@"value"]);
        }
        
        sqlite3_finalize(compiledStatement);
        
        
    }
}





/*
 ####  ##### #     ##### ##### #####
 #   # #     #     #       #   #
 #   # ###   #     ###     #   ###
 #   # #     #     #       #   #
 #   # #     #     #       #   #
 ####  ##### ##### #####   #   #####
 
 *** Delete (from a table)
 - open database
 - create sql statement
 - convert statement to UTF8
 - prepare compiledStatement
 - check prepare error
 - check step error
 - compile
 */
-(void) DELETE: (NSMutableDictionary *)data{
    @autoreleasepool{
        
        sqlite3 *_database;
        sqlite3_open([databasePath UTF8String], &_database);
        
        NSString *sqlStatement = @"DELETE FROM ";
        sqlStatement = [sqlStatement stringByAppendingString: [data objectForKey:@"table"]];
        sqlStatement = [sqlStatement stringByAppendingString: @" WHERE "];
        sqlStatement = [sqlStatement stringByAppendingString: [data objectForKey:@"row"]];
        sqlStatement = [sqlStatement stringByAppendingString: @" = "];
        sqlStatement = [sqlStatement stringByAppendingString: [data objectForKey:@"value"]];
        const char *sql = [sqlStatement UTF8String];
        
        static sqlite3_stmt *compiledStatement;
        int result = sqlite3_prepare_v2(_database, sql, -1, &compiledStatement, NULL);
        if(result != SQLITE_OK) {
            NSLog(@"Prepare-error #%i: %s\n", result, sqlite3_errmsg(_database));
        }
        
        result = sqlite3_step(compiledStatement);
        if (result != SQLITE_DONE) {
            NSLog(@"Step-error #%i : %s \n STATEMENT: \"%@\" \n\n", result, sqlite3_errmsg(_database), sqlStatement);
        }else{
            NSLog (@"\n\nDATA DELETED\ntable: %@ \nrow: %@ \nvalue: %@\n", [data objectForKey:@"table"], [data objectForKey:@"row"], [data objectForKey:@"value"]);
        }
        
        sqlite3_finalize(compiledStatement);
        
        
    }
}




@end
