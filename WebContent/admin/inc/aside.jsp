<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>

<aside >
        <div class="avatar"><img src="${pageContext.request.contextPath}/${loginAdmin.pic}" ></div>
        <div class="all"><span >展开全部</span>||<span>关闭全部</span></div>
            <ul>
                <li>
                    <p > <svg width="20" height="20" aria-hidden="true"><use xlink:href="#icon-quanxian"></use></svg>权限管理</p>
                    <ul class="show_hidden">
                        <li>

                        <a href="/oa_v3/findWithPage_worker_private.action?curPage=1"> 权限分配</a></li>
                    </ul>
                </li>
                <li>
                   <p><svg width="20" height="20" aria-hidden="true"><use xlink:href="#icon-zhiyuanguanli"></use></svg>职员管理</p>
                    <ul class="show_hidden">
                        <li><a href="${pageContext.request.contextPath}/admin/add_worker.jsp">添加职员</a></li>
                        <li><a href="/oa_v3/findWithPage_worker.action?curPage=1">查询职员</a></li>
                    </ul>
                </li>
                <li>
                    <p><svg width="20" height="20" aria-hidden="true"><use xlink:href="#icon-bumen"></use></svg>部门管理</p>
                     <ul class="show_hidden">
                        <li><a href="${pageContext.request.contextPath}/admin/add_branch.jsp">添加部门</a></li>
                        <li><a href="/oa_v3/findWithPage_branch.action?curPage=1">查询部门</a></li>
                    </ul>
                </li>
                <li>
                    <p><svg width="20" height="20" aria-hidden="true"><use xlink:href="#icon-gonggao"></use></svg>公告管理</p>
                     <ul class="show_hidden">
                        <li><a href="${pageContext.request.contextPath}/admin/add_notice.jsp">发布公告</a></li>
                        <li><a href="/oa_v3/findWithPage_notice.action?curPage=1">查询公告</a></li>
                    </ul>
                </li>
                <li>
                    <p><svg width="20" height="20" aria-hidden="true"><use xlink:href="#icon-kaoqin"></use></svg>考勤管理</p>
                     <ul class="show_hidden">
                        <li><a href="/oa_v3/findWithPage_record.action?curPage=1">考勤记录</a></li>
                    </ul>
                </li>
                <li>
                    <p><svg width="20" height="20" aria-hidden="true"><use xlink:href="#icon-shiwu"></use></svg>事务管理</p>
                     <ul class="show_hidden">
                        <li><a href="/oa_v3/findWithPage_transaction.action?curPage=1">事务审批</a></li>
                    </ul>
                </li>
                <li>
                    <p><svg width="20" height="20" aria-hidden="true"><use xlink:href="#icon-rizhi"></use></svg>日志记录</p>
                     <ul class="show_hidden">
                        <li><a href="/oa_v3/findWithPage_logs.action?curPage=1&type=3">月报</a></li>
                        <li><a href="/oa_v3/findWithPage_logs.action?curPage=1&type=2">周报</a></li>
                        <li><a href="/oa_v3/findWithPage_logs.action?curPage=1&type=1">日报</a></li>
<!--                         <li><a href="/oa_v3/findWithPage_logs.action?curPage=1&type=4">小组日志</a></li> -->
                        <li><a href="/oa_v3/findWithPage_metting.action?curPage=1">会议纪要</a></li>
                    </ul>
                </li>
            </ul>
    </aside>