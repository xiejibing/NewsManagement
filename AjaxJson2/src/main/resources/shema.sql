drop database if exisits db_baosi;
use db_baosi;
drop table if exists t_administrator;
create table t_administrator
(
    admin_id               int not null auto_increment comment'管理员id',
    admin_name             varchar(20) comment '管理员姓名',
    admin_password         varchar(20)comment '管理员密码',
    primary key (admin_id)
);

/*
插入数据
 */
insert into t_administrator(admin_name,admin_password)values
('admin','1234');

-- 创建新闻表
drop table if exists t_news;
create table t_news
(
    new_id      int auto_increment
        primary key,
    title       varchar(100)                        not null comment '新闻标题',
    catagory_id int                                 not null comment '新闻分类',
    keywords    varchar(120)                        not null comment '关键词',
    content     text                                not null comment '新闻内容',
    create_time timestamp default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '时间戳，创建和更新时更新时间'
)
    comment '新闻表';

