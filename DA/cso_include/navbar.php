<ul class="navbar-nav sidebar sidebar-dark accordion" id="accordionSidebar">
    <br>
    <a class="sidebar-brand d-flex align-items-center justify-content-center" href="cso_dashboard.php">
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

    th, td {
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

    <li class="nav-item <?=$current_page == 'cso_dashboard.php' ? 'active' : ''?>">
        <a class="nav-link" href="cso_dashboard.php">
            <i class="fa fa-tachometer-alt"></i>
            <span>Dashboard</span></a>
    </li>
    
    <hr class="sidebar-divider my-0">

    <li class="nav-item <?=$current_page == 'cso_accrediation.php' ? 'active' : ''?>">
        <a class="nav-link collapsed" href="cso_accrediation.php" aria-expanded="true">
            <i class="fa-solid fa-certificate"></i>
            <span>Application for <br>Accreditation</span>
        </a>
    </li>

    <li class="nav-item <?=$current_page == 'cso_announcement.php' ? 'active' : ''?>">
        <a class="nav-link collapsed" href="cso_announcement.php" aria-expanded="true">
            <i class="fa-solid fa-thumbtack"></i>
            <span>Announcements</span>
        </a>
    </li>
  
    <li class="nav-item <?=$current_page == 'cso_proposal.php' ? 'active' : ''?>">
        <a class="nav-link collapsed" href="cso_proposal.php" aria-expanded="true">
            <i class="fa-solid fa-file-signature"></i>
            <span>Proposals</span>
        </a>
    </li>

    <li class="nav-item <?=$current_page == 'cso_projects_list.php' ? 'active' : ''?>">
        <a class="nav-link collapsed" href="cso_projects_list.php" aria-expanded="true">
            <i class="fa-solid fa-tasks"></i>
            <span>Projects Received</span>
        </a>
    </li>

    <li class="nav-item <?= $current_page == 'cso_financial.php' ? 'active' : '' ?>">
            <a class="nav-link collapsed" href="cso_financial.php" aria-expanded="true">
                <i class="fa-solid fa-clipboard-check"></i>
                <span>Submission of <br>Requirements </span>
            </a>
        </li>

    <li class="nav-item <?=$current_page == 'cso_renewal.php' ? 'active' : ''?>">
        <a class="nav-link collapsed" href="cso_renewal.php" aria-expanded="true">
            <i class="fa-solid fa-sync-alt"></i>
            <span>Application for <br>Accreditation Renewal</span>
        </a>
    </li>

    <li class="nav-item <?=$current_page == 'cso_profile.php' ? 'active' : ''?>">
        <a class="nav-link collapsed" href="cso_profile.php" aria-expanded="true">
            <i class="fa-solid fa-user"></i>
            <span>Profile</span>
        </a>
    </li>
    
    <li class="nav-item <?=$current_page == 'logout.php' ? 'active' : ''?>">
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
                            <h3 class="h6 m-0 text-white-800"><strong style="color:#0A593A">Welcome, <?php echo $_SESSION['first_name']; ?>!</strong></h3>


                        </span>
                    </a>

                </li>

            </ul>

        </nav>