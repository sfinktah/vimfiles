<?php
  echo preg_replace_callback("/#\{(.+?)\}/", function ($matches) { return "\" + {$matches[1]} + \""; }, file_get_contents("php://stdin"));

eval(urldecode("echo+preg_replace_callback%28%22%2F%23%5C%7B%28.%2B%3F%29%5C%7D%2F%22%2C+function+%28%24matches%29+%7B+return+%22%5C%22+%2B+%7B%24matches%5B1%5D%7D+%2B+%5C%22%22%3B+%7D%2C+file_get_contents%28%22php%3A%2F%2Fstdin%22%29%29%3B%0A"));
?>
