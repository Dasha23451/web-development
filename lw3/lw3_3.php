<?php
	header("Content-Type: text/plain");
	require_once('utils.php');
	
	$inputText = getQueryStringParameter('password');
	
	if ($inputText !== null && strlen($inputText) > 0)
	{
		echo countPasswordDifficulty($inputText);
	}
	else
	{
		echo 'Введены некорректные данные';
	}
	
	function countPasswordDifficulty(string $password): int
	{
		$difficulty = strlen($password) * 4;
		$digitsCount = 0;
		$upperCaseLettersCount = 0;
		$lowerCaseLettersCount = 0;
		$hasDigits = false;
		$hasLetters = false;
		
		for ($i = 0; $i < strlen($password); $i++)
		{
			if (isDigit($password[$i]))
			{
				$digitsCount++;
				$hasDigits = true;
			}
			if (isLetter($password[$i]))
            {
                if (ctype_upper($password[$i]))
                {
                    $upperCaseLettersCount++;
                }
                if (ctype_lower($password[$i]))
                {
                    $lowerCaseLettersCount++;
                }
                $hasLetters = true;
            }

			if (substr_count($password[$i], $password) > 1)
			{
				$difficulty -= substr_count($password[$i], $password);
			}
		}
		
		if (!$hasDigits)
		{
			$difficulty -= strlen($password);
		}
		
		if (!$hasLetters)
		{
			$difficulty -= strlen($password);
		}
		
		$difficulty += $digitsCount * 4; 
		$difficulty += ((strlen($password) - $upperCaseLettersCount) * 2);
		$difficulty += ((strlen($password) - $lowerCaseLettersCount) * 2);
		
		return $difficulty;
	}
