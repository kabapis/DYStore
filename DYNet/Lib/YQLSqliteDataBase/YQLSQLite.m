//
//  YQLSQLite.m
//  DYNet
//
//  Created by Apple on 15/7/30.
//  Copyright (c) 2015年 Apple. All rights reserved.
//

#import "YQLSQLite.h"

@implementation YQLSQLite
@synthesize YQL_dbName;
@synthesize YQL_sqlite;
//给数据库取个名称
-(instancetype)initWithDBName:(NSString *)dbName{
    if (self==[super init]) {
        if ([self create_YqlDataBase:dbName]) {
            [self closeDataBase];
        }
    }
    return self;
}

//创建数据库
-(BOOL)create_YqlDataBase:(NSString *)database{
    YQL_dbName = database;
    NSArray * path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString * filePath = [path objectAtIndex:0];
    
    if (sqlite3_open([[filePath stringByAppendingPathComponent:database] UTF8String], &YQL_sqlite)!=SQLITE_OK) {
        return NO;
    }
    
    
    return YES;
}

//创建表
-(BOOL)create_YqlTable:(NSString *)yqlTable{
    
    if (![self create_YqlDataBase:YQL_dbName]) {
        return NO;
    }
    
    //创建表
    char * errorMSG;
    if (sqlite3_exec(YQL_sqlite, [yqlTable UTF8String], NULL, NULL, &errorMSG)!=SQLITE_OK) {
        return NO;
    }
    
    [self closeDataBase];
    
    return YES;
    
}


//关闭数据库
-(void)closeDataBase{
    sqlite3_close(YQL_sqlite);
}

//插入数据
-(BOOL)insertData:(NSString *)insertData{
    
    if (![self create_YqlDataBase:YQL_dbName]) {
        return NO;
    }
    
    char * errorMsg;
    if (sqlite3_exec(YQL_sqlite, [insertData UTF8String], NULL, NULL, &errorMsg)!=SQLITE_OK) {
        [self closeDataBase];
        return NO;
    }
    else
    {
        [self closeDataBase];
    }
    
    return YES;
}

//更新数据
-(BOOL)updateData:(NSString *)updateData{
    if (![self create_YqlDataBase:YQL_dbName]) {
        return NO;
    }
    char * errorMsg;
    
    if (sqlite3_exec(YQL_sqlite, [updateData UTF8String], NULL, NULL, &errorMsg)!=SQLITE_OK) {
        [self closeDataBase];
        return NO;
    }
    else
    {
        [self closeDataBase];
    }
    
    return YES;
}

//查询数据
-(NSArray *)queryTable:(NSString *)query{
    
    NSMutableArray * queryArray = [NSMutableArray array];
    
    if (![self create_YqlDataBase:YQL_dbName]) {
        return nil;
    }
    
    int row;
    int column;
    char * *pazResult = NULL;
    char * pzErrmsg = NULL;

    if (sqlite3_get_table(YQL_sqlite, [query UTF8String], &pazResult, &row, &column, &pzErrmsg)==SQLITE_OK) {
        
        //for the operation
        if (row==0) {
            [self closeDataBase];
            return nil;
        }
        
        
        for (int i=0; i<row; i++) {
            NSMutableDictionary * dic = [[NSMutableDictionary alloc] init];
            for (int j=0; j<column; j++) {
                NSString * key = [[NSString alloc] initWithUTF8String:[query UTF8String]];
                NSString * value = [[NSString alloc] initWithUTF8String:[query UTF8String]];
                [dic setValue:value forKey:key];
            }
            [queryArray addObject:dic];
        }
        
        
    }
    else
    {
        [self closeDataBase];
        return nil;
    }
    
    [self closeDataBase];
    return queryArray;
    
}

@end
