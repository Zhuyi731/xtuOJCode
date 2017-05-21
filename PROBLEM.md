# XTU OJ Code
## problem 
### connect to judge system
 1. 后台如何连接判题端？
    * 判题端是通过数据库连接。

### database relation
1.  actions, action_groups, validator表的功能是？
    * actions是功能表，action_groups是功能组表，这两个表示用来配置用户权限和显示菜单的，actions相当于功能权限，action_groups相当于功能组菜单。
     > 权限控制，显示菜单是根据用户的角色来定义的，并没有通过这些表。

    * validator是存放比较器的，判题端会调用对应的比较器来判题。
2.  clarifications（比赛问答表）不需要存回答者的user_id么?
    * 比赛的回答者是裁判，就是比赛的创建者，不用存吧？如果你觉得需要，可以加字段。
    > 之前想的是不仅是裁判可以回答，比赛的人也可以相互交流，相互留言。如果只是裁判回答的话，那就不需要了。
3.  contest_detail.accepted_time 类型不是datetime而是mediumint类型？
    * 这个是存在的偏移时间，方便计算penalty

4.  result表中result_code是如何定义的？暂时定义如下
    1. Accept
    2. Wrong Answer
    3. Compile Error
    4. Runtime Error
    5. Presentation Error
    6. Time Limit Exceed
    7. Memory Exceed Exceed
    8. Output Limit Exceed
    9. Running
    10. pending

    * 这个可以自行定义吧，你们这个也可以。但是msg我的想法，可能 接近于codeforces的那种。

5.  runs表中result_msg 和result表中msg_en, msg_cn这是需要做国际化吗？

    * 考虑到中文，英文的界面，为扩展留下的。

6.  problems.problem_id id进行自增添加题目？

    *  `problem_id` MEDIUMINT(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '题目ID',

7.  数据库表中：
> problems.author作者,
> testdatas.owner(上传者),
> problems.owner(题目传人),
> clarifications.owner(提问人),
> user_id(用户ID)

字段的关系是怎么样？都是user_id值么？
* author是字符串，其他对应的都是user_id。testdatas.owner考虑到以后可以由用户提交补充的测试数据，现阶段是题目上传人上传的数据，所以是题目上传人。

2. 判题端更新数据的时候需要那些表，以及表里面的那些字段？表会更新那些表的那些字段？
* update (`tot_score`,`ac_problems_num`,`penalty`) on contest_ranklist;
* insert or update(`run_time`,`run_memory`,`result_code`) on judge;
* update (`run_time`,`run_memory`,`result_code`,`result_msg`) on runs;


1. 公告是否需要新建一个表？现在只是在contests表里面有比赛公告！
   * 公告我的想法是直接一个html片段，所以就只弄了一个字段，这样简单些。你的意思是要做个类似于发布管理子功能？

     > 我们考虑到每场考试，竞赛都可能会拥有不同的公告，而且不止一个公告，所以就想到是否需要一个公告的表！


### function
1.  是否需要注册？
    * 这个注册指什么？
     > 用户自己注册帐号

2.  判题验证器ID这是用来干什么的？
    * ID表明不同的验证器呀，比如普通的文本比较验证器，各种浮点进度验证器，某些题目的特判验证器。因为有些题目的判题验证器可以复用，所以单独用一个表来存。
     > 这么说这个我们不需要管?

3.  公告不用单独存入一个数据库表里面么？
    * 这个见之前的回答。

4.  如何判断程序是否已经运行过了，那些正在运行，那些还在等待?

### 说明：
1.  没有用到的表：
    * action_groups 没有用到
    * actions 没有用到
    * clarifications 这部分功能还没做
    * prints 这部分功能还没做
    * problem_set_detail 没有用到 这个是由老师或者管理员创建的 
    * problem_sets 没有用到 这个是由老师或者管理员创建的 
    * judge 没有用到
    * validator 没有用到

> 现在做的比较简单，初步解决方案：以后迭代！

### web pages relation solve by zhuyi
1. submit must add a field open choose options! ok
2. add a page about cat code details! ok
3. back stage management url links to /info rather than /role_string/info. ok
4. url with users management must add page start. ok
5. back stage management about display of test detail, must remove the navigation. ok


### web java relation solve by panshuai
1. cat source code must consider situation in period of contest. do a condition filter. ok
2. status result vo change the output. ok

