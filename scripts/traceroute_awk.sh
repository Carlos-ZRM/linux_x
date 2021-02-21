#!/bin/bash

traceroute -M icmp google.com |awk -F ' '  '{                           
     if ($1 > 0)
	{
	  max_nf = $1
	  vector[max_nf, 0]=$2
          vector[max_nf, 1]=$3
          vector[max_nf, 2]=$4

        }
     
    
}

END {
     for (x = 1; x <= max_nf; x++) {
	  printf(systime())
	  printf(" ")
          for (y= 0; y < 3; y ++)
               printf("%s ", vector[x, y])
          printf("\n")
     }
}'
