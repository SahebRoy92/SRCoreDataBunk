//
//  MenuVC.m
//  SRCoreDataManager-Serial
//
//  Created by Saheb Roy on 22/06/16.
//  Copyright © 2016 OrderOfTheLight. All rights reserved.
//

#import "MenuVC.h"
#import "CDSerialBackgroundExampleVC.h"


@interface MenuVC()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation MenuVC{
    NSArray *allMenu;
    NSDictionary *selectedMenu;
}

-(void)viewDidLoad{
    NSString *url = [[NSBundle mainBundle]pathForResource:@"AllCoreDataMenu" ofType:@"plist"];
    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:url];
    allMenu = dict[@"allmenu"];
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return allMenu.count;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *reuse = @"cell";
    UITableViewCell *cell ;
    
    cell = [tableView dequeueReusableCellWithIdentifier:reuse];
    cell.textLabel.text = [allMenu[indexPath.row] objectForKey:@"name"];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    selectedMenu = allMenu[indexPath.row];
    
    if([[selectedMenu objectForKey:@"name"]isEqualToString:@"Serial Core Data Functions"]){
          [self performSegueWithIdentifier:@"toAsyncSerialCDtestVC" sender:self];
    }
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if([[segue destinationViewController]isKindOfClass:[CDSerialBackgroundExampleVC class]]){
        CDSerialBackgroundExampleVC *vc = [segue destinationViewController];
        vc.dict = selectedMenu;
    }
}

@end
