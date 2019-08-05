# RED HAT DECISION MANAGER 7 - A OPTAPLANNER DEMO PROJECT

## USE CASE

Your company owns a number of cloud computers (VMs) and needs to run a number of processes (applications) on those computers. Assign each process to a computer.
There are both hard and soft constraints.

Hard Constraints:
Every computer must be able to handle the minimum hardware requirements of the sum of its processes in 3 areas:

* CPU capacity
* Memory capacity
* Network capacity

Soft Constraints:
Each computer that has one or more processes assigned, incurs a maintenance cost (which is fixed per computer).

* Cost: Minimize the total maintenance cost.

## IMPLEMENTATION

The implementation uses Decision Central's Domain Specific Language, Guided Rules Editor, Data Modeler. Everything is constructed using the UI with no DRLs at all.

## INTERACTING WITH THE DEPLOYED PROJECT USING REST API

Go to the kie-server documentation (swagger) page eg, http://localhost:8080/kie-server/docs

Execute the following commands:

1. PUT /server/containers/{containerId}/solvers/{solverId}

containerId: plannerDemo_1.0.0-SNAPSHOT
solverId: myplanner
body:

<pre>
<solver-instance>
	<solver-config-file>com/myspace/plannerdemo/Solver.solver.xml</solver-config-file>
</solver-instance>
</pre>

2. POST /server/containers/{containerId}/solvers/{solverId}/state/solving
containerId: plannerDemo_1.0.0-SNAPSHOT
solverId: myplanner
body:

<pre>
{
  "com.myspace.plannerdemo.Solution": {
    "computerList": [
      {
	"name": "Dell Server 1",
        "cpuPower": 24,
        "memory": 96,
        "networkBandwidth": 16,
        "cost": 4800
      },
      {
	"name": "Dell Server 2",
        "cpuPower": 6,
        "memory": 4,
        "networkBandwidth": 6,
        "cost": 660
      }
    ],
    "processList": [
      {
        "requiredCpuPower": 1,
        "requiredMemory": 1,
        "requiredNetworkBandwidth": 1
      },
      {
        "requiredCpuPower": 3,
        "requiredMemory": 6,
        "requiredNetworkBandwidth": 1
      },
      {
        "requiredCpuPower": 1,
        "requiredMemory": 1,
        "requiredNetworkBandwidth": 3
      },
      {
        "requiredCpuPower": 1,
        "requiredMemory": 2,
        "requiredNetworkBandwidth": 11
      },
      {
        "requiredCpuPower": 1,
        "requiredMemory": 1,
        "requiredNetworkBandwidth": 1
      },
      {
        "requiredCpuPower": 1,
        "requiredMemory": 1,
        "requiredNetworkBandwidth": 5
      }
    ]
  }
}
</pre>

3. GET /server/containers/{containerId}/solvers/{solverId}/bestsolution

containerId: plannerDemo_1.0.0-SNAPSHOT
solverId: myplanner

You will receive response something like the following:
status=SOLVING means that it is still in the process of finding abetter solution than the one provided.
status=NOT_SOLVING means this is the best solution.

<pre>
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<solver-instance>
      <container-id>plannerDemo_1.0.0-SNAPSHOT</container-id>
      <solver-id>myplanner</solver-id>
      <solver-config-file>com/myspace/plannerdemo/Solver.solver.xml</solver-config-file>
      <status>SOLVING</status>
      <score scoreClass="org.optaplanner.core.api.score.buildin.hardsoft.HardSoftScore">0hard/-5460soft</score>
      <best-solution xsi:type="solution" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
            <computerList>
                  <cost>4800</cost>
                  <cpuPower>24</cpuPower>
                  <memory>96</memory>
                  <name>Dell Server 1</name>
                  <networkBandwidth>16</networkBandwidth>
            </computerList>
            <computerList>
                  <cost>660</cost>
                  <cpuPower>6</cpuPower>
                  <memory>4</memory>
                  <name>Dell Server 2</name>
                  <networkBandwidth>6</networkBandwidth>
            </computerList>
            <processList>
                  <computer>
                        <cost>660</cost>
                        <cpuPower>6</cpuPower>
                        <memory>4</memory>
                        <name>Dell Server 2</name>
                        <networkBandwidth>6</networkBandwidth>
                  </computer>
                  <requiredCpuPower>1</requiredCpuPower>
                  <requiredMemory>1</requiredMemory>
                  <requiredNetworkBandwidth>1</requiredNetworkBandwidth>
            </processList>
            <processList>
                  <computer>
                        <cost>4800</cost>
                        <cpuPower>24</cpuPower>
                        <memory>96</memory>
                        <name>Dell Server 1</name>
                        <networkBandwidth>16</networkBandwidth>
                  </computer>
                  <requiredCpuPower>3</requiredCpuPower>
                  <requiredMemory>6</requiredMemory>
                  <requiredNetworkBandwidth>1</requiredNetworkBandwidth>
            </processList>
            <processList>
                  <computer>
                        <cost>4800</cost>
                        <cpuPower>24</cpuPower>
                        <memory>96</memory>
                        <name>Dell Server 1</name>
                        <networkBandwidth>16</networkBandwidth>
                  </computer>
                  <requiredCpuPower>1</requiredCpuPower>
                  <requiredMemory>1</requiredMemory>
                  <requiredNetworkBandwidth>3</requiredNetworkBandwidth>
            </processList>
            <processList>
                  <computer>
                        <cost>4800</cost>
                        <cpuPower>24</cpuPower>
                        <memory>96</memory>
                        <name>Dell Server 1</name>
                        <networkBandwidth>16</networkBandwidth>
                  </computer>
                  <requiredCpuPower>1</requiredCpuPower>
                  <requiredMemory>2</requiredMemory>
                  <requiredNetworkBandwidth>11</requiredNetworkBandwidth>
            </processList>
            <processList>
                  <computer>
                        <cost>4800</cost>
                        <cpuPower>24</cpuPower>
                        <memory>96</memory>
                        <name>Dell Server 1</name>
                        <networkBandwidth>16</networkBandwidth>
                  </computer>
                  <requiredCpuPower>1</requiredCpuPower>
                  <requiredMemory>1</requiredMemory>
                  <requiredNetworkBandwidth>1</requiredNetworkBandwidth>
            </processList>
            <processList>
                  <computer>
                        <cost>660</cost>
                        <cpuPower>6</cpuPower>
                        <memory>4</memory>
                        <name>Dell Server 2</name>
                        <networkBandwidth>6</networkBandwidth>
                  </computer>
                  <requiredCpuPower>1</requiredCpuPower>
                  <requiredMemory>1</requiredMemory>
                  <requiredNetworkBandwidth>5</requiredNetworkBandwidth>
            </processList>
            <score>0hard/-5460soft</score>
      </best-solution>
</solver-instance>
</pre>


## ENJOY ;-) !!! 



