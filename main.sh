 #!/bin/bash

choice="$1"
case "$choice" in
   -1)
      if [ ! -f question1.sh ]; then
          echo "internal problem,sorry"
          exit 1
      fi
      ./question1.sh ${@:2}
    ;;
   -2)
      if [ ! -f question2.sh ]; then
          echo "internal problem,sorry"
          exit 1
      fi
      ./question2.sh ${@:2}
    ;;
   -3)
      if [ ! -f question3.sh ]; then
          echo "internal problem,sorry"
          exit 1
      fi
      ./question3.sh 
    ;;
    -4)
      if [ ! -f question4.sh ]; then
          echo "internal problem,sorry"
          exit 1
      fi
      ./question4.sh ${@:2}
    ;;
    -5)
      if [ ! -f question5.sh ]; then
          echo "internal problem,sorry"
          exit 1
      fi
      ./question5.sh 
    ;;



         
esac
