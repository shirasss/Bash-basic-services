 #!/bin/bash

choice="$1"
      if [ ! -f question1.sh ]; then
          echo "internal problem,sorry"
          exit 1
      fi
      ./question${choice:1:1}.sh ${@:2}
   
       
