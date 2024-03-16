create table Users(
    user_id int primary key,
    user_name varchar(50) not null,
    password varchar(50) not null,
    privilege varchar(50) check ( privilege in ('admin','patience','doctor') ) -- 多类型用户用于公开线上平台和内网管理员修改
);
Create table UserDetails( -- 用户个人信息，如真实姓名身份证号等，同样用于真实上线的平台，需要完善

);
Create table TreatmentRoom( -- 诊疗室信息,暂且只支持事先录入，也可以添加功能
    room_id int primary key,
    room_name varchar(50) not null,
    room_location varchar(100) not null,
    room_capacity int check(room_capacity >= 0) not null --诊疗室容量，也可用于判断是否空闲
);
Create table Schedules( -- 排班信息
    schedule_id int primary key,
    patience_id int not null,
    doctor_id int not null,
    treatroom_id int not null,
    starttime date , -- 开始时间
    endtime date,  -- 结束时间
    schedule_status varchar(30) -- 排班状态（要添加约束为限定的几个值，如等待，正在处理，已过期/完成）
    /*
        预期效果：
            第x个人等叫号，当前叫第x-1个人(第x-1个人还在使用诊疗室)
            一旦诊疗室空余，就叫第x个人的号（排班计划可以按开始时间排序）
            【这是一个异步过程，刚开始上班/送走诊疗室病人使得有空余的时候，系统检查一遍诊疗室的下一个排班安排然后叫号】
    */
);