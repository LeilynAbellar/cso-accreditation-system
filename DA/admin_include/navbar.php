<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- Bootstrap -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>


<ul class="navbar-nav sidebar sidebar-dark accordion" id="accordionSidebar">
    <br>
    <a class="sidebar-brand d-flex align-items-center justify-content-center" href="admin_page.php">
        <div class="sidebar-brand-icon rotate-n-12">
            <img class="img-profile rounded-circle" src="img/logo.png">
            <br>
        </div>
    </a>
    <br>
    <style>
        .img-profile {
            height: 75px;
            width: 75px;
        }

        .navbar-nav.sidebar.sidebar-dark.accordion {
            background-color: #0A593A;
            position: fixed;
            top: 0;
            left: 0;
            height: 100%;
            width: 250px; 
            overflow-y: auto; 
            z-index: 1030; 
        }

        th {
            color: black;
        }

        td {
            color: black;
        }

        .collapse-item {
            white-space: nowrap;
            overflow: hidden;
            text-overflow: clip;
        }

        .nav-item.active .nav-link {
            color: white;
            font-weight: bold;
            background-color: rgba(40, 120, 80, 0.75); 
            border-radius: 20px;
            position: center;
            width: 95%;
        }

        .nav-item:hover {
            color: white !important; 
            text-decoration: bold; 
        }

        .collapse-inner {
            background-color: #0A593A; 
        }

        .collapse-item {
            color: white !important; 
            padding: 8px 15px; 
            display: block;
        }

        .collapse-item:hover {
            background-color: #21704b !important; 
            color: white !important; 
            text-decoration: none; 
        }

        .collapse-item.active {
            background-color: #21704b !important; 
            color: white !important; 
            font-weight: bold; 
        }

        .collapse-inner {
            background-color: #0A593A; 
        }
        #content-wrapper {
        margin-left: 225px; 
        }
        @media (max-width: 768px) {
        .navbar-nav.sidebar.sidebar-dark.accordion {
            width: 200px; 
        }

        #content-wrapper {
            margin-left: 200px;
        }
        }
        </style>

    <hr class="sidebar-divider my-0">

    <?php
    $current_page = basename($_SERVER['PHP_SELF']);
    ?>
    <li class="nav-item <?= $current_page == 'admin_page.php' ? 'active' : '' ?>">
        <a class="nav-link" href="admin_page.php">
            <i class="fa fa-tachometer-alt"></i>
            <span>Dashboard</span></a>
        </li>

        <hr class="sidebar-divider my-0">
 
        <li class="nav-item <?= $current_page == 'admin_accreditation.php' ? 'active' : '' ?>">
            <a class="nav-link collapsed" href="admin_accreditation.php" aria-expanded="true">
                <i class="fa-solid fa-certificate"></i>
                <span>Application for <br> Accreditation</span>
            </a>
        </li>

        <li class="nav-item <?= $current_page == 'admin_proposal.php' ? 'active' : '' ?>">
            <a class="nav-link collapsed" href="admin_proposal.php" aria-expanded="true">
                <i class="fa-solid fa-file-signature"></i>
                <span>Proposals</span>
            </a>
        </li>

        <li class="nav-item <?= $current_page == 'admin_projects_list.php' ? 'active' : '' ?>">
            <a class="nav-link collapsed" href="admin_projects_list.php" aria-expanded="true">
                <i class="fa-solid fa-bullhorn"></i>
                <span>Projects</span>
            </a>
        </li>

        <li class="nav-item <?= $current_page == 'admin_performance_ranking.php' ? 'active' : '' ?>">
            <a class="nav-link collapsed" href="admin_performance_ranking.php" aria-expanded="true">
                <i class="fa-solid fa-chart-line"></i>
                <span>CSO Performance</span>
            </a>
        </li>

        <li class="nav-item <?= $current_page == 'admin_accomplishment.php' ? 'active' : '' ?>">
            <a class="nav-link collapsed" href="admin_accomplishment.php" aria-expanded="true">
                <i class="fa-solid fa-clipboard-check"></i>
                <span>Submission of <br> Requirements </span>
            </a>
        </li>

        <li class="nav-item <?= $current_page == 'admin_renewal.php' ? 'active' : '' ?>">
            <a class="nav-link collapsed" href="admin_renewal.php" aria-expanded="true">
                <i class="fa-solid fa-sync-alt"></i>
                <span>Application for <br>  Accreditation Renewal</span>
            </a>
        </li>

        <li class="nav-item <?= $current_page == 'admin_announcement_list.php' ? 'active' : '' ?>">
            <a class="nav-link collapsed" href="admin_announcement_list.php" aria-expanded="true">
                <i class="fa-solid fa-bullhorn"></i>
                <span>Announcements</span>
            </a>
        </li>

        <li class="nav-item">
            <a class="nav-link collapsed" data-toggle="collapse" data-target="#collapseUsers" aria-expanded="true" aria-controls="collapseUsers">
                <i class="fa-solid fa-users"></i>
                <span>User Accounts</span>
            </a>
            <div id="collapseUsers" class="collapse <?= in_array($current_page, ['admin_cso_users.php', 'admin_representative_users.php']) ? 'show' : '' ?>" 
                aria-labelledby="headingUsers" data-parent="#accordionSidebar">
                <div class="collapse-inner">
                    <a class="collapse-item <?= $current_page == 'admin_cso_users.php' ? 'active' : '' ?>" href="admin_cso_users.php">CSO Accounts</a>
                    <a class="collapse-item <?= $current_page == 'admin_representative_users.php' ? 'active' : '' ?>" href="admin_representative_users.php">Representative Accounts</a>
                </div>
            </div>
        </li>


        <li class="nav-item <?= $current_page == 'logout.php' ? 'active' : '' ?>">
            <a class="nav-link collapsed" href="logout.php" aria-expanded="true">
                <i class="fa-solid fa-sign-out-alt"></i> <span>Log Out</span>
            </a>
        </li>


        <hr class="sidebar-divider d-none d-md-block">

    </ul>

    <div id="content-wrapper" class="d-flex flex-column">

        <div id="content">

            <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow"
            style='background-color:#0A593A;'>

            <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                <i class="fa fa-bars" style="color:#0A593A"></i>
            </button>

            <ul class="navbar-nav ml-auto">


                <li class="nav-item dropdown no-arrow">
                    <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown"
                    aria-haspopup="true" aria-expanded="false">
                    <span class="mr-2 d-none d-lg-inline text-gray-600 small">
                        <h3 class="h6 m-0 text-white-800"><strong style="color:#0A593A">Welcome,
                            <?php echo $_SESSION['first_name']; ?>!</strong>
                        </h3>
                    </span>
                    </a>

                </li>

            </ul>

        </nav>