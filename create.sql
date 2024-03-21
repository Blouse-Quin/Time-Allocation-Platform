create database Assignment;


create table Patients
(
    p_id int  primary key auto_increment comment '病人号',
    p_name varchar(20) not null comment '病人姓名',
    gender boolean not null comment '性别 0男 1女',
    card_id varchar(18) not null comment '身份证号',
    birthday date not null comment '出生日期',
    phone varchar(11) not null comment '手机号',
    homeAddress text comment '家庭住址',
    contactPerson varchar(20) comment '紧急联系人',
    contactPhone varchar(11) comment '紧急联系人手机号',
    relation varchar(12) comment '与病人关系'
)comment '病人';


create table Doctors
(
    d_id int  primary key auto_increment comment '职工号',
    d_name varchar(20) not null comment '医生姓名',
    gender boolean not null comment '性别 0男 1女',
    card_id varchar(18) not null comment '身份证号',
    birthday date not null comment '出生日期',
    phone varchar(11) not null comment '手机号',
    homeAddress text comment '家庭住址'
)comment '医生';

create table Items
(
    i_id int  primary key auto_increment comment '项目号',
    i_name varchar(50) not null comment '项目名',
    finishTime int not null comment '项目完成所需时间'
)comment '项目';

create table Processes
(
    pr_id int primary key auto_increment comment '流程号',
    startTime datetime not null comment '治疗流程的日期',
    p_id int not null comment '病人号',
    constraint FK_Pat_Pro foreign key (p_id)references Patients(p_id)
)comment '流程';

create table Process_Items
(
    id int primary key auto_increment,
    pr_id int not null comment '流程编号',
    i_id int not null comment '项目号',
    status int check ( status in (0,1,2,3)) not null comment '当前状态 0异常 1未启动 2进行中 3 结束',
    intervalTime int not null comment '项目间间隔的时间',
    num int not null comment '项目排序',
    foreign key (pr_id) references Processes (pr_id),
    foreign key (i_id) references Items(i_id)
)comment '流程所拥有项目';

create table Doctor_Item
(
    di_id int primary key auto_increment,
    d_id int not null comment '医生职工号',
    i_id int not null comment '项目号',
    constraint FK_DI_Do foreign key (d_id)references Doctors(d_id),
    constraint FK_DI_It foreign key (i_id)references Items(i_id)
)comment '医生项目关系表';

