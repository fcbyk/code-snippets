# Redis hash 是一个 string 类型的 field（字段） 和 value（值） 的映射表，hash 特别适合用于存储对象。

# region hash
hset myhash field1 "Hello"
hget myhash field1

hmset runoobkey name "redis tutorial" description "redis basic commands for caching" likes 20 visitors 23000
hmset myhash field1 "Hello" field2 "World"

hmget myhash field1 field2

HLEN myhash
# endregion hash
