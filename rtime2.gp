set terminal postscript eps color enhanced dashed dashlength 5.0 linewidth 3.0 butt palfuncparam 2000,0.003 'Courier-New,bold' 50 
set output "nondiv_hydro2.ps"

set size 2.0,2.0

#set lmargin 10.4
#set rmargin 3.4
set xlabel "b/a" font "Times-Roman, bold 10"
#set title "e) Sensitivity to time interval   " font "Typewriter bold, 50"
#set xlabel "log_{10} pw (Wm^{-2})" font "Typewriter, bold 20"
#set xlabel "log_{10} ~{pw}^{0.08/=35\-}@^{t}&1 (Wm^{-2})" font "Typewriter, bold 20"
#set xlabel "log_{10} ~{pw}^{0.08/=35\-}@^{t}&1 (Wm^{-2})" font "Helvetica, bold 10"

#set xlabel "h " offset 0.0,-1.0 font "arial bold, 46"

#set title "The realistic N(z): North Atlantic" font "Typewriter bold, 36"
#set xlabel "log_{10} pw (Wm^{-2})" font "Typewriter, bold 20"
#set xlabel "log_{10} ~{pw}^{0.08/=35\-}@^{t}&1 (Wm^{-2})" font "Typewriter, bold 20" 
#set xlabel "log_{10} ~{pw}^{0.08/=35\-}@^{t}&1 (Wm^{-2})" font "Helvetica, bold 10"

#set xlabel "{/Symbol \114}^{-1} (km^{-1}) " font "arial bold, 36"

#set ylabel "log_{10} ( {/Symbol=18 \362@_{/=11 -H + 100}^{/=11 -H + <depth>}}{/Helvetica{/Symbol r}{/Symbol \145}{dz}} ) (Wm^{-2})" offset 0.1,0.0 font "Helvetica, bold 20"


#set ylabel "log_{10} {/Symbol=80 \362@_{/=9.6 -H + 100}^{/=11 -<depth>}&{0.5}{/Helvetica {/Symbol r}{/Symbol \145}{dz}}} Wm^{-2}" offset 2.0,0.0 font "Typew\riter, bold 28"
#set ylabel "integrated dissipation rate  log_{10} ( {/Symbol=45 \362@_{/=18 -H + 50}^{/=18 -1000}}&{0.5}{{/Symbol r}{/Symbol \145}d}{z} ) (Wm^{-2})" offset -1.0,0.0 font "arial bold, 26"

#set ylabel "C (W m^{-1})" offset -1.0,0.0 font "arial bold, 36"

#set ylabel "r" offset -1.0,0.0 font "arial bold, 75"

#set xlabel "Time (hour)" offset 0.0,-1.0 font "arial bold, 75"

#set xlabel "{/Symbol=85 \104}t (hour)" offset 0.0,-1.0 font "arial bold, 75"
#font "Typewriter, bold 20"
#set ylabel "log_{10} {/Symbol=18 \362@_{/=11 -H + 100}^{/=11 -H + <depth>}{/Symbol r}{/Symbol \145}{dz}} (Wm^{-2})" offset 0.1,0.0 font "Typewriter, bold 20"
#set mytics 5
#set xrange [1.0e-7:3.0e-2]

#set key spacing 1.4
#set yrange [-4.5:-0.5] #old
#set xrange [-4.5:-0.5] #old 
#set yrange [-6.5:-0.5]
#set xrange [-6.5:-0.5]

#set xtics ,1,30

#set xrange [0.0:2.408240]

#set xtics ("6" 0.000000, "12" 0.301030, "18" 0.477121,"24" 0.602060,"48" 0.903090,"72" 1.079181,"96" 1.204120,"120" 1.301030,"144" 1.380211,"168" 1.447158,"216" 1.556303,"246" 1.612784,"714" 2.075547)


#set xtics ("6" 0.000000, "12" 0.301030, "24" 0.602060,"48" 0.903090,"96" 1.204120,"192" 1.505150,"384" 1.806180,"768" 2.107210,"{/Symbol=80 \245}" 2.408240)

#set yrange[0.0:1.0]

#set xrange[0.0:0.2]

#set logscale y

#f(x)=x
#set mytics 1
#set mxtics 5
set mxtics 1
#set grid xtics ytics mxtics mytics
set xzeroaxis -1

set border 3
set xtics nomirror
set ytics nomirror
#set key top left Left box
#h(x) = a*x+b
#fit h(x) "<fcorpw>" using 1:2 via a,b
#set label 1 sprintf("a = %3.4f",a) at -2.5,-1.3 font "Courier-New bold, 28"
#set label 1 sprintf("a = %3.4f",a) at -3.0,-2.5 font "Helvetica, bold 20"
#set label 2 sprintf("b = %3.4f",b) at -3.0,-1.4 font "arialbd,bold 15"

set xrange [0.17609126:1.4771213]
set yrange [0.0:0.6]

set xtics ("1.5" 0.17609126, "2" 0.301030, "3" 0.47712125,"4" 0.60205999,"5" 0.69897,"6" 0.77815125,"7" 0.84509804,"8" 0.90308999,"10" 1, "15\
" 1.1760913, "20" 1.30103,"30" 1.4771213  ) font "Times-Roman, bold 30"
set ytics font "Times-Roman, bold 30"




#plot "result_mode_1_1_hydro_nondiv.dat" u (log10($1)):2 w l lt 3 lc 7 lw 3 title 'hydronondiv',"result_mode_1_1_hydro_div.dat" u (log10($1)):2 w l lt 2 lc 7 lw 3 title 'hydrodiv',"result_mode_1_1_nonhydro_div.dat" u (log10($1)):2 w l lt 1 lw 3 lc 7 title 'nonhydrodiv'


plot "result_mode_1_1_hydro_nondiv.dat" u (log10($1)):2 w l lt 13 lc 7 lw 2 notitle,"result_mode_1_1_hydro_div.dat" u (log10($1)):2 w l lt 2 lc 7 lw 2 notitle,"result_mode_1_1_nonhydro_div.dat" u (log10($1)):2 w l lt 1 lw 2 lc 7 notitle

#plot 'result_mode_2_3.dat' u 1:(log($2)) w l,'result_mode_2_3_nodiv.dat' u 1:(log($2)) w l

#plot 'c1.dat' using ($1*1.e-3):($2*1.e-3) smooth bezier lw 3 lt 1 lc 1 notitle,'c2.dat' using ($1*1.e-3):($2*1.e-3) smooth bezier lw 3 lt 1 lc 2 notitle,'c3.dat' using ($1*1.e-3):($2*1.e-3) smooth bezier lw 3 lt 1 lc 3 notitle,'c4.dat' using ($1*1.e-3):($2*1.e-3) smooth bezier lw 3 lt 1 lc 4 notitle,'c5.dat' using ($1*1.e-3):($2*1.e-3) smooth bezier lw 3 lt 1 lc 5 notitle





#plot 'c1.dat' using ($1*1.e-3):($2*1.e-3) smooth bezier lw 3 lt 1 lc 1 notitle,'c2.dat' using ($1*1.e-3):($2*1.e-3) smooth bezier lw 3 lt 1 lc 2 notitle,'c3.dat' using ($1*1.e-3):($2*1.e-3) smooth bezier lw 3 lt 1 lc 3 notitle,'c4.dat' using ($1*1.e-3):($2*1.e-3) smooth bezier lw 3 lt 1 lc 4 notitle,'c5.dat' using ($1*1.e-3):($2*1.e-3) smooth bezier lw 3 lt 1 lc 5 notitle

     
#plot "./optimelog.dat" u 1:2 with linespoints lw 3 pt 7 ps 4 lc 1 lt 1 title 'BBTRE',"" u 1:4 with linespoints lw 3 pt 7 ps 4 lc 3 lt 1 title 'LADDER3' 

 



