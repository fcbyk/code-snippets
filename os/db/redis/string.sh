# Redis 中与字符串（String）相关的命令是用于对单个值进行存储、获取和操作的命令集合。

# SET key value [EX seconds] [PX milliseconds] [NX|XX]
# 设置指定 key 的值为指定的 value。
# 可选参数：
# EX seconds：设置键的过期时间，单位为秒。
# PX milliseconds：设置键的过期时间，单位为毫秒。
# NX：仅当键不存在时设置键的值。
# XX：仅当键已经存在时设置键的值。
set hello 123456

# GET key
# 获取指定 key 的值
get hello

# DEL key [key ...]
# 删除一个或多个 key
del hello

# MSET key value [key value ...]
# 同时设置一个或多个 key-value 对
mset key1 value1 key2 value2

# MGET key [key ...]
# 获取所有给定 key 的值
mget key1 key2

# SETNX key value
# 只有在 key 不存在时设置 key 的值为 value
setnx hello 22323

# SETEX KEY_NAME TIMEOUT VALUE
# Redis Setex 命令为指定的 key 设置值及其过期时间。如果 key 已经存在， SETEX 命令将会替换旧的值。
setex mykey 60 redis
