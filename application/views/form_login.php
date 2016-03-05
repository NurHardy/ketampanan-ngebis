<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<title><?php if (isset($pageTitle)) echo $pageTitle; else echo "Untitled"; ?> - Administrator</title>
		<link href="<?php echo base_url("/assets/global.css"); ?>" rel="stylesheet" type="text/CSS">
	</head>
	<body id="background">
		<div class="wrapper">
			<div class="login-box">
				<form action="<?php echo site_url("user/get_user_login"); ?>" method="post">
					<table height="70px">
						<tr>
							<td>Username</td>
							<td>:</td>
							<td><input class="input-style" type="text" name="username" maxlength="20"></td>
						</tr>
						<tr>
							<td>Password</td>
							<td>:</td>
							<td><input class="input-style" type="password" name="password" maxlength="20"></td>
						</tr>
					</table>
					<br/>
					<?php
					if (isset($kesalahan)) {
						echo "<center><font color=\"red\" >";
						echo $kesalahan;
						echo "</font></center>";
					}
					?>
					<center><a href="<?php echo site_url(); ?>">&laquo; Home</a> | <input class="button-style" type="submit" value="login"></center>
				</form>
			</div>
		</div>
	</body>
</html>