#------------------------------------------------------- 
# This ns script has been created by the nam editor.
# If you edit it manually, the nam editor might not
# be able to open it properly in the future.
#
# EDITING BY HAND IS AT YOUR OWN RISK!
#------------------------------------------------------- 
# Create a new simulator object.
set ns [new Simulator]
# Create a nam trace datafile.
set namfile [open /home/krish/Desktop/CN/wireles.nam w]
$ns namtrace-all $namfile

# Create wired nodes.

# ----- Setup wireless environment. ----
set wireless_tracefile [open /home/krish/Desktop/CN/wireles.trace w]
set topography [new Topography]
$ns trace-all $wireless_tracefile
$ns namtrace-all-wireless $namfile 643.515625 609.656250
$topography load_flatgrid 643.515625 609.656250
#
# Create God
#
set god_ [create-god 4]
#global node setting
$ns node-config -adhocRouting DSR \
                 -llType LL \
                 -macType Mac/802_11 \
                 -ifqType Queue/DropTail/PriQueue \
                 -ifqLen 50 \
                 -antType Antenna/OmniAntenna \
                 -propType Propagation/TwoRayGround \
                 -phyType Phy/WirelessPhy \
                 -channel [new Channel/WirelessChannel] \
                 -topoInstance $topography \
                 -agentTrace ON \
                 -routerTrace OFF \
                 -macTrace ON

# Create wireless nodes.
set node(4) [$ns node]
## node(4) at 623.515625,538.093750
$node(4) set X_ 623.515625
$node(4) set Y_ 538.093750
$node(4) set Z_ 0.0
$node(4) color "black"
$ns initial_node_pos $node(4) 10.000000
set node(3) [$ns node]
## node(3) at 605.984375,589.656250
$node(3) set X_ 605.984375
$node(3) set Y_ 589.656250
$node(3) set Z_ 0.0
$node(3) color "black"
$ns initial_node_pos $node(3) 10.000000
set node(2) [$ns node]
## node(2) at 550.640625,570.750000
$node(2) set X_ 550.640625
$node(2) set Y_ 570.750000
$node(2) set Z_ 0.0
$node(2) color "black"
$ns initial_node_pos $node(2) 10.000000
set node(1) [$ns node]
## node(1) at 504.578094,596.187500
$node(1) set X_ 504.578094
$node(1) set Y_ 596.187500
$node(1) set Z_ 0.0
$node(1) color "black"
$ns initial_node_pos $node(1) 10.000000

# Create links between nodes.
# Add Link Loss Models

# Create agents.

# Connect agents.
# Run the simulation
proc finish {} {
	global ns namfile
	$ns flush-trace
	close $namfile
	exec nam -r 2000.000000us /home/krish/Desktop/CN/wireles.nam &	
	exit 0
	}
$ns at 1.000000 "finish"
$ns run
