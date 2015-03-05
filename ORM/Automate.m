//  Tomas Caufriez (167432)

//  Automate.m
//  ORM
//
//  Created by gofrette on 2/03/15.
//  Copyright (c) 2015 gofrette. All rights reserved.
//

#import <stdio.h>
#import "Automate.h"

@implementation Automate


-(id) Init{
    @autoreleasepool{
        return self;
    }
}

-(void) CreateTable: (NSMutableDictionary*)data{
    @autoreleasepool{
        NSMutableArray *rows = [NSMutableArray arrayWithObjects: nil];
        // set rows into array
        [rows addObject:@"ID bigint(20) NOT NULL PRIMARY KEY"];
        [rows addObject:@"username VARCHAR(255)"];
        [rows addObject:@"mail VARCHAR(255)"];
        [rows addObject:@"password VARCHAR(255)"];
        [rows addObject:@"firstname VARCHAR(255)"];
        [rows addObject:@"lastname VARCHAR(255)"];
        //set datas into dictionary
        [data setObject:@"users" forKey:@"table"];
        [data setObject:rows forKey:@"row"];
    }
}

-(void) DropTable: (NSMutableDictionary*)data{
    @autoreleasepool{
        //set datas into dictionary
        [data setObject:@"users" forKey:@"table"];
    }
}


-(void) Create: (NSMutableDictionary*)data{
    @autoreleasepool{
        
        NSMutableArray *rows = [NSMutableArray arrayWithObjects: nil];
        NSMutableArray *values = [NSMutableArray arrayWithObjects: nil];
        
        // set rows into array
        [rows addObject:@"ID"];
        [rows addObject:@"username"];
        [rows addObject:@"mail"];
        [rows addObject:@"password"];
        [rows addObject:@"firstname"];
        [rows addObject:@"lastname"];
        // set values into array
        [values addObject:@"1"];
        [values addObject:@"helloKitty"];
        [values addObject:@"coucou@gmail.com"];
        [values addObject:@"TgJ74k08"];
        [values addObject:@"John"];
        [values addObject:@"McLane"];
        //set datas into dictionary
        [data setObject:@"users" forKey:@"table"];
        [data setObject:rows forKey:@"row"];
        [data setObject:values forKey:@"value"];
        
    }
}


-(void) Read: (NSMutableDictionary*)data{
    @autoreleasepool{
        
        NSMutableArray *rows = [NSMutableArray arrayWithObjects: nil];
        
        // set rows into array
        [rows addObject:@"ID"];
        [rows addObject:@"username"];
        [rows addObject:@"mail"];
        [rows addObject:@"password"];
        [rows addObject:@"firstname"];
        [rows addObject:@"lastname"];
        //set datas into dictionary
        [data setObject:@"users" forKey:@"table"];
        [data setObject:rows forKey:@"row"];
    }
}


-(void) Update: (NSMutableDictionary*)data{
    @autoreleasepool {
        
        NSMutableArray *rows = [NSMutableArray arrayWithObjects: nil];
        NSMutableArray *values = [NSMutableArray arrayWithObjects: nil];
        
        // set rows into array
        [rows addObject:@"ID"];
        [rows addObject:@"username"];
        [rows addObject:@"mail"];
        [rows addObject:@"password"];
        [rows addObject:@"firstname"];
        [rows addObject:@"lastname"];
        // set values into array
        [values addObject:@"1"];
        [values addObject:@"CottonField"];
        [values addObject:@"whoolisthebest@gmail.com"];
        [values addObject:@"hhfskhl6675"];
        [values addObject:@"Jane"];
        [values addObject:@"FromTheBush"];
        //set datas into dictionary
        [data setObject:@"users" forKey:@"table"];
        [data setObject:rows forKey:@"row"];
        [data setObject:values forKey:@"value"];
        [data setObject:@"ID" forKey:@"whereRow"];
        [data setObject:@"2" forKey:@"whereValue"];
        
    }
}


-(void) Delete: (NSMutableDictionary*)data{
    @autoreleasepool {
        
        //set datas into dictionary
        [data setObject:@"users" forKey:@"table"];
        [data setObject:@"ID" forKey:@"row"];
        [data setObject:@"1" forKey:@"value"];
        
    }
}



-(void) CreateTable_1: (NSMutableDictionary*)data{
    @autoreleasepool{
        NSMutableArray *rows = [NSMutableArray arrayWithObjects: nil];
        // set rows into array
        [rows addObject:@"ID bigint(20) NOT NULL PRIMARY KEY"];
        [rows addObject:@"user_id bigint(20)"];
        [rows addObject:@"address_1 VARCHAR(255)"];
        [rows addObject:@"address_2 VARCHAR(255)"];
        [rows addObject:@"speed VARCHAR(255)"];
        [rows addObject:@"messenger VARCHAR(255)"];

        //set datas into dictionary
        [data setObject:@"orders" forKey:@"table"];
        [data setObject:rows forKey:@"row"];
    }
}

-(void) Create_1: (NSMutableDictionary*)data{
    @autoreleasepool{
        
        NSMutableArray *rows = [NSMutableArray arrayWithObjects: nil];
        NSMutableArray *values = [NSMutableArray arrayWithObjects: nil];
        
        // set rows into array
        [rows addObject:@"ID"];
        [rows addObject:@"username"];
        [rows addObject:@"mail"];
        [rows addObject:@"password"];
        [rows addObject:@"firstname"];
        [rows addObject:@"lastname"];
        // set values into array
        [values addObject:@"1"];
        [values addObject:@"helloKitty"];
        [values addObject:@"coucou@gmail.com"];
        [values addObject:@"TgJ74k08"];
        [values addObject:@"John"];
        [values addObject:@"McLane"];
        //set datas into dictionary
        [data setObject:@"users" forKey:@"table"];
        [data setObject:rows forKey:@"row"];
        [data setObject:values forKey:@"value"];
        
    }
}

-(void) Create_2: (NSMutableDictionary*)data{
    @autoreleasepool{
        
        NSMutableArray *rows = [NSMutableArray arrayWithObjects: nil];
        NSMutableArray *values = [NSMutableArray arrayWithObjects: nil];
        
        // set rows into array
        [rows addObject:@"ID"];
        [rows addObject:@"username"];
        [rows addObject:@"mail"];
        [rows addObject:@"password"];
        [rows addObject:@"firstname"];
        [rows addObject:@"lastname"];
        // set values into array
        [values addObject:@"2"];
        [values addObject:@"helloKat"];
        [values addObject:@"jen666@gmail.com"];
        [values addObject:@"TgJ74k08"];
        [values addObject:@"Jennifer"];
        [values addObject:@"Lawrence"];
        //set datas into dictionary
        [data setObject:@"users" forKey:@"table"];
        [data setObject:rows forKey:@"row"];
        [data setObject:values forKey:@"value"];
        
    }
}

-(void) Create_3: (NSMutableDictionary*)data{
    @autoreleasepool{
        
        NSMutableArray *rows = [NSMutableArray arrayWithObjects: nil];
        NSMutableArray *values = [NSMutableArray arrayWithObjects: nil];
        
        // set rows into array
        [rows addObject:@"ID"];
        [rows addObject:@"username"];
        [rows addObject:@"mail"];
        [rows addObject:@"password"];
        [rows addObject:@"firstname"];
        [rows addObject:@"lastname"];
        // set values into array
        [values addObject:@"3"];
        [values addObject:@"CoucouMonJoli"];
        [values addObject:@"belledu69@gmail.com"];
        [values addObject:@"TgJ74k08"];
        [values addObject:@"Amelia"];
        [values addObject:@"Earhart"];
        //set datas into dictionary
        [data setObject:@"users" forKey:@"table"];
        [data setObject:rows forKey:@"row"];
        [data setObject:values forKey:@"value"];
        
    }
}

-(void) Create_4: (NSMutableDictionary*)data{
    @autoreleasepool{
        
        NSMutableArray *rows = [NSMutableArray arrayWithObjects: nil];
        NSMutableArray *values = [NSMutableArray arrayWithObjects: nil];
        
        // set rows into array
        [rows addObject:@"ID"];
        [rows addObject:@"user_id"];
        [rows addObject:@"address_1"];
        [rows addObject:@"address_2"];
        [rows addObject:@"speed"];
        [rows addObject:@"messenger"];
        // set values into array
        [values addObject:@"1"];
        [values addObject:@"2"];
        [values addObject:@"somewhere called here"];
        [values addObject:@"maybe there"];
        [values addObject:@"300 000 000 km/s"];
        [values addObject:@"Jane"];
        //set datas into dictionary
        [data setObject:@"orders" forKey:@"table"];
        [data setObject:rows forKey:@"row"];
        [data setObject:values forKey:@"value"];
        
    }
}

-(void) Create_5: (NSMutableDictionary*)data{
    @autoreleasepool{
        
        NSMutableArray *rows = [NSMutableArray arrayWithObjects: nil];
        NSMutableArray *values = [NSMutableArray arrayWithObjects: nil];
        
        // set rows into array
        [rows addObject:@"ID"];
        [rows addObject:@"user_id"];
        [rows addObject:@"address_1"];
        [rows addObject:@"address_2"];
        [rows addObject:@"speed"];
        [rows addObject:@"messenger"];
        // set values into array
        [values addObject:@"2"];
        [values addObject:@"1"];
        [values addObject:@"somewhere called here again"];
        [values addObject:@"...or there"];
        [values addObject:@"-300 000 km/s"];
        [values addObject:@"McLeod"];
        //set datas into dictionary
        [data setObject:@"orders" forKey:@"table"];
        [data setObject:rows forKey:@"row"];
        [data setObject:values forKey:@"value"];
        
    }
}

-(void) Create_6: (NSMutableDictionary*)data{
    @autoreleasepool{
        
        NSMutableArray *rows = [NSMutableArray arrayWithObjects: nil];
        NSMutableArray *values = [NSMutableArray arrayWithObjects: nil];
        
        // set rows into array
        [rows addObject:@"ID"];
        [rows addObject:@"user_id"];
        [rows addObject:@"address_1"];
        [rows addObject:@"address_2"];
        [rows addObject:@"speed"];
        [rows addObject:@"messenger"];
        // set values into array
        [values addObject:@"3"];
        [values addObject:@"3"];
        [values addObject:@"somewhere called here, yes again again"];
        [values addObject:@"...or...or there"];
        [values addObject:@"10 km/week"];
        [values addObject:@"TurtleNinja"];
        //set datas into dictionary
        [data setObject:@"orders" forKey:@"table"];
        [data setObject:rows forKey:@"row"];
        [data setObject:values forKey:@"value"];
        
    }
}



@end
