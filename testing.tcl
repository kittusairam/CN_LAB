set ns [new Simulator]
set nf [open krish.nam r]
$ns namtrace-all $nf
set nd [open krish.tr r]
$ns trace-all $nd
proc finish { } {
	global ns nf nd
	$ns flush-trace
	close $nf
	close $nd
	exec nam krish.nam & krish.tr
	exit 0
}
$ns at 5.0 "finish"
$ns run
