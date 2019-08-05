# RED HAT DECISION MANAGER 7 - AN OPTAPLANNER DEMO PROJECT

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
&lt;solver-instance&gt;
	&lt;solver-config-file&gt;com/myspace/plannerdemo/Solver.solver.xml&lt;/solver-config-file&gt;
&lt;/solver-instance&gt;
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
	"name": "RHEL Server 1",
        "cpuPower": 24,
        "memory": 96,
        "networkBandwidth": 16,
        "cost": 4800
      },
      {
	"name": "RHEL Server 2",
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
&lt;?xml version="1.0" encoding="UTF-8" standalone="yes"?&gt;
&lt;solver-instance&gt;
      &lt;container-id&gt;plannerDemo_1.0.0-SNAPSHOT&lt;/container-id&gt;
      &lt;solver-id&gt;myplanner&lt;/solver-id&gt;
      &lt;solver-config-file&gt;com/myspace/plannerdemo/Solver.solver.xml&lt;/solver-config-file&gt;
      &lt;status&gt;SOLVING&lt;/status&gt;
      &lt;score scoreClass="org.optaplanner.core.api.score.buildin.hardsoft.HardSoftScore"&gt;0hard/-5460soft&lt;/score&gt;
      &lt;best-solution xsi:type="solution" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"&gt;
            &lt;computerList&gt;
                  &lt;cost&gt;4800&lt;/cost&gt;
                  &lt;cpuPower&gt;24&lt;/cpuPower&gt;
                  &lt;memory&gt;96&lt;/memory&gt;
                  &lt;name&gt;Dell Server 1&lt;/name&gt;
                  &lt;networkBandwidth&gt;16&lt;/networkBandwidth&gt;
            &lt;/computerList&gt;
            &lt;computerList&gt;
                  &lt;cost&gt;660&lt;/cost&gt;
                  &lt;cpuPower&gt;6&lt;/cpuPower&gt;
                  &lt;memory&gt;4&lt;/memory&gt;
                  &lt;name&gt;Dell Server 2&lt;/name&gt;
                  &lt;networkBandwidth&gt;6&lt;/networkBandwidth&gt;
            &lt;/computerList&gt;
            &lt;processList&gt;
                  &lt;computer&gt;
                        &lt;cost&gt;660&lt;/cost&gt;
                        &lt;cpuPower&gt;6&lt;/cpuPower&gt;
                        &lt;memory&gt;4&lt;/memory&gt;
                        &lt;name&gt;Dell Server 2&lt;/name&gt;
                        &lt;networkBandwidth&gt;6&lt;/networkBandwidth&gt;
                  &lt;/computer&gt;
                  &lt;requiredCpuPower&gt;1&lt;/requiredCpuPower&gt;
                  &lt;requiredMemory&gt;1&lt;/requiredMemory&gt;
                  &lt;requiredNetworkBandwidth&gt;1&lt;/requiredNetworkBandwidth&gt;
            &lt;/processList&gt;
            &lt;processList&gt;
                  &lt;computer&gt;
                        &lt;cost&gt;4800&lt;/cost&gt;
                        &lt;cpuPower&gt;24&lt;/cpuPower&gt;
                        &lt;memory&gt;96&lt;/memory&gt;
                        &lt;name&gt;Dell Server 1&lt;/name&gt;
                        &lt;networkBandwidth&gt;16&lt;/networkBandwidth&gt;
                  &lt;/computer&gt;
                  &lt;requiredCpuPower&gt;3&lt;/requiredCpuPower&gt;
                  &lt;requiredMemory&gt;6&lt;/requiredMemory&gt;
                  &lt;requiredNetworkBandwidth&gt;1&lt;/requiredNetworkBandwidth&gt;
            &lt;/processList&gt;
            &lt;processList&gt;
                  &lt;computer&gt;
                        &lt;cost&gt;4800&lt;/cost&gt;
                        &lt;cpuPower&gt;24&lt;/cpuPower&gt;
                        &lt;memory&gt;96&lt;/memory&gt;
                        &lt;name&gt;Dell Server 1&lt;/name&gt;
                        &lt;networkBandwidth&gt;16&lt;/networkBandwidth&gt;
                  &lt;/computer&gt;
                  &lt;requiredCpuPower&gt;1&lt;/requiredCpuPower&gt;
                  &lt;requiredMemory&gt;1&lt;/requiredMemory&gt;
                  &lt;requiredNetworkBandwidth&gt;3&lt;/requiredNetworkBandwidth&gt;
            &lt;/processList&gt;
            &lt;processList&gt;
                  &lt;computer&gt;
                        &lt;cost&gt;4800&lt;/cost&gt;
                        &lt;cpuPower&gt;24&lt;/cpuPower&gt;
                        &lt;memory&gt;96&lt;/memory&gt;
                        &lt;name&gt;Dell Server 1&lt;/name&gt;
                        &lt;networkBandwidth&gt;16&lt;/networkBandwidth&gt;
                  &lt;/computer&gt;
                  &lt;requiredCpuPower&gt;1&lt;/requiredCpuPower&gt;
                  &lt;requiredMemory&gt;2&lt;/requiredMemory&gt;
                  &lt;requiredNetworkBandwidth&gt;11&lt;/requiredNetworkBandwidth&gt;
            &lt;/processList&gt;
            &lt;processList&gt;
                  &lt;computer&gt;
                        &lt;cost&gt;4800&lt;/cost&gt;
                        &lt;cpuPower&gt;24&lt;/cpuPower&gt;
                        &lt;memory&gt;96&lt;/memory&gt;
                        &lt;name&gt;Dell Server 1&lt;/name&gt;
                        &lt;networkBandwidth&gt;16&lt;/networkBandwidth&gt;
                  &lt;/computer&gt;
                  &lt;requiredCpuPower&gt;1&lt;/requiredCpuPower&gt;
                  &lt;requiredMemory&gt;1&lt;/requiredMemory&gt;
                  &lt;requiredNetworkBandwidth&gt;1&lt;/requiredNetworkBandwidth&gt;
            &lt;/processList&gt;
            &lt;processList&gt;
                  &lt;computer&gt;
                        &lt;cost&gt;660&lt;/cost&gt;
                        &lt;cpuPower&gt;6&lt;/cpuPower&gt;
                        &lt;memory&gt;4&lt;/memory&gt;
                        &lt;name&gt;Dell Server 2&lt;/name&gt;
                        &lt;networkBandwidth&gt;6&lt;/networkBandwidth&gt;
                  &lt;/computer&gt;
                  &lt;requiredCpuPower&gt;1&lt;/requiredCpuPower&gt;
                  &lt;requiredMemory&gt;1&lt;/requiredMemory&gt;
                  &lt;requiredNetworkBandwidth&gt;5&lt;/requiredNetworkBandwidth&gt;
            &lt;/processList&gt;
            &lt;score&gt;0hard/-5460soft&lt;/score&gt;
      &lt;/best-solution&gt;
&lt;/solver-instance&gt;
</pre>


## ENJOY ;-) !!! 



