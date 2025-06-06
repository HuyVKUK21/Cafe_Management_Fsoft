<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="dec" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<!-- Navbar -->
<header class="navbar navbar-expand-md d-none d-lg-flex d-print-none fixed-top ">
    <div class="container-xl">
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbar-menu"
                aria-controls="navbar-menu" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="navbar-nav flex-row order-md-last">
            <div class="d-none d-md-flex">
                <a href="?theme=dark" class="nav-link px-0 hide-theme-dark" title="Enable dark mode"
                   data-bs-toggle="tooltip"
                   data-bs-placement="bottom">
                    <!-- Download SVG icon from http://tabler-icons.io/i/moon -->
                    <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24"
                         stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round"
                         stroke-linejoin="round">
                        <path stroke="none" d="M0 0h24v24H0z" fill="none"/>
                        <path d="M12 3c.132 0 .263 0 .393 0a7.5 7.5 0 0 0 7.92 12.446a9 9 0 1 1 -8.313 -12.454z"/>
                    </svg>
                </a>
                <a href="?theme=light" class="nav-link px-0 hide-theme-light" title="Enable light mode"
                   data-bs-toggle="tooltip"
                   data-bs-placement="bottom">
                    <!-- Download SVG icon from http://tabler-icons.io/i/sun -->
                    <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24"
                         stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round"
                         stroke-linejoin="round">
                        <path stroke="none" d="M0 0h24v24H0z" fill="none"/>
                        <path d="M12 12m-4 0a4 4 0 1 0 8 0a4 4 0 1 0 -8 0"/>
                        <path d="M3 12h1m8 -9v1m8 8h1m-9 8v1m-6.4 -15.4l.7 .7m12.1 -.7l-.7 .7m0 11.4l.7 .7m-12.1 -.7l-.7 .7"/>
                    </svg>
                </a>
            </div>
            <div class="nav-item dropdown">
                <a href="#" class="nav-link d-flex lh-1 text-reset p-0" data-bs-toggle="dropdown"
                   aria-label="Open user menu">
                    <span class="avatar avatar-sm" style="background-image: url(<c:url
                            value="/template/admin/static/img/user-avatar-default.jpg"/>)"></span>
                    <c:choose>
                        <c:when test="${not empty currentAccount}">
                            <div class="d-none d-xl-block ps-2">
                                <div class="text-primary">${currentAccount.fullname}</div>
                                <c:choose>
                                    <c:when test="${not empty currentAccount.roles and currentAccount.roles[0] != null}">

                                        <c:if test="${currentAccount.roles[0].name == 'ROLE_ADMIN'}">
                                            <div class="mt-1 small text-secondary float-end">Quản trị viên</div>
                                        </c:if>

                                        <c:if test="${currentAccount.roles[0].name == 'ROLE_EMPLOYEE'}">
                                            <div class="mt-1 small text-secondary float-end">Nhân viên</div>
                                        </c:if>

                                        <c:if test="${currentAccount.roles[0].name == 'ROLE_MANAGER'}">
                                            <div class="mt-1 small text-secondary float-end">Quản lý</div>
                                        </c:if>

                                    </c:when>
                                    <c:otherwise>
                                        <div class="mt-1 small text-secondary float-end">Chưa có vai trò</div>
                                    </c:otherwise>
                                </c:choose>

                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="d-none d-xl-block ps-2">
                                <div class="text-primary">ĐĂNG NHẬP</div>
                                <div class="mt-1 small text-secondary float-end">Guest</div>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </a>
                <div class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
                    <a href="<c:url value='/auth/logout' />" class="dropdown-item">Logout</a>
                </div>
            </div>
        </div>
        <div class="collapse navbar-collapse" id="navbar-menu">
            <div>
                <form action="./" method="get" autocomplete="off" novalidate>
                    <div class="input-icon">
                  <span class="input-icon-addon">
                    <!-- Download SVG icon from http://tabler-icons.io/i/search -->
                    <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24"
                         stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round"
                         stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><path
                            d="M10 10m-7 0a7 7 0 1 0 14 0a7 7 0 1 0 -14 0"/><path d="M21 21l-6 -6"/></svg>
                  </span>
                        <input type="text" value="" class="form-control" placeholder="Search…"
                               aria-label="Search in website">
                    </div>
                </form>
            </div>
        </div>
    </div>
</header>