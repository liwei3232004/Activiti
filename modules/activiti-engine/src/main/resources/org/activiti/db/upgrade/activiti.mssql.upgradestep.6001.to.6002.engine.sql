create table ACT_RU_TIMER_JOB (
    ID_ nvarchar(64) NOT NULL,
  	REV_ int,
    TYPE_ nvarchar(255) NOT NULL,
    LOCK_EXP_TIME_ datetime,
    LOCK_OWNER_ nvarchar(255),
    EXCLUSIVE_ bit,
    EXECUTION_ID_ nvarchar(64),
    PROCESS_INSTANCE_ID_ nvarchar(64),
    PROC_DEF_ID_ nvarchar(64),
    RETRIES_ int,
    EXCEPTION_STACK_ID_ nvarchar(64),
    EXCEPTION_MSG_ nvarchar(4000),
    DUEDATE_ datetime NULL,
    REPEAT_ nvarchar(255),
    HANDLER_TYPE_ nvarchar(255),
    HANDLER_CFG_ nvarchar(4000),
    TENANT_ID_ nvarchar(255) default '',
    primary key (ID_)
);

create table ACT_RU_SUSPENDED_JOB (
    ID_ nvarchar(64) NOT NULL,
  	REV_ int,
    TYPE_ nvarchar(255) NOT NULL,
    EXCLUSIVE_ bit,
    EXECUTION_ID_ nvarchar(64),
    PROCESS_INSTANCE_ID_ nvarchar(64),
    PROC_DEF_ID_ nvarchar(64),
    RETRIES_ int,
    EXCEPTION_STACK_ID_ nvarchar(64),
    EXCEPTION_MSG_ nvarchar(4000),
    DUEDATE_ datetime NULL,
    REPEAT_ nvarchar(255),
    HANDLER_TYPE_ nvarchar(255),
    HANDLER_CFG_ nvarchar(4000),
    TENANT_ID_ nvarchar(255) default '',
    primary key (ID_)
);

create table ACT_RU_DEADLETTER_JOB (
    ID_ nvarchar(64) NOT NULL,
  	REV_ int,
    TYPE_ nvarchar(255) NOT NULL,
    EXCLUSIVE_ bit,
    EXECUTION_ID_ nvarchar(64),
    PROCESS_INSTANCE_ID_ nvarchar(64),
    PROC_DEF_ID_ nvarchar(64),
    RETRIES_ int,
    EXCEPTION_STACK_ID_ nvarchar(64),
    EXCEPTION_MSG_ nvarchar(4000),
    DUEDATE_ datetime NULL,
    REPEAT_ nvarchar(255),
    HANDLER_TYPE_ nvarchar(255),
    HANDLER_CFG_ nvarchar(4000),
    TENANT_ID_ nvarchar(255) default '',
    primary key (ID_)
);

create index ACT_IDX_JOB_EXECUTION_ID on ACT_RU_JOB(EXECUTION_ID_);
create index ACT_IDX_JOB_PROCESS_INSTANCE_ID on ACT_RU_JOB(PROCESS_INSTANCE_ID_);
create index ACT_IDX_JOB_PROC_DEF_ID on ACT_RU_JOB(PROC_DEF_ID_);
create index ACT_IDX_TIMER_JOB_EXECUTION_ID on ACT_RU_TIMER_JOB(EXECUTION_ID_);
create index ACT_IDX_TIMER_JOB_PROCESS_INSTANCE_ID on ACT_RU_TIMER_JOB(PROCESS_INSTANCE_ID_);
create index ACT_IDX_TIMER_JOB_PROC_DEF_ID on ACT_RU_TIMER_JOB(PROC_DEF_ID_);
create index ACT_IDX_TIMER_JOB_EXCEPTION_STACK_ID on ACT_RU_TIMER_JOB(EXCEPTION_STACK_ID_);
create index ACT_IDX_SUSPENDED_JOB_EXECUTION_ID on ACT_RU_SUSPENDED_JOB(EXECUTION_ID_);
create index ACT_IDX_SUSPENDED_JOB_PROCESS_INSTANCE_ID on ACT_RU_SUSPENDED_JOB(PROCESS_INSTANCE_ID_);
create index ACT_IDX_SUSPENDED_JOB_PROC_DEF_ID on ACT_RU_SUSPENDED_JOB(PROC_DEF_ID_);
create index ACT_IDX_SUSPENDED_JOB_EXCEPTION_STACK_ID on ACT_RU_SUSPENDED_JOB(EXCEPTION_STACK_ID_);
create index ACT_IDX_DEADLETTER_JOB_EXECUTION_ID on ACT_RU_DEADLETTER_JOB(EXECUTION_ID_);
create index ACT_IDX_DEADLETTER_JOB_PROCESS_INSTANCE_ID on ACT_RU_DEADLETTER_JOB(PROCESS_INSTANCE_ID_);
create index ACT_IDX_DEADLETTER_JOB_PROC_DEF_ID on ACT_RU_DEADLETTER_JOB(PROC_DEF_ID_);
create index ACT_IDX_DEADLETTER_JOB_EXCEPTION_STACK_ID on ACT_RU_DEADLETTER_JOB(EXCEPTION_STACK_ID_);

alter table ACT_RU_JOB 
    add constraint ACT_FK_JOB_EXECUTION 
    foreign key (EXECUTION_ID_) 
    references ACT_RU_EXECUTION (ID_);
    
alter table ACT_RU_JOB 
    add constraint ACT_FK_JOB_PROCESS_INSTANCE 
    foreign key (PROCESS_INSTANCE_ID_) 
    references ACT_RU_EXECUTION (ID_);
    
alter table ACT_RU_JOB 
    add constraint ACT_FK_JOB_PROC_DEF
    foreign key (PROC_DEF_ID_) 
    references ACT_RE_PROCDEF (ID_);
    
alter table ACT_RU_TIMER_JOB 
    add constraint ACT_FK_TIMER_JOB_EXECUTION 
    foreign key (EXECUTION_ID_) 
    references ACT_RU_EXECUTION (ID_);
    
alter table ACT_RU_TIMER_JOB 
    add constraint ACT_FK_TIMER_JOB_PROCESS_INSTANCE 
    foreign key (PROCESS_INSTANCE_ID_) 
    references ACT_RU_EXECUTION (ID_);
    
alter table ACT_RU_TIMER_JOB 
    add constraint ACT_FK_TIMER_JOB_PROC_DEF
    foreign key (PROC_DEF_ID_) 
    references ACT_RE_PROCDEF (ID_);
    
alter table ACT_RU_TIMER_JOB 
    add constraint ACT_FK_TIMER_JOB_EXCEPTION 
    foreign key (EXCEPTION_STACK_ID_) 
    references ACT_GE_BYTEARRAY (ID_);
    
alter table ACT_RU_SUSPENDED_JOB 
    add constraint ACT_FK_SUSPENDED_JOB_EXECUTION 
    foreign key (EXECUTION_ID_) 
    references ACT_RU_EXECUTION (ID_);
    
alter table ACT_RU_SUSPENDED_JOB 
    add constraint ACT_FK_SUSPENDED_JOB_PROCESS_INSTANCE 
    foreign key (PROCESS_INSTANCE_ID_) 
    references ACT_RU_EXECUTION (ID_);
    
alter table ACT_RU_SUSPENDED_JOB 
    add constraint ACT_FK_SUSPENDED_JOB_PROC_DEF
    foreign key (PROC_DEF_ID_) 
    references ACT_RE_PROCDEF (ID_);
    
alter table ACT_RU_SUSPENDED_JOB 
    add constraint ACT_FK_SUSPENDED_JOB_EXCEPTION 
    foreign key (EXCEPTION_STACK_ID_) 
    references ACT_GE_BYTEARRAY (ID_);
    
alter table ACT_RU_DEADLETTER_JOB 
    add constraint ACT_FK_DEADLETTER_JOB_EXECUTION 
    foreign key (EXECUTION_ID_) 
    references ACT_RU_EXECUTION (ID_);
    
alter table ACT_RU_DEADLETTER_JOB 
    add constraint ACT_FK_DEADLETTER_JOB_PROCESS_INSTANCE 
    foreign key (PROCESS_INSTANCE_ID_) 
    references ACT_RU_EXECUTION (ID_);
    
alter table ACT_RU_DEADLETTER_JOB 
    add constraint ACT_FK_DEADLETTER_JOB_PROC_DEF
    foreign key (PROC_DEF_ID_) 
    references ACT_RE_PROCDEF (ID_);
    
alter table ACT_RU_DEADLETTER_JOB 
    add constraint ACT_FK_DEADLETTER_JOB_EXCEPTION 
    foreign key (EXCEPTION_STACK_ID_) 
    references ACT_GE_BYTEARRAY (ID_);

alter table ACT_RU_EXECUTION add START_TIME_ datetime;
alter table ACT_RU_EXECUTION add START_USER_ID_ nvarchar(255);
alter table ACT_RU_TASK add CLAIM_TIME_ datetime;

update ACT_GE_PROPERTY set VALUE_ = '6.0.0.2' where NAME_ = 'schema.version';
