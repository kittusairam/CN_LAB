import sys
input_file=input("Enter Trace file : ")
fp=open(input_file,"r")
name=input_file.split(".")
name=name[0]
nodes=set()
pairs=[[]]
for line in fp:
	l1=line.split()
	a=list(l1[2])
	a.append(l1[3])
	nodes.add(l1[2])
	nodes.add(l1[3])
	pairs.append(a)
pairs = list(set(map(tuple,pairs)))
pairs=filter(None, pairs)
print("Total Nodes in Trace File are :", end="")
print(nodes)
print("Total connection pairs are :")
out_file=name+".tcl"
ofp=open(out_file,"w")
ofp.write("set ns [new Simulator]\n")
ofp.write("set nf [open "+name+".nam w]\n")
ofp.write("$ns namtrace-all $nf\n")
ofp.write("set nd [open "+name+".tr r]\n")
for i in nodes:
	ofp.write("set n")
	ofp.write(i)
	ofp.write(" [$ns node]\n")
for i in pairs:
	print(i)
	ofp.write("$ns duplex-link $n")
	ofp.write(i[0])
	#print(i)
	ofp.write(" $n")
	ofp.write(i[1])
	ofp.write(" 10Mbps 10ms DropTail\n")
ofp.write("proc finish { } {\n")
ofp.write("	global ns nf nd\n")
ofp.write("	$ns flush-trace\n")
ofp.write("	close $nf\n")
ofp.write("	exec nam "+name+".nam &\n")
ofp.write("	exit 0\n")
ofp.write("}\n")
ofp.write("")
ofp.write("$ns at 5.0 \"finish\"\n")
ofp.write("$ns run\n")





