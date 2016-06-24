//
//  DemoEntity.m
//  CoreDataExamples
//
//  Created by Saheb Roy on 23/06/16.
//  Copyright © 2016 OrderOfTheLight. All rights reserved.
//

#import "SRCoreDataSingleton.h"
#import "DemoEntity.h"

@implementation DemoEntity

+(BOOL)insertchunkwithBlock{
    
    
    /*
     Test this in a short way
     
        for (int i=0; i<10; i++) {
            NSLog(@"Insert Start %i",i);
            sleep(1);
            NSLog(@"Insert! %i",i);
        }
        NSLog(@"Insert Finished");
        return YES;
     
    */
    
    NSManagedObjectContext *managedContext = [SRCoreDataSingleton sharedInstance].managedObjectContext;
    NSLog(@"S Insert!");
    for (int i=0; i<10000; i++) {
        DemoEntity  *demoObj = [NSEntityDescription insertNewObjectForEntityForName:@"DemoEntity"
                                                             inManagedObjectContext:managedContext];
        demoObj.number = [NSString stringWithFormat:@"Number - %i",i];
    }
    NSError *error;
    NSLog(@"F Insert!");
    if([managedContext save:&error]){
        return YES;
    }
    return NO;
    
    
}

+ (NSArray *)getAllData{
    
    /*
        Test this in a short way
     
        for (int i=0; i<10; i++) {
            NSLog(@"Fetch Start %i",i);
            sleep(1);
            NSLog(@"Fetch! %i",i);
        }
        NSLog(@"Fetch Finished");
        return nil;
     
    */
    
    NSLog(@"S FETCH!");
    
    NSArray *fetchedArray = nil;
    
    
    NSManagedObjectContext *managedContext = [SRCoreDataSingleton sharedInstance].managedObjectContext;
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"DemoEntity" inManagedObjectContext:managedContext];
    [fetchRequest setEntity:entity];
    NSError *error = nil;
    fetchedArray = [managedContext executeFetchRequest:fetchRequest error:&error];
    NSLog(@"F ENDED");
    if(!error){
        return fetchedArray;
    }
    else
        return nil;
}


-(BOOL)deleteEntity{
    
    NSManagedObjectContext *context = [SRCoreDataSingleton sharedInstance].managedObjectContext;
    [context deleteObject:self];
    NSError *err;
    [context save:&err];
    
    return YES;
}




@end
