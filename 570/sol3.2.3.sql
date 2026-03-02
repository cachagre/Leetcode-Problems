# Write your MySQL query statement below

# 外层查询：从统计结果中筛选出下属数≥5的经理姓名
select 
    name  # 最终输出的经理姓名
from (
    # 子查询（临时表temp）：统计每个经理的直接下属数量
    select 
        manager.name,  # 经理的姓名
        count(emp.id) as cnt  # 统计该经理的直接下属人数，别名cnt（count缩写）
    from 
        Employee as manager  # 将Employee表别名化为manager，代表“经理”角色
        join Employee as emp  # 自连接Employee表，别名化为emp，代表“下属/员工”角色
        on manager.id = emp.managerId  # 连接条件：经理的ID = 下属的经理ID（匹配上下级关系）
    group by 
        manager.id  # 按经理ID分组（ID唯一，避免重名导致统计错误），统计每个经理的下属数
) as temp  # 给子查询结果起别名temp（临时表），供外层查询使用
where 
    cnt >= 5;  # 筛选条件：只保留下属数量≥5的经理
