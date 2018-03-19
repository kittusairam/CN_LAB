set ns [new Simulator]
set nf [open krish.nam w]
$ns namtrace-all $nf
set nd [open krish.tr r]
$ns trace-all $nd
set n0 [$ns node]
set n1 [$ns node]
set n2 [$ns node]
set n3 [$ns node]
$ns duplex-link $n0 $n1 10Mbps 10ms DropTail
$ns duplex-link $n1 $n2 10Mbps 10ms DropTail
$ns duplex-link $n2 $n3 10Mbps 10ms DropTail
$ns duplex-link-op $n0 $n1 orient left
$ns duplex-link-op $n1 $n2 orient left
$ns duplex-link-op $n2 $n3 orient left
proc finish { } {
	global ns nf nd
	$ns flush-trace
	close $nf
	exec nam krish.nam &
	exit 0
}
$ns at 5.0 "finish"
$ns run
