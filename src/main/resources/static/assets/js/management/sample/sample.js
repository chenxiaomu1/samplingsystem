/** Created By Wuwenbin https://wuwenbin.me
 * mail to wuwenbinwork@163.com

 * if you use the code,  please do not delete the comment
 * 如果您使用了此代码，请勿删除此头部注释
 * */


layui.use(['form', 'layer', 'table', 'element'], function () {
    var table = layui.table
        , element = layui.element
        , layer = layui.layer
        , form = layui.form;

    element.render();
    var $ = layui.$, commentTable = table.render({
        elem: '#comment-table'
        , url: BMY.url.prefix + '/sample/list'
        , page: true
        , limit: 10
        , height: 'full'
        , method: 'post'
        ,cellMinWidth: 100 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
        // , where: {sampleName: $("input.layui-input[name=sampleName]").val()}
        , cols: [[
            {type:'radio'}
            ,{field: 'sampleId', title: '采样编号'}
            , {field: 'sampleName', title: '采样名称'}
            , {field: 'oreLocation', title: '矿点信息', event: 'detail'}
            , {field: 'provider', title: '供应商信息', sort: true}
            , {field: 'samplingWeather', title: '采样天气'}
            , {field: 'coalType', title: '煤种'}
            , {field: 'samplingPlace', title: '采样地点'}
            , {field: 'userId', title: '采样人员编号'}
            , {field: 'samplingPerson', title: '采样人员'}
            , {field: 'samplingTime', title: '采样时间'}
        ]]
    });


    form.on('switch(enable)', function (obj) {
        BMY.ajax(BMY.url.prefix + "/comment/update", {id: this.value, enable: obj.elem.checked}, function (json) {
            BMY.okMsgHandle(json);
            layer.tips('状态：' + ((obj.elem.checked) ? "正常" : "隐藏"), obj.othis);
        });
    });

    //监听单元格事件
    table.on('tool(comment)', function (obj) {
        var data = obj.data;
        if (obj.event === 'detail') {
            layer.open({
                type: 1
                , offset: 'auto'
                , id: 'layerDemo' + data.id //防止重复弹出
                , content: '<div style="padding: 20px;">' + data.comment.replace(/<[^<>]+?>/g, '') + '</div>'
                , btnAlign: 'c' //按钮居中
                , shade: 0 //不显示遮罩
            });
        }
    });

    table.on('sort(comment)', function (obj) {
        commentTable.reload({
            initSort: obj
            , where: {
                sort: obj.field
                , order: obj.type
            }
        });
    });

    var active = {
        reload: function () {
            var comment = $("#comment-search");
            //执行重载
            table.reload('comment-table', {
                page: {
                    curr: 1 //重新从第 1 页开始
                }
                , where: {
                    clearComment: comment.val()
                }
            });
        }
    };

    $('#comment-table-search').find('.layui-btn').on('click', function () {
        var type = $(this).data('type');
        active[type] ? active[type].call(this) : '';
    });
});







