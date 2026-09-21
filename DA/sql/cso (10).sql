-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 30, 2025 at 05:32 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cso`
--

-- --------------------------------------------------------

--
-- Table structure for table `accreditation_application`
--

CREATE TABLE `accreditation_application` (
  `application_id` int(11) NOT NULL,
  `cso_representative_id` int(11) NOT NULL,
  `datasheet_org` varchar(255) DEFAULT NULL,
  `datasheet_org_status` enum('Pending','Approved','Denied') DEFAULT 'Pending',
  `goodstanding_lce` varchar(255) DEFAULT NULL,
  `goodstanding_lce_status` enum('Pending','Approved','Denied') DEFAULT 'Pending',
  `permit_mayor` varchar(255) DEFAULT NULL,
  `permit_mayor_status` enum('Pending','Approved','Denied') DEFAULT 'Pending',
  `permit_bir` varchar(255) DEFAULT NULL,
  `permit_bir_status` enum('Pending','Approved','Denied') DEFAULT 'Pending',
  `certificate_reg` varchar(255) DEFAULT NULL,
  `certificate_reg_status` enum('Pending','Approved','Denied') DEFAULT 'Pending',
  `goodstanding_ga` varchar(255) DEFAULT NULL,
  `goodstanding_ga_status` enum('Pending','Approved','Denied') DEFAULT 'Pending',
  `omnibus` varchar(255) DEFAULT NULL,
  `omnibus_status` enum('Pending','Approved','Denied') DEFAULT 'Pending',
  `bio_data` varchar(255) DEFAULT NULL,
  `bio_data_status` enum('Pending','Approved','Denied') DEFAULT 'Pending',
  `articles_of_incorporation` varchar(255) DEFAULT NULL,
  `articles_of_incorporation_status` enum('Pending','Approved','Denied') DEFAULT 'Pending',
  `incumbent_officers` varchar(255) DEFAULT NULL,
  `incumbent_officers_status` enum('Pending','Approved','Denied') DEFAULT 'Pending',
  `accomplishment_reports` varchar(255) DEFAULT NULL,
  `accomplishment_reports_status` enum('Pending','Approved','Denied') DEFAULT 'Pending',
  `disclosure` varchar(255) DEFAULT NULL,
  `disclosure_status` enum('Pending','Approved','Denied') DEFAULT 'Pending',
  `affidavit` varchar(255) DEFAULT NULL,
  `affidavit_status` enum('Pending','Approved','Denied') DEFAULT 'Pending',
  `status` enum('Pending','Accredited','Denied') DEFAULT 'Pending',
  `overall_status` enum('Pending','Accepted','Denied') DEFAULT 'Pending',
  `remarks` text DEFAULT 'No Remarks.',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `schedule` date DEFAULT NULL,
  `status_updated_at` datetime DEFAULT NULL,
  `hardcopy_submission_date` date DEFAULT NULL,
  `datasheet_org_remarks` text DEFAULT NULL,
  `goodstanding_lce_remarks` text DEFAULT NULL,
  `permit_mayor_remarks` text DEFAULT NULL,
  `permit_bir_remarks` text DEFAULT NULL,
  `certificate_reg_remarks` text DEFAULT NULL,
  `goodstanding_ga_remarks` text DEFAULT NULL,
  `omnibus_remarks` text DEFAULT NULL,
  `bio_data_remarks` text DEFAULT NULL,
  `articles_of_incorporation_remarks` text DEFAULT NULL,
  `incumbent_officers_remarks` text DEFAULT NULL,
  `accomplishment_reports_remarks` text DEFAULT NULL,
  `disclosure_remarks` text DEFAULT NULL,
  `affidavit_remarks` text DEFAULT NULL,
  `cso_status` enum('Pending','Approved','Denied') DEFAULT 'Pending',
  `datasheet_org_admin_remarks` text DEFAULT NULL,
  `goodstanding_lce_admin_remarks` text DEFAULT NULL,
  `permit_mayor_admin_remarks` text DEFAULT NULL,
  `permit_bir_admin_remarks` text DEFAULT NULL,
  `certificate_reg_admin_remarks` text DEFAULT NULL,
  `goodstanding_ga_admin_remarks` text DEFAULT NULL,
  `omnibus_admin_remarks` text DEFAULT NULL,
  `bio_data_admin_remarks` text DEFAULT NULL,
  `articles_of_incorporation_admin_remarks` text DEFAULT NULL,
  `incumbent_officers_admin_remarks` text DEFAULT NULL,
  `accomplishment_reports_admin_remarks` text DEFAULT NULL,
  `disclosure_admin_remarks` text DEFAULT NULL,
  `affidavit_admin_remarks` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `accreditation_application`
--
-- --------------------------------------------------------

--
-- Table structure for table `accreditation_documents`
--

CREATE TABLE `accreditation_documents` (
  `id` int(11) NOT NULL,
  `application_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `status` enum('Pending','Approved','Denied') DEFAULT 'Pending',
  `remarks` text DEFAULT NULL,
  `file_path` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `activities`
--

CREATE TABLE `activities` (
  `id` int(11) NOT NULL,
  `task_id` int(11) NOT NULL,
  `description` text DEFAULT NULL,
  `date` date NOT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `announcements`
--

CREATE TABLE `announcements` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `ann_content` text DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `uploaded_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `announcements`
--


-- --------------------------------------------------------

--
-- Table structure for table `cso_chairperson`
--

CREATE TABLE `cso_chairperson` (
  `id` int(11) NOT NULL,
  `cso_name` varchar(255) NOT NULL,
  `cso_address` varchar(255) NOT NULL,
  `region` varchar(255) NOT NULL DEFAULT 'Region VI',
  `province` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `barangay` varchar(255) NOT NULL,
  `street` varchar(255) NOT NULL,
  `zip_code` varchar(10) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `middle_name` varchar(255) NOT NULL,
  `suffix` varchar(50) NOT NULL,
  `birthday` date NOT NULL,
  `birth_place` varchar(255) NOT NULL,
  `nationality` varchar(255) NOT NULL,
  `religion` varchar(255) NOT NULL,
  `sex` varchar(50) NOT NULL,
  `civil_status` varchar(50) NOT NULL,
  `email` varchar(255) NOT NULL,
  `mobile_number` varchar(20) NOT NULL,
  `telephone_number` varchar(20) DEFAULT NULL,
  `office_telephone_number` varchar(20) DEFAULT NULL,
  `gov_id_type` varchar(50) DEFAULT NULL,
  `gov_id_file` varchar(255) DEFAULT NULL,
  `certificate_type` varchar(50) DEFAULT NULL,
  `certificate_file` varchar(255) DEFAULT NULL,
  `latitude` decimal(10,7) DEFAULT NULL,
  `longitude` decimal(10,7) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `verify_token` varchar(255) NOT NULL,
  `verify_status` tinyint(1) NOT NULL DEFAULT 0,
  `usertype` varchar(50) NOT NULL DEFAULT 'cso',
  `profile_image` varchar(255) NOT NULL,
  `status` varchar(20) DEFAULT 'Unverified',
  `date_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `verified_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cso_chairperson`
--


-- --------------------------------------------------------

--
-- Table structure for table `cso_evaluations`
--

CREATE TABLE `cso_evaluations` (
  `id` int(11) NOT NULL,
  `cso_id` int(11) NOT NULL,
  `accuracy_score` tinyint(4) NOT NULL DEFAULT 3,
  `compliance_score` tinyint(4) NOT NULL DEFAULT 3,
  `community_engagement_score` tinyint(4) NOT NULL DEFAULT 3
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cso_representative`
--

CREATE TABLE `cso_representative` (
  `id` int(11) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `middle_name` varchar(255) NOT NULL,
  `suffix` varchar(50) NOT NULL,
  `birthday` date NOT NULL,
  `birth_place` varchar(255) NOT NULL,
  `nationality` varchar(255) NOT NULL,
  `religion` varchar(255) NOT NULL,
  `sex` varchar(50) NOT NULL,
  `civil_status` varchar(50) NOT NULL,
  `email` varchar(255) NOT NULL,
  `cso_name` varchar(255) NOT NULL,
  `mobile_number` varchar(20) NOT NULL,
  `telephone_number` varchar(20) NOT NULL,
  `gov_id_type` varchar(50) DEFAULT NULL,
  `gov_id_file` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `status` varchar(50) NOT NULL DEFAULT 'Unverified',
  `usertype` varchar(50) NOT NULL DEFAULT 'representative',
  `verify_token` varchar(255) NOT NULL,
  `verify_status` tinyint(1) NOT NULL DEFAULT 0,
  `profile_image` varchar(255) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `verified_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cso_representative`
--

--------------------------------------------------------

--
-- Table structure for table `documents`
--

CREATE TABLE `documents` (
  `id` int(11) NOT NULL,
  `cso_representative_id` int(11) NOT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `file_path` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `files`
--

CREATE TABLE `files` (
  `id` int(11) NOT NULL,
  `announcement_id` int(11) DEFAULT NULL,
  `document_name` varchar(255) DEFAULT NULL,
  `file_path` varchar(255) DEFAULT NULL,
  `uploaded_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `files`
--

-- --------------------------------------------------------

--
-- Table structure for table `financial_report`
--

CREATE TABLE `financial_report` (
  `id` int(11) NOT NULL,
  `cso_representative_id` int(11) DEFAULT NULL,
  `solvency` decimal(10,2) DEFAULT NULL,
  `roi` decimal(10,2) DEFAULT NULL,
  `liquidity` decimal(10,2) DEFAULT NULL,
  `indication` varchar(255) NOT NULL,
  `upload_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `net_operating_income` decimal(10,2) DEFAULT NULL,
  `avg_operating_assets` decimal(10,2) DEFAULT NULL,
  `current_assets` decimal(10,2) DEFAULT NULL,
  `current_liabilities` decimal(10,2) DEFAULT NULL,
  `total_liabilities` decimal(10,2) DEFAULT NULL,
  `total_assets` decimal(10,2) DEFAULT NULL,
  `accomplishment_file_path` varchar(255) DEFAULT NULL,
  `financial_file_path` varchar(255) DEFAULT NULL,
  `admin_status` varchar(20) NOT NULL DEFAULT 'Pending',
  `cso_status` varchar(20) NOT NULL DEFAULT 'Pending',
  `liability` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `financial_report`
--

-- Triggers `financial_report`
--
DELIMITER $$
CREATE TRIGGER `before_insert_sync_liquidity_liability` BEFORE INSERT ON `financial_report` FOR EACH ROW BEGIN
    SET NEW.liability = NEW.liquidity;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `before_update_sync_liquidity_liability` BEFORE UPDATE ON `financial_report` FOR EACH ROW BEGIN
    SET NEW.liability = NEW.liquidity;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `milestones`
--

CREATE TABLE `milestones` (
  `id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `target_date` date DEFAULT NULL,
  `actual_date` date DEFAULT NULL,
  `status` varchar(50) DEFAULT 'Pending',
  `comments` text DEFAULT NULL,
  `file_path` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `milestones`
--


-- --------------------------------------------------------

--
-- Table structure for table `milestone_tasks`
--

CREATE TABLE `milestone_tasks` (
  `id` int(11) NOT NULL,
  `milestone_id` int(11) NOT NULL,
  `task_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `milestone_tasks`
--

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `project_desc` text NOT NULL,
  `budget` decimal(50,0) NOT NULL,
  `file_path` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `cso_id` int(11) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `objectives` text DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `latitude` float DEFAULT NULL,
  `longitude` float DEFAULT NULL,
  `status` enum('Assigned','In Progress','Completed') DEFAULT 'Assigned',
  `days_over` int(11) NOT NULL DEFAULT 0,
  `budget_over` decimal(10,2) NOT NULL DEFAULT 0.00,
  `outcomes` text DEFAULT NULL,
  `milestones` text DEFAULT NULL,
  `risks` text DEFAULT NULL,
  `team` text DEFAULT NULL,
  `date_submitted` date DEFAULT NULL,
  `funding_status` enum('Pending','Approved','Denied') DEFAULT 'Pending',
  `proposal_status` enum('Pending','Approved','Denied') DEFAULT 'Pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `projects`
--


-- --------------------------------------------------------

--
-- Table structure for table `project_cso`
--

CREATE TABLE `project_cso` (
  `id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `task_id` int(11) DEFAULT NULL,
  `cso_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `project_cso`
--


-- --------------------------------------------------------

--
-- Table structure for table `proposal`
--

CREATE TABLE `proposal` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `objectives` text NOT NULL,
  `outcomes` text DEFAULT NULL,
  `milestones` text DEFAULT NULL,
  `team` text DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `latitude` decimal(10,6) DEFAULT NULL,
  `longitude` decimal(10,6) DEFAULT NULL,
  `risks` text DEFAULT NULL,
  `file_path` varchar(255) DEFAULT NULL,
  `cso_representative_id` int(11) NOT NULL,
  `status` enum('Pending','Approved','Denied') DEFAULT 'Pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `status_updated_at` date DEFAULT NULL,
  `budget` decimal(10,2) DEFAULT NULL,
  `date_submitted` date DEFAULT curdate(),
  `funding_status` varchar(255) DEFAULT 'Pending',
  `cso_status` enum('Pending','Approved','Denied') DEFAULT 'Pending',
  `cso_status_updated_at` timestamp NULL DEFAULT current_timestamp(),
  `remarks` text DEFAULT NULL,
  `funding_updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `proposal`
--


-- --------------------------------------------------------

--
-- Table structure for table `ranking_weights`
--

CREATE TABLE `ranking_weights` (
  `id` int(11) NOT NULL,
  `weightSolvency` float DEFAULT NULL,
  `weightLiquidity` float DEFAULT NULL,
  `weightROI` float DEFAULT NULL,
  `weightCompletionRate` float DEFAULT 0.1,
  `weightApprovalRate` float DEFAULT 0.1,
  `weightProjectDelayImpact` float DEFAULT 0.1,
  `weightBudgetDeviationImpact` float DEFAULT 0.1,
  `weightAccuracy` float DEFAULT 0.05,
  `weightCompliance` float DEFAULT 0.05,
  `weightCommunityEngagement` float DEFAULT 0.05,
  `weightTotalProjects` float DEFAULT NULL,
  `weightCompletedProjects` float DEFAULT NULL,
  `weightTotalTasks` float DEFAULT NULL,
  `weightCompletedTasks` float DEFAULT NULL,
  `weightTotalProposals` float DEFAULT NULL,
  `weightApprovedProposals` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ranking_weights`
--
INSERT INTO `ranking_weights` (`id`, `weightSolvency`, `weightLiquidity`, `weightROI`, `weightCompletionRate`, `weightApprovalRate`, `weightProjectDelayImpact`, `weightBudgetDeviationImpact`, `weightAccuracy`, `weightCompliance`, `weightCommunityEngagement`, `weightTotalProjects`, `weightCompletedProjects`, `weightTotalTasks`, `weightCompletedTasks`, `weightTotalProposals`, `weightApprovedProposals`) VALUES
(1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1);
--------------------------------------------------------

--
-- Table structure for table `renewal_application`
--

CREATE TABLE `renewal_application` (
  `application_id` int(11) NOT NULL,
  `cso_representative_id` int(11) NOT NULL,
  `datasheet_org` varchar(255) DEFAULT NULL,
  `datasheet_org_status` enum('Pending','Approved','Denied') DEFAULT 'Pending',
  `goodstanding_lce` varchar(255) DEFAULT NULL,
  `goodstanding_lce_status` enum('Pending','Approved','Denied') DEFAULT 'Pending',
  `permit_mayor` varchar(255) DEFAULT NULL,
  `permit_mayor_status` enum('Pending','Approved','Denied') DEFAULT 'Pending',
  `permit_bir` varchar(255) DEFAULT NULL,
  `permit_bir_status` enum('Pending','Approved','Denied') DEFAULT 'Pending',
  `certificate_reg` varchar(255) DEFAULT NULL,
  `certificate_reg_status` enum('Pending','Approved','Denied') DEFAULT 'Pending',
  `goodstanding_ga` varchar(255) DEFAULT NULL,
  `goodstanding_ga_status` enum('Pending','Approved','Denied') DEFAULT 'Pending',
  `omnibus` varchar(255) DEFAULT NULL,
  `omnibus_status` enum('Pending','Approved','Denied') DEFAULT 'Pending',
  `bio_data` varchar(255) DEFAULT NULL,
  `bio_data_status` enum('Pending','Approved','Denied') DEFAULT 'Pending',
  `articles_of_incorporation` varchar(255) DEFAULT NULL,
  `articles_of_incorporation_status` enum('Pending','Approved','Denied') DEFAULT 'Pending',
  `incumbent_officers` varchar(255) DEFAULT NULL,
  `incumbent_officers_status` enum('Pending','Approved','Denied') DEFAULT 'Pending',
  `accomplishment_reports` varchar(255) DEFAULT NULL,
  `accomplishment_reports_status` enum('Pending','Approved','Denied') DEFAULT 'Pending',
  `disclosure` varchar(255) DEFAULT NULL,
  `disclosure_status` enum('Pending','Approved','Denied') DEFAULT 'Pending',
  `affidavit` varchar(255) DEFAULT NULL,
  `affidavit_status` enum('Pending','Approved','Denied') DEFAULT 'Pending',
  `status` enum('Pending','Accredited','Denied') DEFAULT 'Pending',
  `overall_status` enum('Pending','Accepted','Denied') DEFAULT 'Pending',
  `remarks` text DEFAULT 'No Remarks.',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `schedule` datetime DEFAULT NULL,
  `status_updated_at` datetime DEFAULT NULL,
  `hardcopy_submission_date` date DEFAULT NULL,
  `datasheet_org_remarks` text DEFAULT NULL,
  `goodstanding_lce_remarks` text DEFAULT NULL,
  `permit_mayor_remarks` text DEFAULT NULL,
  `permit_bir_remarks` text DEFAULT NULL,
  `certificate_reg_remarks` text DEFAULT NULL,
  `goodstanding_ga_remarks` text DEFAULT NULL,
  `omnibus_remarks` text DEFAULT NULL,
  `bio_data_remarks` text DEFAULT NULL,
  `articles_of_incorporation_remarks` text DEFAULT NULL,
  `incumbent_officers_remarks` text DEFAULT NULL,
  `accomplishment_reports_remarks` text DEFAULT NULL,
  `disclosure_remarks` text DEFAULT NULL,
  `affidavit_remarks` text DEFAULT NULL,
  `cso_status` enum('Pending','Approved','Denied') DEFAULT 'Pending',
  `datasheet_org_admin_remarks` text DEFAULT NULL,
  `goodstanding_lce_admin_remarks` text DEFAULT NULL,
  `permit_mayor_admin_remarks` text DEFAULT NULL,
  `permit_bir_admin_remarks` text DEFAULT NULL,
  `certificate_reg_admin_remarks` text DEFAULT NULL,
  `goodstanding_ga_admin_remarks` text DEFAULT NULL,
  `omnibus_admin_remarks` text DEFAULT NULL,
  `bio_data_admin_remarks` text DEFAULT NULL,
  `articles_of_incorporation_admin_remarks` text DEFAULT NULL,
  `incumbent_officers_admin_remarks` text DEFAULT NULL,
  `accomplishment_reports_admin_remarks` text DEFAULT NULL,
  `disclosure_admin_remarks` text DEFAULT NULL,
  `affidavit_admin_remarks` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE `tasks` (
  `id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `status` enum('Pending','In Progress','Done') NOT NULL DEFAULT 'Pending',
  `file_path` varchar(255) DEFAULT NULL,
  `spent` decimal(10,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `comments` text DEFAULT NULL,
  `proposed_start_date` date DEFAULT NULL,
  `proposed_end_date` date DEFAULT NULL,
  `actual_start_date` date DEFAULT NULL,
  `actual_end_date` date DEFAULT NULL,
  `milestone_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tasks`
--


-- --------------------------------------------------------

--
-- Table structure for table `task_dependencies`
--

CREATE TABLE `task_dependencies` (
  `id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `task_id` int(11) NOT NULL,
  `predecessor_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `thresholds`
--

CREATE TABLE `thresholds` (
  `id` int(11) NOT NULL,
  `roi_threshold` decimal(5,2) NOT NULL,
  `liability_threshold` decimal(5,2) NOT NULL,
  `solvency_threshold` decimal(5,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `thresholds`
--
INSERT INTO `thresholds` (`id`, `roi_threshold`, `liability_threshold`, `solvency_threshold`) VALUES
(1, 0.07, 1.00, 0.60);

-- Indexes for dumped tables
--

--
-- Indexes for table `accreditation_application`
--
ALTER TABLE `accreditation_application`
  ADD PRIMARY KEY (`application_id`),
  ADD KEY `idx_cso_representative` (`cso_representative_id`),
  ADD KEY `idx_status` (`status`),
  ADD KEY `idx_overall_status` (`overall_status`);

--
-- Indexes for table `accreditation_documents`
--
ALTER TABLE `accreditation_documents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `application_id` (`application_id`);

--
-- Indexes for table `activities`
--
ALTER TABLE `activities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `task_id` (`task_id`);

--
-- Indexes for table `announcements`
--
ALTER TABLE `announcements`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cso_chairperson`
--
ALTER TABLE `cso_chairperson`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cso_name` (`cso_name`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `latitude` (`latitude`),
  ADD KEY `longitude` (`longitude`);

--
-- Indexes for table `cso_evaluations`
--
ALTER TABLE `cso_evaluations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cso_id` (`cso_id`);

--
-- Indexes for table `cso_representative`
--
ALTER TABLE `cso_representative`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `cso_name` (`cso_name`);

--
-- Indexes for table `documents`
--
ALTER TABLE `documents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cso_representative_id` (`cso_representative_id`);

--
-- Indexes for table `files`
--
ALTER TABLE `files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `announcement_id` (`announcement_id`);

--
-- Indexes for table `financial_report`
--
ALTER TABLE `financial_report`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `milestones`
--
ALTER TABLE `milestones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_id` (`project_id`);

--
-- Indexes for table `milestone_tasks`
--
ALTER TABLE `milestone_tasks`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `milestone_id` (`milestone_id`,`task_id`),
  ADD KEY `task_id` (`task_id`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cso_id` (`cso_id`);

--
-- Indexes for table `project_cso`
--
ALTER TABLE `project_cso`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_id` (`project_id`),
  ADD KEY `cso_id` (`cso_id`);

--
-- Indexes for table `proposal`
--
ALTER TABLE `proposal`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_proposal_cso_representative` (`cso_representative_id`);

--
-- Indexes for table `ranking_weights`
--
ALTER TABLE `ranking_weights`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `renewal_application`
--
ALTER TABLE `renewal_application`
  ADD PRIMARY KEY (`application_id`);

--
-- Indexes for table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_tasks_project` (`project_id`),
  ADD KEY `fk_tasks_milestone` (`milestone_id`);

--
-- Indexes for table `task_dependencies`
--
ALTER TABLE `task_dependencies`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_dependency` (`task_id`,`predecessor_id`),
  ADD KEY `project_id` (`project_id`),
  ADD KEY `predecessor_id` (`predecessor_id`);

--
-- Indexes for table `thresholds`
--
ALTER TABLE `thresholds`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accreditation_application`
--
ALTER TABLE `accreditation_application`
  MODIFY `application_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `accreditation_documents`
--
ALTER TABLE `accreditation_documents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `activities`
--
ALTER TABLE `activities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `announcements`
--
ALTER TABLE `announcements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `cso_chairperson`
--
ALTER TABLE `cso_chairperson`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `cso_evaluations`
--
ALTER TABLE `cso_evaluations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `cso_representative`
--
ALTER TABLE `cso_representative`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `documents`
--
ALTER TABLE `documents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `files`
--
ALTER TABLE `files`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `financial_report`
--
ALTER TABLE `financial_report`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `milestones`
--
ALTER TABLE `milestones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `milestone_tasks`
--
ALTER TABLE `milestone_tasks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- AUTO_INCREMENT for table `project_cso`
--
ALTER TABLE `project_cso`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- AUTO_INCREMENT for table `proposal`
--
ALTER TABLE `proposal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT for table `ranking_weights`
--
ALTER TABLE `ranking_weights`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `renewal_application`
--
ALTER TABLE `renewal_application`
  MODIFY `application_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=141;

--
-- AUTO_INCREMENT for table `task_dependencies`
--
ALTER TABLE `task_dependencies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT for table `thresholds`
--
ALTER TABLE `thresholds`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `accreditation_application`
--
ALTER TABLE `accreditation_application`
  ADD CONSTRAINT `accreditation_application_ibfk_1` FOREIGN KEY (`cso_representative_id`) REFERENCES `cso_representative` (`id`);

--
-- Constraints for table `accreditation_documents`
--
ALTER TABLE `accreditation_documents`
  ADD CONSTRAINT `accreditation_documents_ibfk_1` FOREIGN KEY (`application_id`) REFERENCES `accreditation_application` (`application_id`) ON DELETE CASCADE;

--
-- Constraints for table `activities`
--
ALTER TABLE `activities`
  ADD CONSTRAINT `activities_ibfk_1` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cso_evaluations`
--
ALTER TABLE `cso_evaluations`
  ADD CONSTRAINT `cso_evaluations_ibfk_1` FOREIGN KEY (`cso_id`) REFERENCES `cso_chairperson` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cso_representative`
--
ALTER TABLE `cso_representative`
  ADD CONSTRAINT `cso_representative_ibfk_1` FOREIGN KEY (`cso_name`) REFERENCES `cso_chairperson` (`cso_name`);

--
-- Constraints for table `documents`
--
ALTER TABLE `documents`
  ADD CONSTRAINT `documents_ibfk_1` FOREIGN KEY (`cso_representative_id`) REFERENCES `cso_representative` (`id`);

--
-- Constraints for table `files`
--
ALTER TABLE `files`
  ADD CONSTRAINT `files_ibfk_1` FOREIGN KEY (`announcement_id`) REFERENCES `announcements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `milestones`
--
ALTER TABLE `milestones`
  ADD CONSTRAINT `milestones_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `milestone_tasks`
--
ALTER TABLE `milestone_tasks`
  ADD CONSTRAINT `milestone_tasks_ibfk_1` FOREIGN KEY (`milestone_id`) REFERENCES `milestones` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `milestone_tasks_ibfk_2` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `projects`
--
ALTER TABLE `projects`
  ADD CONSTRAINT `projects_ibfk_1` FOREIGN KEY (`cso_id`) REFERENCES `cso_chairperson` (`id`);

--
-- Constraints for table `project_cso`
--
ALTER TABLE `project_cso`
  ADD CONSTRAINT `project_cso_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `project_cso_ibfk_2` FOREIGN KEY (`cso_id`) REFERENCES `cso_chairperson` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `proposal`
--
ALTER TABLE `proposal`
  ADD CONSTRAINT `fk_proposal_cso_representative` FOREIGN KEY (`cso_representative_id`) REFERENCES `cso_representative` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `proposal_ibfk_1` FOREIGN KEY (`cso_representative_id`) REFERENCES `cso_representative` (`id`);

--
-- Constraints for table `tasks`
--
ALTER TABLE `tasks`
  ADD CONSTRAINT `fk_tasks_milestone` FOREIGN KEY (`milestone_id`) REFERENCES `milestones` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_tasks_project` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `task_dependencies`
--
ALTER TABLE `task_dependencies`
  ADD CONSTRAINT `task_dependencies_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `task_dependencies_ibfk_2` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `task_dependencies_ibfk_3` FOREIGN KEY (`predecessor_id`) REFERENCES `tasks` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
