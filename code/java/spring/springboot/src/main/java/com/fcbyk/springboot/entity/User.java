package com.fcbyk.springboot.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

// #region index
@Data
@TableName("`user`")
public class User {
    private Long id;
    private String name;
    private Integer age;
    private String email;
}
// #endregion index