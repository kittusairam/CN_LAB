set ns [new Simulator]
set nf [open krish.nam w]
$ns namtrace-all $nf
set nd [open krish.tr w]
$ns trace-all $nd
set n0 [$ns node]
set n1 [$ns node]
set n2 [$ns node]
set n3 [$ns node]
set n4 [$ns node]
$ns duplex-link $n0 $n1 10Mbps 10ms DropTail
$ns duplex-link $n0 $n2 10Mbps 10ms DropTail
$ns duplex-link $n0 $n3 10Mbps 10ms DropTail
$ns duplex-link $n0 $n4 10Mbps 10ms DropTail
$ns duplex-link $n1 $n0 10Mbps 10ms DropTail
$ns duplex-link $n1 $n2 10Mbps 10ms DropTail
$ns duplex-link $n1 $n3 10Mbps 10ms DropTail
$ns duplex-link $n1 $n4 10Mbps 10ms DropTail
$ns duplex-link $n2 $n0 10Mbps 10ms DropTail
$ns duplex-link $n2 $n1 10Mbps 10ms DropTail
$ns duplex-link $n2 $n3 10Mbps 10ms DropTail
$ns duplex-link $n2 $n4 10Mbps 10ms DropTail
$ns duplex-link $n3 $n0 10Mbps 10ms DropTail
$ns duplex-link $n3 $n1 10Mbps 10ms DropTail
$ns duplex-link $n3 $n2 10Mbps 10ms DropTail
$ns duplex-link $n3 $n4 10Mbps 10ms DropTail
$ns duplex-link $n4 $n0 10Mbps 10ms DropTail
$ns duplex-link $n4 $n1 10Mbps 10ms DropTail
$ns duplex-link $n4 $n2 10Mbps 10ms DropTail
$ns duplex-link $n4 $n3 10Mbps 10ms DropTail
proc finish { } {
	global ns nf nd
	$ns flush-trace
	close $nf
	exec nam krish.nam &
	exit 0
}
$ns at 5.0 "finish"
$ns run
