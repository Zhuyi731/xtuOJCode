# xtuOJCode
## problem 
### connect to judge system
 1. 后台如何连接判题端？
    * 判题端是通过数据库连接。

### database relation
1. actions, action_groups, validator表的功能是？
2. clarifications（比赛问答表）不需要存回答者的user_id么?
3. contest_detail.accepted_time 类型不是datetime而是mediumint类型？

4. result表中resultcode是如何定义的？暂时定义如下
    1. Wrong Answer
    2. Compile Error
    3. Runtime Error
    4. Presentation Error
    5. Time Limit Exceed
    6. Memory Exceed Exceed
    7. Output Limit Exceed

5. runs表中result_msg 和result表中msg_en, msg_cn这是需要做国际化吗？

6. problems.problem_id id进行自增添加题目？
7. 数据库表中：
> problems.author作者,
> testdatas.owner(上传者),
> problems.owner(题目传人),
> clarifications.owner(提问人),
> user_id(用户ID)

字段的关系是怎么样？都是user_id值么？

2. 判题端更新数据的时候需要那些表，以及表里面的那些字段？表会更新那些表的那些字段？
* update (`tot_score`,`ac_problems_num`,`penalty`) on contest_ranklist;
* insert or update(`run_time`,`run_memory`,`result_code`) on judge;
* update (`run_time`,`run_memory`,`result_code`,`result_msg`) on runs;


1. 公告是否需要新建一个表？现在只是在contests表里面有比赛公告！

### function
1. 是否需要注册？
2. 判题验证器ID这是用来干什么的？
3. 公告不用单独存入一个数据库表里面么？

### 说明：
1. 没有用到problem_sets(题目集表)暂时是谁创建了，直接指定创建者！

### web pages relation solve by zhuyi
1. submit must add a field open choose options
2. add a page about cat code details!

### web java relation solve by panshuai
1. cat source code must consider situation in period of contest. do a condition filter.
2. status result vo change the output.

