# Redis hash 是一个 string 类型的 field（字段） 和 value（值） 的映射表，hash 特别适合用于存储对象。

# HSET key field value
# 设置哈希表 key 中的字段 field 的值为 value。如果 key 不存在，一个新的哈希表被创建并进行 HSET 操作。如果字段 field 已经存在于哈希表中，旧值将被覆盖
hest myhash field1 "Hello"

# HGET key field
# 获取存储在哈希表中指定字段的值
HGET myhash field1

# HMSET key field1 value1 [field2 value2 ]
# 同时将多个 field-value (域-值)对设置到哈希表 key 中
hmset runoobkey name "redis tutorial" description "redis basic commands for caching" likes 20 visitors 23000
hmget myhash field1 "Hello" field2 "World"

# HMGET key field1 [field2 ...]
# 获取所有给定字段的值
hmget myhash field1 field2

# HLEN key
# 获取哈希表中字段的数量
HLEN myhash

