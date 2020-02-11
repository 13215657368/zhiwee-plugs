package com.zhiwei.util;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.ss.util.CellReference;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import java.io.InputStream;

public class ExcelUtil {

    //判断文件类型是否满足要求
    public static Workbook getWorkBook(String file, InputStream fis)throws Exception{
        Workbook workbook = null;
        if(!file.endsWith(".xls") && !file.endsWith(".xlsx")){
            throw new Exception("上传表格的格式错误！");
        }
        if(file.endsWith(".xls")){
            workbook = new HSSFWorkbook(fis,true);
        }
        if(file.endsWith(".xlsx")){
            workbook = new XSSFWorkbook(fis);
        }
        return workbook;
    }

    //获取每一行的数据，并且返回一个字符串数组
    public static String[] getExcelRows(Row row , int columuNum){
        String[] s ;
        StringBuilder builder = new StringBuilder();
        for(int x = 0;x<columuNum;x++){
            Cell cell = row.getCell(x);
            builder.append(getStringCellValue(cell)+",");
        }
        s = builder.toString().split(",");
        return s;
    }

    //获取单元内的有效数据
    public static String getStringCellValue(Cell cell){
        StringBuilder sb = new StringBuilder();
        switch (cell.getCellType()){
            //数字
            case Cell.CELL_TYPE_NUMERIC:

                    //将该数字强制转化为字符串类型获取
                    cell.setCellType(Cell.CELL_TYPE_STRING);
                    sb.append(cell.getStringCellValue());

                break;

            //字符串
            case Cell.CELL_TYPE_STRING:
                sb.append(cell.getStringCellValue());
                break;

            //布尔
            case Cell.CELL_TYPE_BOOLEAN:
                sb.append(cell.getBooleanCellValue());
                break;

            //公式
            case Cell.CELL_TYPE_FORMULA:
                sb.append(cell.getCellFormula());
                break;

            //空值
            case Cell.CELL_TYPE_BLANK:
                sb.append("");
                break;

            //故障
            case Cell.CELL_TYPE_ERROR:
                sb.append("");
                break;

            default:
                sb.append("");
                break;
        }
        return sb.toString();
    }

    //过滤掉表中的无意义空白行，因为getLastRowNum（）在获取Row行数时，对于表中没有值但却有格式的无意义空白行也将计入
    public static Sheet resetSheet(Sheet sheet){
        CellReference cellReference = new CellReference("A4");
        boolean flag;
        for(int i=cellReference.getRow();i<=sheet.getLastRowNum();){
            Row r = sheet.getRow(i);
            if(r == null){
                sheet.shiftRows(i+1,sheet.getLastRowNum(),-1);
                continue;
            }
            flag = false;
            for(Cell c : r){
                if(c.getCellType()!=Cell.CELL_TYPE_BLANK){
                    flag = true;
                    break;
                }
            }
            if(flag){
                i++;
                continue;
            }
            else{   //如果是空白行，没有数据，但是有格式
                if(i == sheet.getLastRowNum())
                    sheet.removeRow(r);
                else
                    sheet.shiftRows(i+1,sheet.getLastRowNum(),-1);
            }
        }
        return sheet;
    }
}