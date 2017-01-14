eGraph = function(nodes, edges, title=NULL, tooltip="",size=c(100,100),opt = list())
{	
  data = lapply(split(nodes,seq_len(nrow(nodes))),as.list)
  link = lapply(split(edges,seq_len(nrow(edges))),as.list)
  names(data)=NULL
  names(link)=NULL
  opt$series = 
    list(
      type = "graph",
      data = data,
      links = link
    )
  
  
  opt$size = size
  ### output list format
  chart = htmlwidgets::createWidget(
    'echarts', opt,
    package = 'recharts', width = size[1], height = size[2],
    preRenderHook = function(instance) {
      instance
    }
  )
  chart = .addClass(chart, "eGraph")
  chart
}