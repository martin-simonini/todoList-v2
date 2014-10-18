# --- Created by Ebean DDL
# To stop Ebean DDL generation, remove this comment and start using Evolutions

# --- !Ups

create table project (
  id                        bigint not null,
  name                      varchar(255),
  user_email                varchar(255),
  constraint pk_project primary key (id))
;

create table task (
  id                        bigint not null,
  title                     varchar(255),
  done                      boolean,
  due_date                  timestamp,
  project_id                bigint,
  constraint pk_task primary key (id))
;

create table user (
  email                     varchar(255) not null,
  username                  varchar(255),
  password                  varchar(255),
  constraint pk_user primary key (email))
;

create sequence project_seq;

create sequence task_seq;

create sequence user_seq;

alter table project add constraint fk_project_user_1 foreign key (user_email) references user (email) on delete restrict on update restrict;
create index ix_project_user_1 on project (user_email);
alter table task add constraint fk_task_project_2 foreign key (project_id) references project (id) on delete restrict on update restrict;
create index ix_task_project_2 on task (project_id);



# --- !Downs

SET REFERENTIAL_INTEGRITY FALSE;

drop table if exists project;

drop table if exists task;

drop table if exists user;

SET REFERENTIAL_INTEGRITY TRUE;

drop sequence if exists project_seq;

drop sequence if exists task_seq;

drop sequence if exists user_seq;
