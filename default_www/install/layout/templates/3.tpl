<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
	<meta http-equiv="X-UA-Compatible" content="chrome=1" />

	<title>Installer - Fork CMS</title>
	<link rel="shortcut icon" href="../backend/favicon.ico" />
	<link rel="stylesheet" type="text/css" media="screen" href="../backend/core/layout/css/screen.css" />
	<link rel="stylesheet" type="text/css" media="screen" href="layout/css/installer.css" />
	<!--[if IE 7]><link rel="stylesheet" type="text/css" media="screen" href="../backend/core/layout/css/conditionals/ie7.css" /><![endif]-->
	<script type="text/javascript" src="../frontend/core/js/jquery/jquery.js"></script>
	<script type="text/javascript" src="js/install.js"></script>
</head>
<body id="installer">
	<table border="0" cellspacing="0" cellpadding="0" id="installHolder">
		<tr>
			<td>
				<div id="installerBox" >
					<div id="installerBoxTop">
						<h2>Settings</h2>
					</div>

					{form:step3}
						{option:formError}<div style="color: red;">{$formError}</div>{/option:formError}
						<div>
							<div class="horizontal">
								<h3>Modules</h3>
								<p>Make a selection of all the modules you want to install.</p>
								<p>
									{iteration:modules}
										<label for="{$modules.id}">{$modules.chkModules} {$modules.label}</label><br />
									{/iteration:modules}
								</p>

								<h3>Languages</h3>
								<p>
									Will your site be available in multiple languages or just one? Changing this setting in a later stage, will have an influence on your URLs
								</p>

								<div>
									{iteration:languageType}
										{$languageType.rbtLanguageType} <label for="{$languageType.id}">{$languageType.label}</label><br />
										{option:languageType.multiple}
											<p id="languages" class="hidden" style="margin-left: 25px;">
												{iteration:languages}
													{$languages.chkLanguages} <label for="{$languages.id}">{$languages.label}</label><br />
												{/iteration:languages}
											</p>
										{/option:languageType.multiple}
										{option:languageType.single}
											<p id="language" class="hidden" style="margin-left: 25px;">
												{$ddmLanguage} {$ddmLanguageError}
											</p>
										{/option:languageType.single}
									{/iteration:languageType}
								</div>

								<p style="margin-top: 20px;">
									What is the default language, we should use for the website?<br />
									{$ddmDefaultLanguage} {$ddmDefaultLanguageError}
								</p>

							</div>

							<div>
								<p class="spacing">
									<a href="index.php?step=2">Previous</a>
									<input id="installerButton" class="inputButton button mainButton" type="submit" name="installer" value="Next" />
								</p>
							</div>
						</div>
					{/form:step3}
					<ul id="installerNav">
						<li><a href="http://userguide.fork-cms.be">Userguide</a></li>
						<li><a href="http://docs.fork-cms.be">Developer</a></li>
					</ul>
				</div>
			</td>
		</tr>
	</table>
</body>
</html>