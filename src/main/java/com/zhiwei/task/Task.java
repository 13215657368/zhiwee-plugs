package com.zhiwei.task;

import com.zhiwei.dao.SystemLogMapper;
import com.zhiwei.po.SystemLog;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.util.Date;
import java.util.List;

@Component
public class Task {


    @Autowired
    private SystemLogMapper systemLogMapper;

      /**
       * @Author: jick
       * @Date: 2019/11/22 16:05
       * 定时清除日志
       */
     @Scheduled(cron="0 0 1 1/7 * ? ")
    public void   task() {
         SystemLog  systemLog = new SystemLog();
         systemLog.setTime(new Date());
         systemLogMapper.deleteListByDate(systemLog);

    }

}
