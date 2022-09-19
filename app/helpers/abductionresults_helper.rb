module AbductionresultsHelper
  def abducteds_by_gender
    column_chart Survivor.group(:abducted, :gender).size, stacked: true, height: '60rem', colors: ['#4fd97b','#d9534f'],
    library: {
      title: { text: 'Abductions by gender', style: {'color': '#ccc', 'fontSize': '18px'}},
      yAxis: { title: { text: 'Abdutions count', style: {"color": "#ccc", "fontSize": "12px"}}},
      xAxis: { title: { text: 'Gender', style: {"color": "#ccc", "fontSize": "12px"}}, labels: {style: {color: '#ccc', "fontSize": "14px"}}},
      legend: { itemStyle: { color: '#A0A0A0'}, itemHoverStyle: {color: '#FFF'}, itemHiddenStyle: {color: '#444'}},
      plotOptions: {column: {dataLabels: {enabled: true, style: {color: 'white',textOutline: 'transparent', fontSize: '12px'}, format: "{point.y} ({point.percentage:.1f}%)"}}}
    }
  end

  def abducteds_total
    pie_chart Survivor.group(:abducted).size, donut: true, height: '50rem', colors: ['#4fd97b','#d9534f'],textOutline: 'transparent',
    library: {
      title: { text: 'Total', style: {'color': '#ccc', 'fontSize': '18px'}},
      plotOptions: {pie: {dataLabels: {enabled: true, style: {color: 'white',textOutline: 'transparent', fontSize: '12px'}, format: "{point.y} ({point.percentage:.1f}%)"}}}
    }
  end
end


