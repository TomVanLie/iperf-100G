
# Iperf Traffic Generation in 100GBase Ethernet Card Loop

This document provides a short description of the Iperf 100G traffic generation in a 100GBase Ethernet loop.

The primary aim of this tool is to facilitate the running of Iperf in a 100Gbps loop on a single computer equipped with a network card that contains two 100Gbps interfaces. By default, Linux uses the loopback interface to handle packets for IP addresses that are processed internally without exiting the machine. This tool is developed based on the experience shared by Steve Kehlet, which can be found at this [link](https://serverfault.com/a/309442).

Iperf does not inherently support multithread execution. Hence, these simple scripts have been created to enable multiple instances of Iperf to run concurrently, thereby achieving greater throughput. It's essential to ensure that Iperf runs on different cores and processors.




## Authors

- [@TomVanLie](https://www.github.com/TomVanLie)


## Installation

To install this project, use git to clone the repository and navigate to the project directory:

```bash
  git clone https://github.com/TomVanLie/iperf-100G
  cd iperf-100G
```
    
## Deployment

To configure NAT rules and enable the multicore operation of Iperf, you must run the setup script. This can be done by executing the following command:
```bash
sh setup.sh
```
After running the script, test to ensure that the communication loop is functioning correctly on the 100G interface cards by running:
```bash
ping 10.60.0.1
# OR 
ping 10.60.1.1
```


## Usage/Examples

Here's how to use this tool:

First, open a terminal window and run the servers with the following command:

```bash
sh server.sh
```
Next, open a second terminal window and initiate the clients using:

```bash
sh client.sh
```
Finally, open a third terminal window and use iftop to monitor the throughput:

```bash
iftop -i ens2f0np0
# OR
iftop -i ens2f1np1
```

Note: This scenario is tailored to our server configuration. You might need to modify the files and commands to align with your specific setup.

Sometimes ipertf may stop working, or refuses to exit, feel free to kill all processes by running:

```bash
sh killiperf.sh
```

## Interface Disconnection/Reconnection

If the interface goes down and is subsequently brought back up, it is essential to run the reload script. This script refreshes ARP and iptables rules:

```bash
sh reload.sh
```

## Appendix

This scenario is specifically applicable to our server configuration, which includes an AMD Epyc 2x48 core CPU along with a dual 100Gbps Ethernet card.


## License

Copyright (c) 2023 TomVanLie

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

