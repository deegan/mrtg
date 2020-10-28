<?php

        $dir = ".";
        $files = scandir($dir);
        echo "<pre>";
        for($i=0;$i<count($files);$i++)
        {
                if(is_dir($files[$i]) && $files[$i] != "." && $files[$i] != ".." && $files[$i] != "scripts" && $files[$i] != "cfg")
                {
                                                /* print_r($files[$i]); */
                                                echo "<a href=\"".$files[$i]."/index.html\" target=\"main\">".$files[$i]."</a><br>";
                }
        }
        echo "</pre>";
?>

