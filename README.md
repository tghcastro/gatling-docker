# gatling-docker

## Running gatling

```shell
gatling.sh

gatling.sh --simulations-folder /opt/gatling/user-files/simulations/computerdatabase/ --simulation computerdatabase.BasicSimulation
```

### Gatling.sh help

```shell 
Usage: gatling [options]

  -h, --help               Show help (this message) and exit
  -nr, --no-reports        Runs simulation but does not generate reports
  -ro, --reports-only <directoryName>
                           Generates the reports for the simulation in <directoryName>
  -rsf, --resources-folder <directoryPath>
                           Uses <directoryPath> as the absolute path of the directory where resources are stored
  -rf, --results-folder <directoryPath>
                           Uses <directoryPath> as the absolute path of the directory where results are stored
  -sf, --simulations-folder <directoryPath>
                           Uses <directoryPath> to discover simulations that could be run
  -bf, --binaries-folder <directoryPath>
                           Uses <directoryPath> as the absolute path of the directory where Gatling should produce compiled binaries
  -s, --simulation <className>
                           Runs <className> simulation
  -rd, --run-description <description>
                           A short <description> of the run to include in the report
```

## Running gatling-docker

```shell

docker build -t gatling-docker .

docker run -it --rm -v /gatling/conf:/opt/gatling/conf -v /gatling/user-files:/opt/gatling/user-files -v /gatling/results:/opt/gatling/results gatling-docker

docker run --rm -it --entrypoint /bin/sh gatling-docker
```

