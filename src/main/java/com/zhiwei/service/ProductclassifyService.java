package com.zhiwei.service;

import com.zhiwei.dao.ProductclassifyMapper;
import com.zhiwei.po.Productclassify;
import com.zhiwei.resultBase.BaseResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductclassifyService {

    @Autowired
    private ProductclassifyMapper  productclassifyMapper;


    /**
     * 信息录入
     */
    public BaseResult infoSaveService(Productclassify productclassify){

         //非空判断
        if(productclassify.getName()!=null&&productclassify.getName().trim()!=""){
          int result=productclassifyMapper.insert(productclassify);

            if (result>0){
                return   BaseResult.success();
            }

        }

        return BaseResult.error();

    }

    /**
     * 更新操作
     */

    public BaseResult infoUpdateService(Productclassify productclassify){

        //非空判断
        if(productclassify.getName()!=null&&productclassify.getName().trim()!=""){
            int result=productclassifyMapper.update(productclassify);

            if (result>0){
                return   BaseResult.success();
            }

        }

        return BaseResult.error();

    }

    /**
     * 通过type查询
     */
    public BaseResult queryByTypeService(String type){
         List<Productclassify> list=  productclassifyMapper.queryByType(type);
         return  BaseResult.ok(list);

    }

    /**
     * 通过parentId查询
     */
    public   BaseResult  queryByParentIdService(Integer id){
        List<Productclassify> list = productclassifyMapper.queryByParentId(id);
        return   BaseResult.ok(list);
    }

    /**
     * 列表展示
     */
    public BaseResult   queryListService(){
        List<Productclassify>  list =  productclassifyMapper.queryList();
        return   BaseResult.ok(list);

    }

    /**
     * 删除操作
     */
    public   BaseResult  deleteService(Integer id){

        //判断有没有子类
        Productclassify p1 = productclassifyMapper.queryById(id);

        //第一种情况 顶级分类
        if("root".equals(p1.getType())){
            List<Productclassify>  list   = productclassifyMapper.queryByParentId(p1.getId());
            //如果非空，说明有，遍历删除
            if(list.size()>0){
                for(int i=0;i<list.size();i++){

                   //判断子类中是否有子类
                    List<Productclassify>  list2  = productclassifyMapper.queryByParentId(list.get(i).getId());
                     //如果非空,怎继续删除
                    if(list2.size()>0){
                        for(int j=0;j<list2.size();j++){
                            int   r3 = productclassifyMapper.delete(list2.get(j).getId());
                        }
                    }
                    //删除子父类
                    int r2 = productclassifyMapper.delete(list.get(i).getId());


                }
            }
        }


        //如果是二级分类
        if("second".equals(p1.getType())){

            //判断有没有子类
            List<Productclassify>  list   = productclassifyMapper.queryByParentId(p1.getId());

            //如果非空，说明有
            if(list.size()>0){
                //遍历删除
                for(int i=0;i<list.size();i++){
                    int r2 = productclassifyMapper.delete(id);
                }
            }


        }

        //最后删除操作
        int result = productclassifyMapper.delete(id);

        return   BaseResult.success();




    }

    /**
     * 通过id查询信息
     */
    public Productclassify  queryByIdServcie(Integer id){
        return   productclassifyMapper.queryById(id);
    }


}
