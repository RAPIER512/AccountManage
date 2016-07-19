<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8">

    <title>DataTables Bootstrap 3 示例</title>


    <script type="text/javascript" language="javascript" src="http://code.jquery.com/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" language="javascript" charset="utf-8"
            src="https://cdn.datatables.net/1.10.12/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" language="javascript"
            src="http://cdn.datatables.net/plug-ins/28e7751dbec/integration/bootstrap/3/dataTables.bootstrap.js"></script>

    <link rel="stylesheet" href="http://fk.github.io/select2-bootstrap-css/css/gh-pages.css">
    <link rel="stylesheet" href="http://fk.github.io/select2-bootstrap-css/css/select2-bootstrap.css">
    <link rel="stylesheet" href="http://select2.github.io/select2/select2-3.5.2/select2.css">

    <link rel="stylesheet" type="text/css" href="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css"
          href="http://cdn.datatables.net/plug-ins/28e7751dbec/integration/bootstrap/3/dataTables.bootstrap.css">

    <script type="text/javascript" language="javascript"
            src="http://select2.github.io/select2/select2-3.4.2/select2.js"></script>

    <!--daterangemaker-->
    <script type="text/javascript" src="//cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
    <script type="text/javascript" src="//cdn.jsdelivr.net/bootstrap.daterangepicker/2/daterangepicker.js"></script>
    <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/bootstrap.daterangepicker/2/daterangepicker.css"/>
</head>
<body>
<div class="container" style="margin-top: 4%">
    <div style="float: left ;width: 25%;">
        <div>
            <!--<form class="form-horizontal">-->
            <div class="control-group">
                <label class="control-label">编码</label>
                <div class="controls">
                    <input type="text" id="code" placeholder="编码" style="width: inherit">
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">名称</label>
                <div class="controls">
                    <input type="text" id="name" placeholder="名称" style="width: inherit">
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">备注</label>
                <div class="controls">
                    <input type="text" id="note" placeholder="备注" style="width: inherit">
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">状态</label>
                <div class="controls">
                    <input type="radio" name="optionsRadios" id="optionsRadios1"
                           value="在线" checked> 在线
                    <input type="radio" name="optionsRadios" id="optionsRadios2"
                           value="离线"> 离线
                    <input type="radio" name="optionsRadios" id="optionsRadios3"
                           value="锁定"> 锁定
                </div>
            </div>
            <div class="control-group" style="clear: both">
                <label class="control-label">注册时段</label>
                <div class="controls">
                    <input type="text" name="daterange" id="daterange" value="01/01/2015 - 01/31/2015"
                           style="width: inherit"/>
                    <script type="text/javascript">
                        $(function () {
                            $('input[name="daterange"]').daterangepicker();
                        });
                    </script>
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">账户类型</label>
                <div class="controls">
                    <select class="js-states form-control" style="width: inherit" id="type">
                        <optgroup>
                            <option value="会员账户">会员账户</option>
                            <option value="普通账户">普通账户</option>
                        </optgroup>
                    </select>
                </div>
            </div>
            <div class="control-group">
                <div class="controls">
                    <!--type="submit"-->
                    <button class="btn" id="select">查询</button>
                    <button class="btn" id="clean">清除</button>
                    <br>
                    <button class="btn btn-primary" id="add">添加</button>
                    <button class="btn btn-primary" id="update">修改</button>
                </div>
            </div>
            <!--</form>-->
        </div>
    </div>
    <div style="float: left ;width: 75%;">
        <div style="margin-bottom:10px">
            <table class="table table-bordered">
                <tr>
                    <td>
                        <input type="text" id="input1" class="form-control" style="width: auto" placeholder="请输入对应编码">
                        <button type="button" class="btn btn-primary" id="delete">删除</button>
                    </td>
                    <td>
                        <input type="text" id="input2" class="form-control" style="width: auto" placeholder="请输入对应编码">
                        <button type="button" class="btn btn-primary" id="clock">封存</button>
                        <button type="button" class="btn btn-primary" id="unlock">启封</button>
                    </td>
                </tr>
            </table>
        </div>

        <div id="example_wrapper" class="dataTables_wrapper form-inline" role="grid">

            <table id="example" class="table table-striped table-bordered dataTable no-footer" cellspacing="0"
                   width="100%"
                   aria-describedby="example_info" style="width: 100%;">
                <thead>
                <tr role="row">
                    <th class="sorting_asc" tabindex="0" aria-controls="example" rowspan="1" colspan="1"
                        aria-sort="ascending" aria-label="Name: activate to sort column ascending"
                        style="width: auto;">
                        编码
                    </th>
                    <th class="sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1"
                        aria-label="Position: activate to sort column ascending" style="width: auto;">
                        名称
                    </th>
                    <th class="sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1"
                        aria-label="Office: activate to sort column ascending" style="width: auto;">
                        备注
                    </th>
                    <th class="sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1"
                        aria-label="Salary: activate to sort column ascending" style="width: auto;">
                        状态
                    </th>
                    <th class="sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1"
                        aria-label="Salary: activate to sort column ascending" style="width: auto;">
                        创建时间
                    </th>
                    <th class="sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1"
                        aria-label="Salary: activate to sort column ascending" style="width: auto;">
                        最后登录时间
                    </th>
                    <th class="sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1"
                        aria-label="Salary: activate to sort column ascending" style="width: auto;">
                        账户类型
                    </th>
                </tr>
                </thead>
                <tbody></tbody>
            </table>
        </div>
    </div>
</div>

<script type="text/javascript" charset="utf-8">
    $(document).ready(function () {
        var table = $('#example').DataTable({
            paging: false,
            searching: false,
            "ajax": {
                url: 'accountmanage/selectAccounts.do',
                type: 'POST',
                contentType: 'application/json; charset=utf-8',
            },
            "bDestroy": true,
            "columns": [{"data": "code"},
                {"data": "name"},
                {"data": "note"},
                {"data": "state"},
                {"data": "createtime"},
                {"data": "lastlogtime"},
                {"data": "type"}]
        });


        $("#delete").click(function () {
            $.ajax({
                url: 'accountmanage/deleteAccount.do?code=' + $("#input1").val(),
                type: 'get',
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                success: function (data) {
                    if (data > 0) {
                        table.ajax.reload(null, false);
                        alert("删除成功！");
                    } else {
                        view(data);
                    }
                },
                error: function () {
                    alert("异常！");
                }
            });
        });

        var operation = function (state) {
            $.ajax({
                url: 'accountmanage/updateAccountState.do?code=' + $("#input2").val() + "&state=" + state,
                type: 'get',
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                success: function (data) {
                    if (data > 0) {
                        table.ajax.reload(null, false);
                        alert("修改成功！");
                    } else {
                        alert(data);
                    }
                },
                error: function () {
                    alert("异常！");
                }
            });
        }


        $("#clock").click(function () {
            operation("封存");
        });
        $("#unlock").click(function () {
            operation("启封");
        });

        $("#select").click(function () {
            var daterange = $("#daterange").val().split('-');
            var account = {
                'code': $('#code').val() + '', 'name': $('#name').val() + '',
                'note': $('#note').val() + '', 'state': $("input[name='optionsRadios']:checked").val() + '',
                'createtime': daterange[0] + '', 'lastlogtime': daterange[1] + '', 'type': $('#type').val() + ''
            };
            var str = "";
            if (account.code != null) {
                if (str != null) {
                    str = str + "&";
                }
                str = str + "code=" + account.code;
            }
            if (account.name != null) {
                if (str != null) {
                    str = str + "&";
                }
                str = str + "name=" + account.name;
            }
            if (account.note != null) {
                if (str != null) {
                    str = str + "&";
                }
                str = str + "note=" + account.note;
            }
            if (daterange != null) {
                if (str != null) {
                    str = str + "&";
                }
                str = str + "daterange=" + daterange;
            }
            if (account.type != null) {
                if (str != null) {
                    str = str + "&";
                }
                str = str + "type=" + account.type;
            }
            var path = 'accountmanage/selectAccountsByContidtions.do' + '?' + str;
            table.ajax.url(path);
            table.ajax.reload(null, false);
            /*$('#example').DataTable({
             paging: false,
             searching: false,
             "ajax": {
             url: 'accountmanage/selectAccountsByContidtions.do',
             type: 'POST',
             contentType: 'application/json; charset=utf-8',
             data: account
             }
             });*/
        });


        $("#add").click(function () {
            var daterange = $("#daterange").val().split('-');
            var account = {
                'code': $('#code').val(), 'name': $('#name').val(),
                'note': $('#note').val(), 'state': $("input[name='optionsRadios']:checked").val(),
                'createtime': daterange[0], 'lastlogtime': daterange[1], 'type': $('#type').val()
            };
            $.ajax({
                url: 'accountmanage/addAccount.do',
                data: JSON.stringify(account),
                type: 'post',
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                success: function (data) {
                    if (data > 0) {
                        table.ajax.reload(null, false);
                        alert("添加成功！");
                    } else {
                        view(data);
                    }
                },
                error: function () {
                    alert("异常！");
                }
            });
        });


        $("#update").click(function () {
            var daterange = $("#daterange").val().split('-');
            var account = {
                'code': $('#code').val(), 'name': $('#name').val(),
                'note': $('#note').val(), 'state': $("input[name='optionsRadios']:checked").val(),
                'createtime': daterange[0], 'lastlogtime': daterange[1], 'type': $('#type').val()
            };
            $.ajax({
                url: 'accountmanage/updateAccount.do',
                data: JSON.stringify(account),
                type: 'post',
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                success: function (data) {
                    if (data > 0) {
                        table.ajax.reload(null, false);
                        alert("修改成功！");
                    } else {
                        view(data);
                    }
                },
                error: function () {
                    alert("异常！");
                }
            });
        });
        $("#clean").click(function () {
            $('#code').disable = false;
            $('#name').val(null);
            $('#note').val(null);
            $('#code').val(null);
            $('#daterange').val(null);
            $('#type').val(null);
        });


        $('#example tbody').on('click', 'tr', function () {
            $('#code').disable = true;

            var name = $('td', this).eq(3).text();

            $("#code").val($('td', this).eq(0).text());
            $("#name").val($('td', this).eq(1).text());
            $("#note").val($('td', this).eq(2).text());
            var rad = $('td', this).eq(3).text();
            var str = "input[name='optionsRadios'][value=" + "离线" + "]";
            $(str).attr("checked", true);
            $("#daterange").val($('td', this).eq(4).text() + "-" + $('td', this).eq(5).text());
            $("#type").val($('td', this).eq(6).text());
        });

        $(".js-example-basic-single").select2();
    });
</script>
</body>
</html>