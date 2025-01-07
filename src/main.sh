#!/bin/bash


draw_ball_2() {

 local x_2=$1
 local y_2=$2

    
    #draw_grid  "."
    tput cup $y_2 $x_2
    ansi --blue " ### "

    tput cup $((y_2 + 1)) $((x_2))
    ansi --blue "#####"

    tput cup $((y_2 + 2)) $((x_2 + 1))
    ansi --blue "###"

    sleep 0

}

draw_ball_3() {

  echo "Ball 3"


}


draw_ball() {
 local x=$1
 local y=$2

    
    tput cup $y $x
    ansi --red " ### "

    tput cup $((y + 1)) $((x))
    ansi --red "#####"

    tput cup $((y + 2)) $((x + 1))
    ansi --red "###"


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
        cols=$(tput cols)
        lines=$(tput lines)

        x=$(( 1 + RANDOM % lines / 2 ))
        y=$(( 1 + RANDOM % cols / 2  ))

        x_2=0
        y_2=40

        dx=1
        dy=1

        dy_2=1
        dx_2=1



        while true; do
                draw_ball $y $x
                sleep 0.05
                clear
                draw_ball_2 $y_2 $x_2 
                tput civis

                x=$((x + dx ))
                y=$((y + dy ))

                x_2=$((x_2 + dx_2 ))
                y_2=$((y_2 + dy_2 ))
                

                if (( x >= lines - 4|| x <= 0 )); then
                  dx=$((dx * -1))
                fi

                if (( y >= cols - 6|| y <= 0 )); then
                  dy=$((dy * -1))
                fi


                if (( x_2 >= lines - 5 || x_2 <= 0 )); then
                  dx_2=$((dx_2 * -1))
                fi

                if (( y_2 >= cols - 6 || y_2 <= 0 )); then
                  dy_2=$((dy_2 * -1))
                fi




        done
        tput cnorm

}
main

