# SET key value [EX seconds] [PX milliseconds] [NX|XX]
# 设置指定 key 的值为指定的 value。
# 可选参数：
# EX seconds：设置键的过期时间，单位为秒。
# PX milliseconds：设置键的过期时间，单位为毫秒。
# NX：仅当键不存在时设置键的值。
# XX：仅当键已经存在时设置键的值。

# region string
set hello 123456
get hello
del hello

mset key1 value1 key2 value2
mget key1 key2

setnx hello 22323
setex mykey 60 redis
# endregion string
