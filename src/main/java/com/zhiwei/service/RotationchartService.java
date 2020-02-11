package com.zhiwei.service;

import com.zhiwei.dao.RotationchartMapper;
import com.zhiwei.po.Rotationchart;
import com.zhiwei.resultBase.BaseResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RotationchartService {

    @Autowired
    RotationchartMapper rotationchartMapper;

    @Autowired
    private FileUploadService fileUploadService;


    /**
     * 信息录入
     */
    public BaseResult infoSaveService(Rotationchart rotationchart) {

        //查询数据库获取数据库里面的数据长度
        List<Rotationchart> list = rotationchartMapper.queryList();
        if(list.size()==0){
            rotationchart.setSort(1);
        }else{
            rotationchart.setSort(list.get(list.size()-1).getSort()+1);
        }


        if ("" != rotationchart.getUrl().trim() && null != rotationchart.getUrl()) {
            int result = rotationchartMapper.insert(rotationchart);
            if (result > 0) {
                return BaseResult.success();
            }
        }

        return BaseResult.error();

    }

    /**
     * 根据url删除
     */
    public BaseResult deleteByUrlService(String url) {
        if (url != null && url.trim() != "") {
            //删除服务器上的图片
            boolean b = fileUploadService.fileDelete(url);

            int result = rotationchartMapper.deleteByUrl(url);
            if (result > 0 || b == true) {
                return BaseResult.success();
            }
        }
        return BaseResult.error();
    }

    /**
     * 查询列表
     */
    public BaseResult queryListService() {
        List<Rotationchart> list = rotationchartMapper.queryList();
        return BaseResult.ok(list);
    }


    /**
     * 轮播图排序
     */
    public BaseResult sortService(int sortCode, int id) {
        //sortCode为1表示上升 2表示下降
        List<Rotationchart> list = rotationchartMapper.queryList();
        //
        Rotationchart rotationchart = new Rotationchart();

        for (int i = 0; i < list.size(); i++) {
            if (sortCode == 1) {
                if (list.get(i).getId() == id) {
                    if (i != 0) {
                        int sum =  list.get(i).getSort();
                        rotationchart.setId(id);
                        rotationchart.setSort(list.get(i - 1).getSort());
                        rotationchartMapper.updateSort(rotationchart);

                        //更新上一个
                        rotationchart.setId(list.get(i - 1).getId());
                        rotationchart.setSort(sum);
                        rotationchartMapper.updateSort(rotationchart);
                    } else {

                    }
                    return BaseResult.success();


                }


            } else if (sortCode == 2) {
                if (list.get(i).getId() == id) {
                    if (i != list.size()) {
                        int sum = list.get(i).getSort();
                        rotationchart.setId(id);
                        rotationchart.setSort(list.get(i + 1).getSort());
                        rotationchartMapper.updateSort(rotationchart);

                        //更新上一个
                        rotationchart.setId(list.get(i + 1).getId());
                        rotationchart.setSort(sum);
                        rotationchartMapper.updateSort(rotationchart);
                    } else {

                    }
                    return BaseResult.success();


                }


            }


        }

        return BaseResult.success();

    }

    /**
     * 通过id查询轮播图信息
     */
    public Rotationchart queryByIdService(Integer id){
        return    rotationchartMapper.queryById(id);

    }


    /**
     * 更新操作
     */
    public BaseResult updateService(Rotationchart rotationchart){
        int result =  rotationchartMapper.update(rotationchart);

        if(result>0){
            return   BaseResult.success();
        }else{
            return   BaseResult.error();
        }


    }

}
