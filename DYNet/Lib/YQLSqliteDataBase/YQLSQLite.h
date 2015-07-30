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

//创建数据库


//创建表

//关闭数据库

//插入数据

//更新数据

//查询数据

@end
