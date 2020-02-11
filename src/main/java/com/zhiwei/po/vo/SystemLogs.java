package com.zhiwei.po.vo;


import org.springframework.web.bind.annotation.Mapping;

import java.lang.annotation.*;

@Retention(RetentionPolicy.RUNTIME)
@Target({ElementType.METHOD, ElementType.TYPE})
@Documented
@Mapping
public @interface SystemLogs {
}
