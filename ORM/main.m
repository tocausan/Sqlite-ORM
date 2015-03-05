//  Tomas Caufriez (167432)

//  main.m
//  ORM
//
//  Created by gofrette on 2/03/15.
//  Copyright (c) 2015 gofrette. All rights reserved.
//

/*

 Test of SQLiteLibrary starring Automate
 
*/

#import <Foundation/Foundation.h>
#import "Automate.h"
#import "sqlite3.h"
#import "SQLiteLibrary.h"


int welcome() {
    printf("################################## \n");
    printf("# WELCOME TO SQLITE LIBRARY TEST # \n");
    printf("################################## \n");
    return 0;
}
int menu() {
    printf("\nMenu \n—————————— \n");
    printf(" 666.Generate a database \n");
    printf(" 1.Create a table \n");
    printf(" 2.Drop a table \n");
    printf(" 3.Insert into table \n");
    printf(" 4.Read a table \n");
    printf(" 5.Update a table \n");
    printf(" 6.Delete into a table \n");
    printf(" 0.Exit & read what \"data\" got \n");
    return 0;
}


int main(int argc, const char * argv[]) {
    @autoreleasepool {

        
       
        // init database
        SQLiteLibrary *sqlite = [[SQLiteLibrary alloc] Init];
        [sqlite CreateDatabase:@"database.sqlite" :NO];
        
        // init automatisation
        Automate *script = [[Automate alloc] init];
        
        NSMutableDictionary * readData = [NSMutableDictionary dictionaryWithObjectsAndKeys: nil];
        NSMutableArray *rows = [NSMutableArray arrayWithObjects: nil];
        [rows addObject:@"hh"];
        [rows addObject:@"hhg"];
        [rows addObject:@"hhjk"];
        [rows addObject:@"hhmmj"];
        
        NSLog(@"%@",[rows objectAtIndex:1]);
        
        // welcome
        printf("%", welcome());
        
        // menu
        int a=0;
        do {
         
            printf("%", menu());
            scanf("%d",&a);
            getchar();
            
            
            
            
            // ##### ####  #####  ###  ##### #####    ###    #####  ###  ####  #     #####
            // #     #   # #     #   #   #   #       #   #     #   #   # #   # #     #
            // #     ####  ###   #####   #   ###     #####     #   ##### ####  #     ###
            // #     #   # #     #   #   #   #       #   #     #   #   # #   # #     #
            // #     #   # #     #   #   #   #       #   #     #   #   # #   # #     #
            // ##### #   # ##### #   #   #   #####   #   #     #   #   # ####  ##### #####
            
            if(a == 1){
                
                printf("CREATE A TABLE \n");
                NSMutableArray *rows = [NSMutableArray arrayWithObjects: nil];
                NSMutableDictionary * data = [NSMutableDictionary dictionaryWithObjectsAndKeys: nil];
                
                int b=0;
                printf("Let the automate create a table (1/0) \n");
                scanf("%d",&b);
                getchar();
                
                if(b == 0){
                    // create manually
                    char tableName[256];
                    char row1[256];
                    char row2[256];
                    char row3[256];
                    // inputs
                    printf(" Table name:\n");
                    fgets ( tableName, 256, stdin );

                    printf(" Row 1:\n");
                    fgets ( row1, 256, stdin );
                
                    printf(" Row 2:\n");
                    fgets ( row2, 256, stdin );
               
                    printf(" Row 3:\n");
                    fgets ( row3, 256, stdin );
                    // char to string
                    NSString* tableNameStr = [NSString stringWithFormat:@"%s" , tableName];
                    NSString* row1Str = [NSString stringWithFormat:@"%s" , row1];
                    NSString* row2Str = [NSString stringWithFormat:@"%s" , row2];
                    NSString* row3Str = [NSString stringWithFormat:@"%s" , row3];
                    // set rows into array
                    [rows addObject:row1Str];
                    [rows addObject:row2Str];
                    [rows addObject:row3Str];
                    // set datas into dictionary
                    [data setObject:tableNameStr forKey:@"table"];
                    [data setObject:rows forKey:@"row"];
                    // create table
                    [sqlite CreateTable:data];
                }else{
                    // create automatically
                    [script CreateTable:data];
                    
                    // create table
                    [sqlite CreateTable:data];
                }
            }
            
            
            
            // ####  ####   ###  ####     ###    #####  ###  ####  #     #####
            // #   # #   # #   # #   #   #   #     #   #   # #   # #     #
            // #   # ####  #   # ####    #####     #   ##### ####  #     ###
            // #   # #   # #   # #       #   #     #   #   # #   # #     #
            // #   # #   # #   # #       #   #     #   #   # #   # #     #
            // ####  #   #  ###  #       #   #     #   #   # ####  ##### #####
            
            else if(a == 2){
                
                printf("DROP A TABLE \n");
                NSMutableDictionary * data = [NSMutableDictionary dictionaryWithObjectsAndKeys: nil];
                
                int b=0;
                printf("Let the automate drop a table (1/0) \n");
                scanf("%d",&b);
                getchar();
                
                if(b == 0){
                    // create manually
                    char tableName[256];
                    // inputs
                    printf(" Table name:\n");
                    fgets ( tableName, 256, stdin );
                    // char to string
                    NSString* tableNameStr = [NSString stringWithFormat:@"%s" , tableName];
                    // set datas into dictionary
                    [data setObject:tableNameStr forKey:@"table"];
                    // create table
                    [sqlite DropTable:data];
                }else{
                    // create automatically
                    [script  DropTable:data];
                    
                    // create table
                    [sqlite DropTable:data];
                }
            }

                
                
            // ##### ####  #####  ###  ##### #####
            // #     #   # #     #   #   #   #
            // #     ####  ###   #####   #   ###
            // #     #   # #     #   #   #   #
            // #     #   # #     #   #   #   #
            // ##### #   # ##### #   #   #   #####
            
            else if(a == 3){
                printf("INSERT INTO A TABLE \n");
                NSMutableArray *rows = [NSMutableArray arrayWithObjects: nil];
                NSMutableArray *values = [NSMutableArray arrayWithObjects: nil];
                NSMutableDictionary * data = [NSMutableDictionary dictionaryWithObjectsAndKeys: nil];
                
                int b=0;
                printf("Let the automate insert into a table (1/0) \n");
                scanf("%d",&b);
                getchar();
                
                if(b == 0){
                    // insert into a table manually
                    char tableName[256];
                    char row1[256];
                    char row2[256];
                    char row3[256];
                    char value1[256];
                    char value2[256];
                    char value3[256];
                    // inputs
                    printf(" Table name:\n");
                    fgets ( tableName, 256, stdin );
                    
                    printf(" Row 1:\n");
                    fgets ( row1, 256, stdin );
                    printf(" Value 1:\n");
                    fgets ( value1, 256, stdin );
                    
                    printf(" Row 2:\n");
                    fgets ( row2, 256, stdin );
                    printf(" Value 2:\n");
                    fgets ( value2, 256, stdin );
                    
                    printf(" Row 3:\n");
                    fgets ( row3, 256, stdin );
                    printf(" Value 3:\n");
                    fgets ( value3, 256, stdin );
                    // char to string
                    NSString* tableNameStr = [NSString stringWithFormat:@"%s" , tableName];
                    NSString* row1Str = [NSString stringWithFormat:@"%s" , row1];
                    NSString* row2Str = [NSString stringWithFormat:@"%s" , row2];
                    NSString* row3Str = [NSString stringWithFormat:@"%s" , row3];
                    NSString* value1Str = [NSString stringWithFormat:@"%s" , value1];
                    NSString* value2Str = [NSString stringWithFormat:@"%s" , value2];
                    NSString* value3Str = [NSString stringWithFormat:@"%s" , value3];
                    // set rows into array
                    [rows addObject:row1Str];
                    [rows addObject:row2Str];
                    [rows addObject:row3Str];
                    // set values into array
                    [values addObject:value1Str];
                    [values addObject:value2Str];
                    [values addObject:value3Str];
                    // set datas into dictionary
                    [data setObject:tableNameStr forKey:@"table"];
                    [data setObject:rows forKey:@"row"];
                    [data setObject:values forKey:@"value"];
                    // create table
                    [sqlite Create:data];
                }else{
                    // insert into a table automatically
                    [script Create:data];

                    // insert data
                    [sqlite Create:data];
                }
            }
            
            
            
            
            // ####  #####  ###  ####
            // #   # #     #   # #   #
            // ####  ###   ##### #   #
            // #   # #     #   # #   #
            // #   # #     #   # #   #
            // #   # ##### #   # ####
 
            else if(a == 4){
                printf("READ A TABLE \n");
                NSMutableArray *rows = [NSMutableArray arrayWithObjects: nil];
                NSMutableDictionary * data = [NSMutableDictionary dictionaryWithObjectsAndKeys: nil];
                
                int b=0;
                printf("Let the automate read a table (1/0) \n");
                scanf("%d",&b);
                getchar();
                
                if(b == 0){
                    // create manually
                    char tableName[256];
                    char row1[256];
                    char row2[256];
                    char row3[256];
                    // inputs
                    printf(" Table name:\n");
                    fgets ( tableName, 256, stdin );
                    
                    printf(" Row 1:\n");
                    fgets ( row1, 256, stdin );
                    
                    printf(" Row 2:\n");
                    fgets ( row2, 256, stdin );
                    
                    printf(" Row 3:\n");
                    fgets ( row3, 256, stdin );
                    // char to string
                    NSString* tableNameStr = [NSString stringWithFormat:@"%s" , tableName];
                    NSString* row1Str = [NSString stringWithFormat:@"%s" , row1];
                    NSString* row2Str = [NSString stringWithFormat:@"%s" , row2];
                    NSString* row3Str = [NSString stringWithFormat:@"%s" , row3];
                    // set rows into array
                    [rows addObject:row1Str];
                    [rows addObject:row2Str];
                    [rows addObject:row3Str];
                    // set datas into dictionary
                    [data setObject:tableNameStr forKey:@"table"];
                    [data setObject:rows forKey:@"row"];
                    // create table
                    [sqlite Read:data];
                }else{
                    // create automatically
                    [script Read:data];
                    
                    // create table
                    [sqlite Read:data];
                }
                
                // set result into readData
                readData = data;
            }
            
            
            
            
            
            else if(a == 5){
                printf("UPDATE A TABLE \n");
                NSMutableArray *rows = [NSMutableArray arrayWithObjects: nil];
                NSMutableArray *values = [NSMutableArray arrayWithObjects: nil];
                NSMutableDictionary * data = [NSMutableDictionary dictionaryWithObjectsAndKeys: nil];
                
                int b=0;
                printf("Let the automate update a table (1/0) \n");
                scanf("%d",&b);
                getchar();
                
                if(b == 0){
                    // insert into a table manually
                    char tableName[256];
                    char whereRow[256];
                    char whereValue[256];
                    char row1[256];
                    char row2[256];
                    char row3[256];
                    char value1[256];
                    char value2[256];
                    char value3[256];
                    // inputs
                    printf(" Table name:\n");
                    fgets ( tableName, 256, stdin );
                    
                    printf(" Where row is:\n");
                    fgets ( row1, 256, stdin );
                    printf(" and value is:\n");
                    fgets ( value1, 256, stdin );
                    
                    printf(" Row 1:\n");
                    fgets ( row1, 256, stdin );
                    printf(" Value 1:\n");
                    fgets ( value1, 256, stdin );
                    
                    printf(" Row 2:\n");
                    fgets ( row2, 256, stdin );
                    printf(" Value 2:\n");
                    fgets ( value2, 256, stdin );
                    
                    printf(" Row 3:\n");
                    fgets ( row3, 256, stdin );
                    printf(" Value 3:\n");
                    fgets ( value3, 256, stdin );
                    // char to string
                    NSString* tableNameStr = [NSString stringWithFormat:@"%s" , tableName];
                    NSString* whereRowStr = [NSString stringWithFormat:@"%s" , whereRow];
                    NSString* whereValueStr = [NSString stringWithFormat:@"%s" , whereValue];
                    NSString* row1Str = [NSString stringWithFormat:@"%s" , row1];
                    NSString* row2Str = [NSString stringWithFormat:@"%s" , row2];
                    NSString* row3Str = [NSString stringWithFormat:@"%s" , row3];
                    NSString* value1Str = [NSString stringWithFormat:@"%s" , value1];
                    NSString* value2Str = [NSString stringWithFormat:@"%s" , value2];
                    NSString* value3Str = [NSString stringWithFormat:@"%s" , value3];
                    // set rows into array
                    [rows addObject:row1Str];
                    [rows addObject:row2Str];
                    [rows addObject:row3Str];
                    // set values into array
                    [values addObject:value1Str];
                    [values addObject:value2Str];
                    [values addObject:value3Str];
                    // set datas into dictionary
                    [data setObject:tableNameStr forKey:@"table"];
                    [data setObject:rows forKey:@"row"];
                    [data setObject:values forKey:@"value"];
                    [data setObject:whereRowStr forKey:@"whereRow"];
                    [data setObject:whereValueStr forKey:@"whereValue"];
                    // create table
                    [sqlite Update:data];
                }else{
                    // insert into a table automatically
                    [script Update:data];
                    
                    // insert data
                    [sqlite Update:data];
                }
            }
            
            
            
            
            // ####  ##### #     ##### ##### #####
            // #   # #     #     #       #   #
            // #   # ###   #     ###     #   ###
            // #   # #     #     #       #   #
            // #   # #     #     #       #   #
            // ####  ##### ##### #####   #   #####

            
            else if(a == 6){
                printf("DELETE INTO A TABLE \n");
                NSMutableDictionary * data = [NSMutableDictionary dictionaryWithObjectsAndKeys: nil];
                
                int b=0;
                printf("Let the automate delete from a table (1/0) \n");
                scanf("%d",&b);
                getchar();
                
                if(b == 0){
                    // insert into a table manually
                    char tableName[256];
                    char row[256];
                    char value[256];
                    // inputs
                    printf(" Table name\n");
                    fgets ( tableName, 256, stdin );
                    
                    printf(" Row name\n");
                    fgets ( row, 256, stdin );
                    printf(" Value name\n");
                    fgets ( value, 256, stdin );
                    
                    // char to string
                    NSString* tableNameStr = [NSString stringWithFormat:@"%s" , tableName];
                    NSString* rowStr = [NSString stringWithFormat:@"%s" , row];
                    NSString* valueStr = [NSString stringWithFormat:@"%s" , value];
                    // set datas into dictionary
                    [data setObject:tableNameStr forKey:@"table"];
                    [data setObject:rowStr forKey:@"row"];
                    [data setObject:valueStr forKey:@"value"];
                    
                    NSLog(@"%@",data);
                    // create table
                    [sqlite Delete:data];
                }else{
                    // insert into a table automatically
                    [script Delete:data];
                    
                    // insert data
                    [sqlite Delete:data];
                }
            }
            
            
            
            
            
            else if(a == 666){
                printf("GENERATE A DATABASE \n");
                
                // create table 1
                NSMutableDictionary * data_1 = [NSMutableDictionary dictionaryWithObjectsAndKeys: nil];
                [script CreateTable:data_1];
                [sqlite CreateTable:data_1];
                
                // create table 2
                NSMutableDictionary * data_2 = [NSMutableDictionary dictionaryWithObjectsAndKeys: nil];
                [script CreateTable_1:data_2];
                [sqlite CreateTable:data_2];
                
                // insert into table 1
                NSMutableDictionary * data_3 = [NSMutableDictionary dictionaryWithObjectsAndKeys: nil];
                [script Create_1:data_3];
                [sqlite Create:data_3];
                NSMutableDictionary * data_4 = [NSMutableDictionary dictionaryWithObjectsAndKeys: nil];
                [script Create_2:data_4];
                [sqlite Create:data_4];
                NSMutableDictionary * data_5 = [NSMutableDictionary dictionaryWithObjectsAndKeys: nil];
                [script Create_3:data_5];
                [sqlite Create:data_5];
                
                // insert into table 2
                NSMutableDictionary * data_6 = [NSMutableDictionary dictionaryWithObjectsAndKeys: nil];
                [script Create_4:data_6];
                [sqlite Create:data_6];
                NSMutableDictionary * data_7 = [NSMutableDictionary dictionaryWithObjectsAndKeys: nil];
                [script Create_5:data_7];
                [sqlite Create:data_7];
                NSMutableDictionary * data_8 = [NSMutableDictionary dictionaryWithObjectsAndKeys: nil];
                [script Create_6:data_8];
                [sqlite Create:data_8];
                
                
            }
            
        }while(a != 0);
        
        // log readData
        NSLog(@"DATAS: \n%@",readData);
        
        return 0;
        
        
        
        
        
        return(0);
        
        
    }
    return 0;
}
