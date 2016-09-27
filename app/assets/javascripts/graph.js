

function draw(data) {
    // data = JSON.parse(data);
    data = data.data
        console.log(data);
    var width = 420,
        barHeight = 20;

    var xGenerate = d3.scaleLinear()
        .range([0, width])
        .domain([0, 10]);

    var chart = d3.select("svg")
        .attr("width", width)

    var bar = chart.selectAll("g")
        .data(data)
        .enter().append("g")
        .attr("transform", function (d, i) {
                  return "translate(0," + i * barHeight + ")";
              });

    bar.append("rect")
        .attr("width", xGenerate)
        .attr("height", barHeight - 1)
        .style("fill", "green")

    bar.append("text")
        .attr("x", function (d) {
                  return xGenerate(d) - 10;
              })
        .attr("y", barHeight / 2)
        .attr("dy", ".35em")
        .style("fill", "white")
        .text(function (d) {
                  return d;
              });
}



















