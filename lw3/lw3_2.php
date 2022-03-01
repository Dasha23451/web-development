<?php
	header("Content-Type: text/plain");
	require_once('utils.php');
	
	$inputText = getQueryStringParameter('identifier');
	
	if ($inputText !== null && strlen($inputText) > 0)
	{
		checkIndentifier($inputText);
	}
	else
	{
		echo 'Введены некорректные данные';
	}
	
	function checkIndentifier(string $identifier)
	{
		$hasErrors = false;
		if (!isDigit($identifier[0]))
		{
			for ($i = 0; $i < strlen($identifier); $i++)
			{
				if (!isAllowedSymbol($identifier[$i]))
				{
					echo 'В идентификаторе не может содержаться ' . "'" . $identifier[$i] . "'.\n";
					$hasErrors = true;
				}
			}
		}
		else
		{
			echo "Идентификатор не может начинаться с цифры.\n";
			$hasErrors = true;
		}
		echo $hasErrors ? 'no' : 'yes';
	}
