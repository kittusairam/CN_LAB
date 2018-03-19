set r 10
set x 0
set y 0
set x2 1
set y2 1
set a [expr {sqrt( pow(($x2-$x),2) + pow(($y2-$y),2) )}] 
puts $a
if [expr $a <= $r ] {
puts "in side the cell"
} else {
puts "not in cell"
}

