<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Upload Image Demo</title>
    <script type="text/javascript" src="js\jquery-1.7.1.min.js"></script>
    <script type="text/javascript">
        function upload(){
            $('form').submit();
            $('img').attr('src','img/vote_img_loading.png')
        }
        $(document).ready(function(){
            $(':input[type=file]').change(upload);
        });

        function showPic(path){
            $('img').attr('src','file/'+path).next('span').css('visibility','visible');

        }

    </script>
    <style type="text/css">
        .pic {
            position: relative;
            width: 100px;
            height: 100px;
            float: left;
            display: inline;
            margin: 0 5px 0 0;
            cursor: pointer;
            overflow: hidden;
        }

        .pic span {
            position: relative;
            color: white;
            margin: -20px 0 0;
            display: block;
            height: 20px;
            width: 100px;
            text-align: center;
            overflow: hidden;
            line-height: 20px;
            background: url(img/template_list_titlebg.png) ;
        }

        .pic form {
            position: absolute;
            width: 100px;
            height: 100px;
            overflow: hidden;
            z-index: 10;
            margin: -100px 0 0;
        }

        .pic input {
            font-size: 100px;
            cursor: pointer;
            -moz-opacity: 0;
            filter: alpha(opacity = 0);
            opacity: 0;
            background: none;
            border: none;
            margin: -10px 0 0 -650px 9;
        }
    </style>
</head>
<body>
<iframe style="display:none" name="if">

</iframe>
<div class="pic">
    <form enctype="multipart/form-data" method="POST" action="${ctx}/image/upload" target="if">
        <input type="file" name="upload"/>
    </form>
</div>
</body>
</html>