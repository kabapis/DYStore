//
//  YQLSQLite.h
//  DYNet
//
//  Created by Apple on 15/7/30.
//  Copyright (c) 2015年 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3/sqlite3.h>
@interface YQLSQLite : NSObject
{
    sqlite3 * YQL_sqlite;
    NSString * YQL_dbName;
}
@property (nonatomic)sqlite3 * YQL_sqlite;
@property (nonatomic ,strong ,readonly)NSString * YQL_dbName;
//给数据库取个名称
-(instancetype)initWithDBName:(NSString *)dbName;

//创建数据库
-(BOOL)create_YqlDataBase:(NSString *)database;

//创建表
-(BOOL)create_YqlTable:(NSString *)yqlTable;


//关闭数据库
-(void)closeDataBase;

//插入数据
-(BOOL)insertData:(NSString *)insertData;

//更新数据
-(BOOL)updateData:(NSString *)updateData;

//查询数据
-(NSArray *)queryTable:(NSString *)query;

@end
