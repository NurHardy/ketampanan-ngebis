<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<title>Administrator</title>
		<link href="<?php echo base_url("/assets/global.css"); ?>" rel="stylesheet" type="text/CSS">
	</head>
	<body id="background">
		<div class="wrapper">
			<center>Welcome... <?php echo $loggedInFullname; ?></center>
			<br/>
			<?php echo $this->session->userdata('user_id'); ?>
			<br/>
			<center><a href="<?php echo site_url('user/user_logout'); ?>">logout</a></center>
		</div>
	</body>
</html>