set ns [new Simulator]
set nf [open krish.nam w]
$ns namtrace-all $nf
set nd [open krish.tr w]
$ns trace-all $nd
set n0 [$ns node]
set n1 [$ns node]
set n2 [$ns node]
set n3 [$ns node]

set udp0 [new Agent/UDP]
set udp1 [new Agent/UDP]
set udp2 [new Agent/UDP]
set udp3 [new Agent/Null]

$ns attach-agent $n0 $udp0
$ns attach-agent $n1 $udp1
$ns attach-agent $n2 $udp2
$ns attach-agent $n3 $udp3

$ns connect $udp0 $udp3

set cbr0 [new Application/Traffic/CBR]

$cbr0 set packetsize _ 500


$cbr0 set interval _ 0.200


$ns duplex-link $n0 $n1 10Mbps 10ms DropTail
$ns duplex-link $n1 $n2 10Mbps 10ms DropTail
$ns duplex-link $n2 $n3 10Mbps 10ms DropTail
$ns duplex-link-op $n0 $n1 orient down
$ns duplex-link-op $n1 $n2 orient left
$ns duplex-link-op $n2 $n3 orient up
proc finish { } {
	global ns nf nd
	$ns flush-trace
	close $nf
	exec nam krish.nam &
	exit 0
}
$ns at 5.0 "finish"
$cbr0 attach-agent $udp0
$ns at 0.5 "$cbr0 start"
$ns at 1.0 "$cbr0 stop"
$ns run
