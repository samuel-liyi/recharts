eGraph = function(nodes, edges, title="", name="",focusNodeAdjacency=TRUE
                  ,symbolSize=100,tooltip=TRUE,size=c(400,400),opt = list())
{	
  data = lapply(split(nodes,seq_len(nrow(nodes))),as.list)
  link = lapply(split(edges,seq_len(nrow(edges))),as.list)
  names(data)=NULL
  names(link)=NULL
  opt$name = name
  opt$focusNodeAdjacency = TRUE
  opt$tooltip = list(show = tooltip)
  opt$series = 
    list(
      type = "graph",
      symbolSize = symbolSize,
      data = data,
      links = link,
      label = list(normal = list(show = TRUE)),
      edgeSymbol = c('circle', 'arrow')
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