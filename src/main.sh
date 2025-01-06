#!/bin/bash

draw_ball() {
 local x=$1
 local y=$2

 local red="\e[31m"
 local reset="\e[0m"
    

    tput cup $y $x
    echo -e "${red} ### ${reset}"

    tput cup $((y + 1)) $((x))
    echo -e "${red}#####${reset}"

    tput cup $((y + 2)) $((x + 1))
    echo -e "${red}###${reset}"



    


    sleep 0.05

    # Lösche die erste Zeile
    tput cup $y $x
    echo "   "

    # Lösche die zweite Zeile
    tput cup $((y + 1)) $x
    echo "   "
    tput cup $((y - 2)) $x
    echo "   "

    # ansi --reset
    clear
}

draw_grid() {
      local symbol=$1

      for (( j=0;j<$lines; j++ )); do
        for (( i=0;i<$cols; i++  )); do
          if [ $i == $cols ]; then
                echo -n "$symbol"
          else
            echo -n "$symbol"
          fi
        done
      done

}


main() {
        x=0
        y=0

        dx=1
        dy=1

        cols=$(tput cols)
        lines=$(tput lines)


        while true; do
                draw_ball $y $x
                tput civis

                x=$((x + dx ))
                y=$((y + dy ))

                
                draw_grid  ""

                if (( x >= lines - 4|| x <= 0 )); then
                  dx=$((dx * -1))
                fi
                if (( y >= cols - 6|| y <= 0 )); then
                  dy=$((dy * -1))
                fi


        done
        tput cnorm
        clear

}
main
