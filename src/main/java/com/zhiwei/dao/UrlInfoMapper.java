package com.zhiwei.dao;


import com.zhiwei.po.UrlInfo;
import org.springframework.stereotype.Repository;

@Repository
public interface UrlInfoMapper {
    UrlInfo query();
}
